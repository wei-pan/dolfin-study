// Copyright (C) 2012 Anders Logg
//
// This file is part of DOLFIN.
//
// DOLFIN is free software: you can redistribute it and/or modify
// it under the terms of the GNU Lesser General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// DOLFIN is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
// GNU Lesser General Public License for more details.
//
// You should have received a copy of the GNU Lesser General Public License
// along with DOLFIN. If not, see <http://www.gnu.org/licenses/>.
//
// Unit tests for matrix-free linear solvers (LinearOperator)

#include <dolfin.h>
#include "forms/ReactionDiffusion.h"
#include "forms/ReactionDiffusionAction.h"
#include <catch.hpp>

using namespace dolfin;

//-----------------------------------------------------------------------------
TEST_CASE("Testing LinearOperator", "[linear_operator]")
{
  // Backends supporting the LinearOperator interface
  //std::vector<std::string> backends = {"PETSc", "Eigen"};
  std::vector<std::string> backends = {"PETSc"};

  // Define linear operator
  class MyLinearOperator : public LinearOperator
  {
  public:

    MyLinearOperator(Form& a_action, Function& u)
      : LinearOperator(*u.vector(), *u.vector()),
        a_action(a_action), u(u)
    {
      // Do nothing
    }

    std::size_t size(std::size_t dim) const
    { return u.function_space()->dim(); }

    void mult(const GenericVector& x, GenericVector& y) const
    {
      // Update coefficient vector
      *u.vector() = x;

      // Assemble action
      Assembler assembler;
      assembler.assemble(y, a_action);
    }

  private:

    Form& a_action;
    Function& u;

  };

  SECTION("using linear operator")
  {
    // Iterate over backends supporting linear operators
    for (std::size_t i = 0; i < backends.size(); i++)
    {
      // Check whether backend is available
      if (!has_linear_algebra_backend(backends[i]))
        continue;

      // Skip testing Eigen in parallel
      if (dolfin::MPI::size(MPI_COMM_WORLD) > 1
          && backends[i] == "Eigen")
      {
        info("Not running Eigen test in parallel");
        continue;
      }

      // Set linear algebra backend
      parameters["linear_algebra_backend"] = backends[i];

      // Compute reference value by solving ordinary linear system
      auto mesh = std::make_shared<UnitSquareMesh>(8, 8);
      auto V = std::make_shared<ReactionDiffusion::FunctionSpace>(mesh);
      ReactionDiffusion::BilinearForm a(V, V);
      ReactionDiffusion::LinearForm L(V);
      auto f = std::make_shared<Constant>(1.0);
      L.f = f;
      Matrix A;
      Vector x, b;
      assemble(A, a);
      assemble(b, L);
      solve(A, x, b, "gmres", "none");
      const double norm_ref = norm(x, "l2");

      //continue;

      // Solve using linear operator defined by form action
      ReactionDiffusionAction::LinearForm a_action(V);
      auto u = std::make_shared<Function>(V);
      a_action.u = u;
      MyLinearOperator O(a_action, *u);
      solve(O, x, b, "gmres", "none");
      const double norm_action = norm(x, "l2");

      // Check results
      CHECK(norm_ref == Approx(norm_action));
    }
  }
}
//-----------------------------------------------------------------------------
