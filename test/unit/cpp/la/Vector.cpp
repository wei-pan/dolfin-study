// Copyright (C) 2007 Johan Hake
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
// Unit tests Selected methods for GenericVector

#include <dolfin.h>
#include <catch.hpp>

using namespace dolfin;

namespace
{
  void _test_operators(MPI_Comm comm)
  {
    Vector v(comm, 10), u(comm, 10);
    v = 0.0;
    u = 0.0;
    CHECK(v.sum() == 0.0);

    // operator=(double a)
    v = 1.0;
    CHECK(v.sum() == v.size());

    // operator=(const GenericVector& x)
    u = v;
    CHECK(u.sum() == u.size());

    // operator+=(const GenericVector& x)
    u += v;
    CHECK(u.sum() == 2*u.size());

    // operator-=(const GenericVector& x)
    u -= v;
    u -= v;
    CHECK(u.sum() == 0.0);

  // operator*=(double a)
    v *= 5.0;
    CHECK(v.sum() == v.size()*5.0);

    // operator/=(double a)
    v /= 2.0;
    CHECK(v.sum() == 2.5*v.size());

    // operator*=(const GenericVector& x)
    u = 2.0;
    v*=u;
    CHECK(v.sum() == v.size()*5.0);
  }
}


TEST_CASE("Test Vector", "[test_vector]")
{
  SECTION("backends")
  {
    // Eigen
    parameters["linear_algebra_backend"] = "Eigen";
    _test_operators(MPI_COMM_SELF);

    // PETSc
#ifdef HAS_PETSC
    parameters["linear_algebra_backend"] = "PETSc";
    _test_operators(MPI_COMM_WORLD);
#endif
  }

  SECTION("init")
  {
    // Create local and distributed vector layouts

    // Create local vector layout
    TensorLayout layout_local(MPI_COMM_SELF, 0, TensorLayout::Sparsity::DENSE);
    std::vector<std::shared_ptr<const IndexMap>> index_maps(1);
    index_maps[0].reset(new IndexMap(MPI_COMM_SELF, 203, 1));
    layout_local.init(index_maps, TensorLayout::Ghosts::UNGHOSTED);

    // Create distributed vector layout
    TensorLayout layout_distributed(MPI_COMM_WORLD, 0, TensorLayout::Sparsity::DENSE);
    auto lrange = dolfin::MPI::local_range(MPI_COMM_WORLD, 203);
    std::size_t nlocal = lrange.second - lrange.first;
    index_maps[0].reset(new IndexMap(MPI_COMM_SELF, nlocal, 1));
    layout_distributed.init(index_maps, TensorLayout::Ghosts::UNGHOSTED);

    // Vector
#ifdef HAS_PETSC
    parameters["linear_algebra_backend"] = "PETSc";
    {
      Vector x;
      x.init(layout_local);
      CHECK(x.size() == (std::size_t) 203);

      Vector y;
      y.init(layout_distributed);
      CHECK(x.size() == (std::size_t) 203);
    }
#endif

    // Eigen
    {
      EigenVector x;
      x.init(layout_local);
      CHECK(x.size() == (std::size_t) 203);
    }

    // PETSc
#ifdef HAS_PETSC
    {
      PETScVector x;
      x.init(layout_local);
      CHECK(x.size() == (std::size_t) 203);

      PETScVector y;
      y.init(layout_distributed);
      CHECK(y.size() == (std::size_t) 203);
    }
#endif
  }

  SECTION("test_get_local_empty")
  {
    // Create local and distributed vector layouts
    const std::vector<std::size_t> dims(1, 203);

    // Create local vector layout
    TensorLayout layout_local(MPI_COMM_SELF, 0, TensorLayout::Sparsity::DENSE);
    std::vector<std::shared_ptr<const IndexMap>> index_maps(1);
    index_maps[0].reset(new IndexMap(MPI_COMM_SELF, 203, 1));
    layout_local.init(index_maps, TensorLayout::Ghosts::UNGHOSTED);

    // Create distributed vector layout
    TensorLayout layout_distributed(MPI_COMM_WORLD, 0, TensorLayout::Sparsity::DENSE);
    auto lrange = dolfin::MPI::local_range(MPI_COMM_WORLD, 203);
    std::size_t nlocal = lrange.second - lrange.first;
    index_maps[0].reset(new IndexMap(MPI_COMM_SELF, nlocal, 1));
    layout_distributed.init(index_maps, TensorLayout::Ghosts::UNGHOSTED);

    // Vector
#ifdef HAS_PETSC
    parameters["linear_algebra_backend"] = "PETSc";
    {
      Vector x;
      x.init(layout_local);
      CHECK(x.size() == (std::size_t) 203);

      Vector y;
      y.init(layout_distributed);
      CHECK(y.size() == (std::size_t) 203);

      //:get_local(double* block, std::size_t m,
      //           const dolfin::la_index* rows) const

      double* block = NULL;
      dolfin::la_index* rows = NULL;
      x.get_local(block, 0, rows);
      y.get_local(block, 0, rows);
    }
#endif
  }

}
