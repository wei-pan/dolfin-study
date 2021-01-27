"""Unit tests for SubDomain"""

# Copyright (C) 2013 Johan Hake
#
# This file is part of DOLFIN.
#
# DOLFIN is free software: you can redistribute it and/or modify
# it under the terms of the GNU Lesser General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# DOLFIN is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU Lesser General Public License for more details.
#
# You should have received a copy of the GNU Lesser General Public License
# along with DOLFIN. If not, see <http://www.gnu.org/licenses/>.


import numpy as np
from dolfin import *
from dolfin_utils.test import skip_in_parallel
import pytest


def test_compiled_subdomains():
    def noDefaultValues():
        CompiledSubDomain("a")

    def wrongDefaultType():
        CompiledSubDomain("a", a="1")

    def wrongParameterNames():
        CompiledSubDomain("foo", bar=1.0)

    with pytest.raises(RuntimeError):
        noDefaultValues()
    with pytest.raises(TypeError):
        wrongDefaultType()
    with pytest.raises(RuntimeError):
        wrongParameterNames()


@skip_in_parallel
def test_compiled_subdomains_compilation_failure():
    def invalidCppCode():
        CompiledSubDomain("/")
    with pytest.raises(RuntimeError):
        invalidCppCode()

def test_creation_and_marking():

    class Left(SubDomain):
        def inside(self, x, on_boundary):
            return x[0] < DOLFIN_EPS

    class LeftOnBoundary(SubDomain):
        def inside(self, x, on_boundary):
            return x[0] < DOLFIN_EPS and on_boundary

    class Right(SubDomain):
        def inside(self, x, on_boundary):
            return x[0] > 1.0 - DOLFIN_EPS

    class RightOnBoundary(SubDomain):
        def inside(self, x, on_boundary):
            return x[0] > 1.0 - DOLFIN_EPS and on_boundary

    cpp_code = """
        #include<pybind11/pybind11.h>
        #include<pybind11/eigen.h>
        namespace py = pybind11;

        #include<Eigen/Dense>
        #include<dolfin/mesh/SubDomain.h>

        class Left : public dolfin::SubDomain
        {
        public:

          virtual bool inside(Eigen::Ref<const Eigen::VectorXd> x, bool on_boundary) const
          {
            return x[0] < DOLFIN_EPS;
          }
        };

        class LeftOnBoundary : public dolfin::SubDomain
        {
        public:

          virtual bool inside(Eigen::Ref<const Eigen::VectorXd> x, bool on_boundary) const
          {
            return x[0] < DOLFIN_EPS and on_boundary;
          }
        };

        class Right : public dolfin::SubDomain
        {
        public:

          virtual bool inside(Eigen::Ref<const Eigen::VectorXd> x, bool on_boundary) const
          {
            return x[0] > 1.0 - DOLFIN_EPS;
          }
        };

        class RightOnBoundary : public dolfin::SubDomain
        {
        public:

          virtual bool inside(Eigen::Ref<const Eigen::VectorXd> x, bool on_boundary) const
          {
            return x[0] > 1.0 - DOLFIN_EPS and on_boundary;
          }
        };

    PYBIND11_MODULE(SIGNATURE, m) {
       //py::object SubDomain = (py::object) py::module::import("dolfin").attr("SubDomain");
       py::class_<dolfin::SubDomain>(m, "SubDomain", py::module_local());
       py::class_<Left, std::unique_ptr<Left>, dolfin::SubDomain>(m, "Left").def(py::init<>());
       py::class_<Right, std::unique_ptr<Right>, dolfin::SubDomain>(m, "Right").def(py::init<>());
       py::class_<LeftOnBoundary, std::unique_ptr<LeftOnBoundary>, dolfin::SubDomain>(m, "LeftOnBoundary").def(py::init<>());
       py::class_<RightOnBoundary, std::unique_ptr<RightOnBoundary>, dolfin::SubDomain>(m, "RightOnBoundary").def(py::init<>());
    }
    """

    compiled_domain_module = compile_cpp_code(cpp_code)

    subdomain_pairs = [(Left(), Right()),
                       (LeftOnBoundary(), RightOnBoundary()),
                       (AutoSubDomain(lambda x, on_boundary: x[0] < DOLFIN_EPS),
                        AutoSubDomain(lambda x, on_boundary: x[0] > 1.0 - DOLFIN_EPS)),
                       (AutoSubDomain(lambda x, on_boundary: x[0] < DOLFIN_EPS and on_boundary),
                        AutoSubDomain(lambda x, on_boundary: x[0] > 1.0 - DOLFIN_EPS and on_boundary)),
                       (CompiledSubDomain("near(x[0], _a)", _a=0.0),
                        CompiledSubDomain("near(x[0], _a)", _a=1.0)),
                       (CompiledSubDomain("near(x[0], _a) and on_boundary", _a=0.0),
                        CompiledSubDomain("near(x[0], _a) and on_boundary", _a=1.0)),
                       (CompiledSubDomain("near(x[0], 0.0)"),
                        CompiledSubDomain("near(x[0], 1.0)")),
                       (CompiledSubDomain("near(x[0], 0.0) and on_boundary"),
                        CompiledSubDomain("near(x[0], 1.0) and on_boundary")),
                       #
                       # (compiled_domain_module.Left(),
                       #  compiled_domain_module.Right()),
                       # (compiled_domain_module.LeftOnBoundary(),
                       #  compiled_domain_module.RightOnBoundary())
    ]

    empty = CompiledSubDomain("false")
    every = CompiledSubDomain("true")

    for ind, MeshClass in enumerate([UnitIntervalMesh, UnitSquareMesh,
                                     UnitCubeMesh]):
        dim = ind + 1
        args = [10]*dim
        mesh = MeshClass(*args)

        mesh.init()

        for left, right in subdomain_pairs:
            for t_dim, f_dim in [(0, 0),
                                    (mesh.topology().dim()-1, dim - 1),
                                    (mesh.topology().dim(), dim)]:
                f = MeshFunction("size_t", mesh, t_dim, 0)

                left.mark(f, int(1))
                right.mark(f, 2)

                correct = {(1, 0): 1,
                           (1, 1): 0,
                           (2, 0): 11,
                           (2, 1): 10,
                           (2, 2): 0,
                           (3, 0): 121,
                           (3, 2): 200,
                           (3, 3): 0}

                # Check that the number of marked entities are at least the
                # correct number (it can be larger in parallel)
                assert all(value >= correct[dim, f_dim]
                for value in [
                        MPI.sum(mesh.mpi_comm(), float((f.array() == 2).sum())),
                        MPI.sum(mesh.mpi_comm(), float((f.array() == 1).sum())),
                ])

        for t_dim, f_dim in [(0, 0),
                                (mesh.topology().dim()-1, dim-1),
                                (mesh.topology().dim(), dim)]:
            f = MeshFunction("size_t", mesh, t_dim, 0)#

            empty.mark(f, 1)
            every.mark(f, 2)

            # Check that the number of marked entities is correct
            assert sum(f.array() == 1) == 0
            assert sum(f.array() == 2) == mesh.num_entities(f_dim)

# Skipping in parallel due to lack of parallel support for SubMesh
@skip_in_parallel
def test_snap_boundary():

    # This test checks whether the expected modifications are made
    # to mesh vertex coordinates when snap_boundary is called.

    for ind, MeshClass in enumerate([UnitIntervalMesh, UnitSquareMesh,
                                     UnitCubeMesh]):
        # SubDomain whose snap method modifies all coordinate components
        # to be zero.
        dim = ind+1
        class ZeroSnap(SubDomain):
            def inside(self,x,on_boundary):
                return True
            def snap(self,x):
                for i in range(0,dim):
                    x[i] = 0.0

        # Create mesh and modify coordinates via snapping.  Note that all vertices
        # are on the boundary.
        args = [1,]*dim
        mesh = MeshClass(*args)
        mesh.snap_boundary(ZeroSnap())

        # Verify that all mesh coordinates are now zero.
        for x in mesh.coordinates():
            for x_i in x:
                assert x_i==0.0
    
