// Copyright (C) 2017 Chris Richardson and Garth N. Wells
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

#include <iostream>
#include <memory>
#include <Eigen/Dense>
#include <pybind11/pybind11.h>
#include <pybind11/eigen.h>
#include <pybind11/numpy.h>
#include <pybind11/pytypes.h>
#include <pybind11/stl.h>
#include <pybind11/cast.h>

#ifdef HAS_PYBIND11_PETSC4PY
#include <petsc4py/petsc4py.h>
#endif

#include <ufc.h>
#include <dolfin/fem/fem_utils.h>
#include <dolfin/fem/assemble.h>
#include <dolfin/fem/assemble_local.h>
#include <dolfin/fem/Assembler.h>
#include <dolfin/fem/MultiMeshAssembler.h>
#include <dolfin/fem/MixedAssembler.h>
#include <dolfin/fem/DirichletBC.h>
#include <dolfin/fem/DiscreteOperators.h>
#include <dolfin/fem/DofMap.h>
#include <dolfin/fem/MultiMeshDofMap.h>
#include <dolfin/fem/FiniteElement.h>
#include <dolfin/fem/Form.h>
#include <dolfin/fem/MultiMeshForm.h>
#include <dolfin/fem/LinearVariationalProblem.h>
#include <dolfin/fem/LinearVariationalSolver.h>
#include <dolfin/fem/MixedLinearVariationalProblem.h>
#include <dolfin/fem/MixedLinearVariationalSolver.h>
#include <dolfin/fem/LocalSolver.h>
#include <dolfin/fem/NonlinearVariationalProblem.h>
#include <dolfin/fem/NonlinearVariationalSolver.h>
#include <dolfin/fem/MixedNonlinearVariationalProblem.h>
#include <dolfin/fem/MixedNonlinearVariationalSolver.h>
#include <dolfin/fem/PETScDMCollection.h>
#include <dolfin/fem/PointSource.h>
#include <dolfin/fem/SparsityPatternBuilder.h>
#include <dolfin/fem/SystemAssembler.h>
#include <dolfin/function/GenericFunction.h>
#include <dolfin/function/FunctionSpace.h>
#include <dolfin/function/MultiMeshFunctionSpace.h>
#include <dolfin/function/Function.h>
#include <dolfin/function/MultiMeshFunction.h>
#include <dolfin/la/GenericMatrix.h>
#include <dolfin/la/GenericVector.h>
#include <dolfin/la/GenericTensor.h>
#include <dolfin/la/SparsityPattern.h>
#include <dolfin/mesh/Mesh.h>
#include <dolfin/mesh/MeshFunction.h>
#include <dolfin/mesh/MultiMesh.h>
#include <dolfin/fem/MultiMeshDirichletBC.h>
#include <dolfin/mesh/SubDomain.h>
#include <dolfin/adaptivity/adapt.h>
#include <dolfin/la/PETScNestMatrix.h>

#include "casters.h"

namespace py = pybind11;

namespace dolfin_wrappers
{
  void fem(py::module& m)
  {
    // UFC objects
    py::class_<ufc::finite_element, std::shared_ptr<ufc::finite_element>>
      (m, "ufc_finite_element", "UFC finite element object");
    py::class_<ufc::dofmap, std::shared_ptr<ufc::dofmap>>
      (m, "ufc_dofmap", "UFC dofmap object");
    py::class_<ufc::form, std::shared_ptr<ufc::form>>
      (m, "ufc_form", "UFC form object");

    // Adapt functions
    m.def("adapt", [](dolfin::Mesh mesh){return dolfin::adapt(mesh);},
	  "Mapping between parent and child entities has to be set in refined mesh. See various refinement algorithms and `parameters['refinement_algorithm']`.");
    m.def("adapt", [](const dolfin::MeshFunction<std::size_t>& mesh_function,
		      std::shared_ptr<const dolfin::Mesh> adapted_mesh)
	  {
	    return dolfin::adapt(mesh_function, adapted_mesh);});

    // Function to convert pointers (from JIT usually) to UFC objects
    m.def("make_ufc_finite_element",
          [](std::uintptr_t e)
          {
            ufc::finite_element * p = reinterpret_cast<ufc::finite_element *>(e);
            return std::shared_ptr<const ufc::finite_element>(p);
          });

    m.def("make_ufc_dofmap",
          [](std::uintptr_t e)
          {
            ufc::dofmap * p = reinterpret_cast<ufc::dofmap *>(e);
            return std::shared_ptr<const ufc::dofmap>(p);
          });

    m.def("make_ufc_form",
          [](std::uintptr_t e)
          {
            ufc::form * p = reinterpret_cast<ufc::form *>(e);
            return std::shared_ptr<const ufc::form>(p);
          });

    // dolfin::FiniteElement
    py::class_<dolfin::FiniteElement, std::shared_ptr<dolfin::FiniteElement>>
      (m, "FiniteElement", "DOLFIN FiniteElement object")
      .def(py::init<std::shared_ptr<const ufc::finite_element>>())
      .def("num_sub_elements", &dolfin::FiniteElement::num_sub_elements)
      .def("evaluate_dofs", [](const dolfin::FiniteElement& self, py::object f,
                               py::array_t<double> coordinate_dofs,
                               int cell_orientation, const dolfin::Cell& c)
           {
             const ufc::function* _f = nullptr;
             if (py::hasattr(f, "_cpp_object"))
               _f = f.attr("_cpp_object").cast<ufc::function*>();
             else
               _f = f.cast<ufc::function*>();

             ufc::cell ufc_cell;
             c.get_cell_data(ufc_cell);
             py::array_t<double, py::array::c_style> dofs(self.space_dimension());
             self.evaluate_dofs(dofs.mutable_data(), *_f,
                                coordinate_dofs.data(), cell_orientation, ufc_cell);
             return dofs;
           }, "Evaluate degrees of freedom on element for a given function")
      .def("tabulate_dof_coordinates", [](const dolfin::FiniteElement& self, const dolfin::Cell& cell)
           {
             // Get cell vertex coordinates
             std::vector<double> coordinate_dofs;
             cell.get_coordinate_dofs(coordinate_dofs);

             // Tabulate the coordinates
             boost::multi_array<double, 2> _dof_coords;
             self.tabulate_dof_coordinates(_dof_coords, coordinate_dofs, cell);

             // Copy data and return
             typedef Eigen::Array<double, Eigen::Dynamic, Eigen::Dynamic, Eigen::RowMajor> EigenArray;
             EigenArray dof_coords = Eigen::Map<EigenArray>(_dof_coords.data(),
                                                            _dof_coords.shape()[0],
                                                            _dof_coords.shape()[1]);
             return dof_coords;
           }, "Tabulate coordinates of dofs on cell")
      .def("evaluate_basis", [](const dolfin::FiniteElement& self, int i,
                                const py::array_t<double> x,
                                const py::array_t<double> coordinate_dofs,
                                int cell_orientation)
           {
             auto ufc_element = self.ufc_element();
             const std::size_t size = ufc_element->value_size();
             py::array_t<double, py::array::c_style> values(size);
             self.evaluate_basis(i, values.mutable_data(), x.data(), coordinate_dofs.data(),
                                 cell_orientation);
             return values;
           }, "Evaluate basis function i at given point x in cell.")
     .def("evaluate_basis_all", [](const dolfin::FiniteElement& self,
                               const py::array_t<double> x,
                               const py::array_t<double> coordinate_dofs,
                               int cell_orientation)
          {
            auto ufc_element = self.ufc_element();
            const std::size_t size = ufc_element->value_size();
            const std::size_t space_dimension = ufc_element->space_dimension();
            py::array_t<double, py::array::c_style> values(space_dimension*size);
            self.evaluate_basis_all(values.mutable_data(), x.data(), coordinate_dofs.data(),
                                cell_orientation);
            return values;
          }, "Evaluate order n derivatives of all basis functions at given point x in cell.")
      .def("evaluate_basis_derivatives", [](const dolfin::FiniteElement& self,
                                            int i, int order,
                                            const py::array_t<double> x,
                                            const py::array_t<double> coordinate_dofs,
                                            int cell_orientation)
           {
             auto ufc_element = self.ufc_element();

             const std::size_t gdim = self.geometric_dimension();
             const std::size_t num_derivs = pow(gdim, order);
             const std::size_t size = ufc_element->value_size()*num_derivs;
             py::array_t<double, py::array::c_style> values(size);
             self.evaluate_basis_derivatives(i, order, values.mutable_data(),
                                             x.data(), coordinate_dofs.data(),
                                             cell_orientation);
             return values;
           }, "Evaluate order n derivatives of basis function i at given point x in cell.")
      .def("evaluate_basis_derivatives_all", [](const dolfin::FiniteElement& self,
                                            int order,
                                            const py::array_t<double> x,
                                            const py::array_t<double> coordinate_dofs,
                                            int cell_orientation)
          {
            auto ufc_element = self.ufc_element();

            const std::size_t gdim = self.geometric_dimension();
            const std::size_t num_derivs = pow(gdim, order);
            const std::size_t size = ufc_element->value_size()*num_derivs;
            const std::size_t space_dimension = ufc_element->space_dimension();
            py::array_t<double, py::array::c_style> values(size*space_dimension);
            self.evaluate_basis_derivatives_all(order, values.mutable_data(),
                                            x.data(), coordinate_dofs.data(),
                                            cell_orientation);
            return values;
          }, "Evaluate all basis functions at given point x in cell.")

      .def("space_dimension", &dolfin::FiniteElement::space_dimension)
      .def("geometric_dimension", &dolfin::FiniteElement::geometric_dimension)
      .def("value_dimension", &dolfin::FiniteElement::value_dimension)
      .def("signature", &dolfin::FiniteElement::signature);

    // dolfin::GenericDofMap
    py::class_<dolfin::GenericDofMap, std::shared_ptr<dolfin::GenericDofMap>, dolfin::Variable>
      (m, "GenericDofMap", "DOLFIN DofMap object")
      .def("global_dimension", &dolfin::GenericDofMap::global_dimension,
           "The dimension of the global finite element function space")
      .def("index_map", &dolfin::GenericDofMap::index_map)
      .def("neighbours", &dolfin::GenericDofMap::neighbours)
      .def("off_process_owner", &dolfin::GenericDofMap::off_process_owner)
      .def("shared_nodes", &dolfin::GenericDofMap::shared_nodes)
      .def("cell_dofs", &dolfin::GenericDofMap::cell_dofs)
      .def("dofs", (std::vector<dolfin::la_index>(dolfin::GenericDofMap::*)() const)
           &dolfin::GenericDofMap::dofs)
      .def("dofs", (std::vector<dolfin::la_index>(dolfin::GenericDofMap::*)(const dolfin::Mesh&, std::size_t) const)
           &dolfin::GenericDofMap::dofs)
      .def("entity_dofs", (std::vector<dolfin::la_index>(dolfin::GenericDofMap::*)(const dolfin::Mesh&, std::size_t) const)
           &dolfin::GenericDofMap::entity_dofs)
      .def("entity_closure_dofs", (std::vector<dolfin::la_index>(dolfin::GenericDofMap::*)(const dolfin::Mesh&, std::size_t) const)
           &dolfin::GenericDofMap::entity_closure_dofs)
          .def("entity_dofs", (std::vector<dolfin::la_index>(dolfin::GenericDofMap::*)(const dolfin::Mesh&,
                                                                                   std::size_t,
                                                                                   const std::vector<std::size_t>&) const)
           &dolfin::GenericDofMap::entity_dofs)
          .def("entity_closure_dofs", (std::vector<dolfin::la_index>(dolfin::GenericDofMap::*)(const dolfin::Mesh&,
                                                                                           std::size_t,
                                                                                           const std::vector<std::size_t>&) const)
           &dolfin::GenericDofMap::entity_closure_dofs)
      .def("num_entity_dofs", &dolfin::GenericDofMap::num_entity_dofs)
      .def("tabulate_local_to_global_dofs", &dolfin::GenericDofMap::tabulate_local_to_global_dofs)
      .def("local_to_global_index", &dolfin::GenericDofMap::local_to_global_index)
      .def("local_to_global_unowned",
           [](dolfin::GenericDofMap& self) {
             return Eigen::Map<const Eigen::Matrix<std::size_t, Eigen::Dynamic, 1>>(
               self.local_to_global_unowned().data(),
               self.local_to_global_unowned().size()); },
           py::return_value_policy::reference_internal,
           "Return view into unowned part of local-to-global map")
      .def("clear_sub_map_data", &dolfin::GenericDofMap::clear_sub_map_data)
      .def("tabulate_entity_dofs", [](const dolfin::GenericDofMap& instance, std::size_t entity_dim,
                                      std::size_t cell_entity_index)
           {
             std::vector<std::size_t> dofs(instance.num_entity_dofs(entity_dim));
             instance.tabulate_entity_dofs(dofs, entity_dim, cell_entity_index);
             return py::array_t<std::size_t>(dofs.size(), dofs.data());
           })
      .def("block_size", &dolfin::GenericDofMap::block_size)
      .def("tabulate_local_to_global_dofs", [](const dolfin::GenericDofMap& instance)
           {
             std::vector<std::size_t> dofs;
             instance.tabulate_local_to_global_dofs(dofs);
             return py::array_t<std::size_t>(dofs.size(), dofs.data());
           })
      .def("set", &dolfin::GenericDofMap::set)
      .def_readonly("constrained_domain", &dolfin::GenericDofMap::constrained_domain);

    // dolfin::DofMap
    py::class_<dolfin::DofMap, std::shared_ptr<dolfin::DofMap>, dolfin::GenericDofMap>
      (m, "DofMap", "DOLFIN DofMap object")
      .def(py::init<std::shared_ptr<const ufc::dofmap>, const dolfin::Mesh&>())
      .def(py::init<std::shared_ptr<const ufc::dofmap>, const dolfin::Mesh&, std::shared_ptr<const dolfin::SubDomain>>())
      .def("ownership_range", &dolfin::DofMap::ownership_range)
      .def("cell_dofs", &dolfin::DofMap::cell_dofs);

    // dolfin::MultiMeshDofMap
    py::class_<dolfin::MultiMeshDofMap, std::shared_ptr<dolfin::MultiMeshDofMap>>
      (m, "MultiMeshDofMap", "DOLFIN MultiMeshDofMap object")
      .def(py::init())
      .def("inactive_dofs", &dolfin::MultiMeshDofMap::inactive_dofs);

    // dolfin::SparsityPatternBuilder
    py::class_<dolfin::SparsityPatternBuilder>(m, "SparsityPatternBuilder")
      .def_static("build", &dolfin::SparsityPatternBuilder::build,
                  py::arg("sparsity_pattern"), py::arg("mesh"),
                  py::arg("dofmaps"), py::arg("cells"),
                  py::arg("interior_facets"), py::arg("exterior_facets"),
                  py::arg("vertices"), py::arg("diagonal"),
                  py::arg("init")=true, py::arg("finalize")=true)
      .def_static("build", &dolfin::SparsityPatternBuilder::build_mixed,
                  py::arg("sparsity_pattern"), py::arg("mesh_ids"), py::arg("mesh"),
                  py::arg("dofmaps"), py::arg("cells"),
                  py::arg("interior_facets"), py::arg("exterior_facets"),
                  py::arg("vertices"), py::arg("diagonal"),
                  py::arg("init")=true, py::arg("finalize")=true);

    // dolfin::DirichletBC
    py::class_<dolfin::DirichletBC, std::shared_ptr<dolfin::DirichletBC>, dolfin::Variable>
      (m, "DirichletBC", "DOLFIN DirichletBC object")
      .def(py::init<const dolfin::DirichletBC&>())
      .def(py::init<std::shared_ptr<const dolfin::FunctionSpace>,
           std::shared_ptr<const dolfin::GenericFunction>,
           std::shared_ptr<const dolfin::SubDomain>, std::string, bool>(),
           py::arg("V"), py::arg("g"), py::arg("sub_domain"),
           py::arg("method")="topological", py::arg("check_midpoint")=true)
      .def(py::init<std::shared_ptr<const dolfin::FunctionSpace>,
           std::shared_ptr<const dolfin::GenericFunction>,
           std::shared_ptr<const dolfin::MeshFunction<std::size_t>>,
           std::size_t, std::string>(),
           py::arg("V"), py::arg("g"), py::arg("sub_domains"),
           py::arg("sub_domain"), py::arg("method")="topological")
      .def("function_space", &dolfin::DirichletBC::function_space)
      .def("homogenize", &dolfin::DirichletBC::homogenize)
      .def("method", &dolfin::DirichletBC::method)
      .def("zero", &dolfin::DirichletBC::zero)
      .def("markers", &dolfin::DirichletBC::markers)
      .def("zero_columns", &dolfin::DirichletBC::zero_columns,
           py::arg("A"), py::arg("b"), py::arg("diagonal_value")=0.0, py::arg("transpose")=false)
      .def("get_boundary_values", [](const dolfin::DirichletBC& instance)
           {
             dolfin::DirichletBC::Map map;
             instance.get_boundary_values(map);
             return map;
           })
      .def("apply", (void (dolfin::DirichletBC::*)(dolfin::GenericVector&) const)
           &dolfin::DirichletBC::apply)
      .def("apply", (void (dolfin::DirichletBC::*)(dolfin::GenericMatrix&) const)
           &dolfin::DirichletBC::apply)
      .def("apply", (void (dolfin::DirichletBC::*)(dolfin::GenericMatrix&, dolfin::GenericVector&) const)
           &dolfin::DirichletBC::apply)
      .def("apply", (void (dolfin::DirichletBC::*)(dolfin::GenericVector&, const dolfin::GenericVector&) const)
           &dolfin::DirichletBC::apply)
      .def("apply", (void (dolfin::DirichletBC::*)(dolfin::GenericMatrix&, dolfin::GenericVector&, const dolfin::GenericVector&) const)
           &dolfin::DirichletBC::apply)
      .def("user_sub_domain", &dolfin::DirichletBC::user_sub_domain)
      .def("set_value", &dolfin::DirichletBC::set_value)
      .def("set_value", [](dolfin::DirichletBC& self, py::object value)
           {
             auto _u = value.attr("_cpp_object").cast<std::shared_ptr<const dolfin::GenericFunction>>();
             self.set_value(_u);
           })
      .def("value", &dolfin::DirichletBC::value);


    // dolfin::MultiMeshDirichletBC
    py::class_<dolfin::MultiMeshDirichletBC, std::shared_ptr<dolfin::MultiMeshDirichletBC>>
      (m, "MultiMeshDirichletBC", "DOLFIN MultiMeshDirichletBC object")
      .def(py::init<const dolfin::MultiMeshDirichletBC&>())
      // Need to handle FunctionSpace and SubDomain coming from the Python layer
      // Probably better to make Python class for it similar to DirichletBC
      .def(py::init([](std::shared_ptr<const dolfin::MultiMeshFunctionSpace> V,
                       py::object g, std::shared_ptr<const dolfin::SubDomain> subdomain,
                       std::string method, bool check_midpoint,
                       bool exclude_overlapped_boundaries)
                    {
                      std::shared_ptr<const dolfin::GenericFunction> _g;
                      if (py::hasattr(g, "_cpp_object"))
                        _g = g.attr("_cpp_object").cast<std::shared_ptr<dolfin::GenericFunction>>();
                      else
                        _g = g.cast<std::shared_ptr<dolfin::GenericFunction>>();

                      return dolfin::MultiMeshDirichletBC(V, _g, subdomain, method,
                                                 check_midpoint, exclude_overlapped_boundaries);
                    }), py::arg("V"), py::arg("g"), py::arg("subdomain"),
                        py::arg("method")="topological",
                        py::arg("check_midpoint")=true,
                        py::arg("exclude_overlapped_boundaries")=true)
      .def(py::init<std::shared_ptr<const dolfin::MultiMeshFunctionSpace>,
           std::shared_ptr<const dolfin::GenericFunction>,
           std::shared_ptr<const dolfin::SubDomain>, std::string, bool, bool>(),
           py::arg("V"), py::arg("g"), py::arg("sub_domain"),
           py::arg("method")="topological", py::arg("check_midpoint")=true,
           py::arg("exclude_overlapped_boundaries")=true)
      .def(py::init<std::shared_ptr<const dolfin::MultiMeshFunctionSpace>,
           std::shared_ptr<const dolfin::GenericFunction>,
           std::shared_ptr<const dolfin::MeshFunction<std::size_t>>,
           std::size_t, std::size_t, std::string>(),
           py::arg("V"), py::arg("g"), py::arg("sub_domains"),
           py::arg("sub_domain"), py::arg("part"), py::arg("method")="topological")
      .def(py::init<std::shared_ptr<const dolfin::MultiMeshFunctionSpace>,
           std::shared_ptr<const dolfin::GenericFunction>,
           std::shared_ptr<const dolfin::SubDomain>, std::size_t, std::string, bool, bool>(),
           py::arg("V"), py::arg("g"), py::arg("sub_domain"), py::arg("part"),
           py::arg("method")="topological", py::arg("check_midpoint")=true,
           py::arg("exclude_overlapped_boundaries")=true)
      .def("function_space", &dolfin::MultiMeshDirichletBC::function_space)
      .def("homogenize", &dolfin::MultiMeshDirichletBC::homogenize)
      .def("zero", &dolfin::MultiMeshDirichletBC::zero)
      .def("apply", (void (dolfin::MultiMeshDirichletBC::*)(dolfin::GenericVector&) const)
           &dolfin::MultiMeshDirichletBC::apply)
      .def("apply", (void (dolfin::MultiMeshDirichletBC::*)(dolfin::GenericMatrix&) const)
           &dolfin::MultiMeshDirichletBC::apply)
      .def("apply", (void (dolfin::MultiMeshDirichletBC::*)(dolfin::GenericMatrix&, dolfin::GenericVector&) const)
           &dolfin::MultiMeshDirichletBC::apply)
      .def("apply", (void (dolfin::MultiMeshDirichletBC::*)(dolfin::GenericVector&, const dolfin::GenericVector&) const)
           &dolfin::MultiMeshDirichletBC::apply)
      .def("apply", (void (dolfin::MultiMeshDirichletBC::*)(dolfin::GenericMatrix&, dolfin::GenericVector&, const dolfin::GenericVector&) const)
           &dolfin::MultiMeshDirichletBC::apply);

    // dolfin::AssemblerBase
    py::class_<dolfin::AssemblerBase, std::shared_ptr<dolfin::AssemblerBase>>
      (m, "AssemblerBase")
      .def("init_global_tensor", &dolfin::AssemblerBase::init_global_tensor)
      .def_readwrite("add_values", &dolfin::Assembler::add_values)
      .def_readwrite("keep_diagonal", &dolfin::Assembler::keep_diagonal)
      .def_readwrite("finalize_tensor", &dolfin::Assembler::finalize_tensor);

    // dolfin::Assembler
    py::class_<dolfin::Assembler, std::shared_ptr<dolfin::Assembler>, dolfin::AssemblerBase>
      (m, "Assembler", "DOLFIN Assembler object")
      .def(py::init<>())
      .def("assemble", &dolfin::Assembler::assemble);

    // dolfin::MixedAssembler
    py::class_<dolfin::MixedAssembler, std::shared_ptr<dolfin::MixedAssembler>, dolfin::AssemblerBase>
      (m, "MixedAssembler", "DOLFIN MixedAssembler object")
      .def(py::init<>())
      .def("assemble", &dolfin::MixedAssembler::assemble);

    // dolfin::SystemAssembler
    py::class_<dolfin::SystemAssembler, std::shared_ptr<dolfin::SystemAssembler>, dolfin::AssemblerBase>
      (m, "SystemAssembler", "DOLFIN SystemAssembler object")
      .def(py::init<std::shared_ptr<const dolfin::Form>, std::shared_ptr<const dolfin::Form>,
           std::vector<std::shared_ptr<const dolfin::DirichletBC>>>())
      .def(py::init<std::vector<std::shared_ptr<const dolfin::Form>>, std::vector<std::shared_ptr<const dolfin::Form>>,
           std::vector<std::vector<std::shared_ptr<const dolfin::DirichletBC>>>>())
      .def("assemble", (void (dolfin::SystemAssembler::*)(dolfin::GenericMatrix&, dolfin::GenericVector&))
           &dolfin::SystemAssembler::assemble)
      .def("assemble", (void (dolfin::SystemAssembler::*)(std::vector<std::shared_ptr<dolfin::GenericMatrix>>, std::vector<std::shared_ptr<dolfin::GenericVector>>))
           &dolfin::SystemAssembler::assemble)
      .def("assemble", (void (dolfin::SystemAssembler::*)(dolfin::GenericMatrix&)) &dolfin::SystemAssembler::assemble)
      .def("assemble", (void (dolfin::SystemAssembler::*)(dolfin::GenericVector&)) &dolfin::SystemAssembler::assemble)
      .def("assemble", (void (dolfin::SystemAssembler::*)(dolfin::GenericMatrix&, dolfin::GenericVector&,
                                                          const dolfin::GenericVector&))
           &dolfin::SystemAssembler::assemble)
      .def("assemble", (void (dolfin::SystemAssembler::*)(dolfin::GenericVector&, const dolfin::GenericVector&))
           &dolfin::SystemAssembler::assemble);

    // dolfin::DiscreteOperators
    py::class_<dolfin::DiscreteOperators> (m, "DiscreteOperators")
      .def_static("build_gradient", &dolfin::DiscreteOperators::build_gradient)
      .def_static("build_gradient", [](py::object V0, py::object V1)
                  {
                    auto _V0 = V0.attr("_cpp_object").cast<dolfin::FunctionSpace*>();
                    auto _V1 = V1.attr("_cpp_object").cast<dolfin::FunctionSpace*>();
                    return dolfin::DiscreteOperators::build_gradient(*_V0, *_V1);
                  });

    // dolfin::Form
    py::class_<dolfin::Form, std::shared_ptr<dolfin::Form>>
      (m, "Form", "DOLFIN Form object")
      .def(py::init<std::size_t, std::size_t>())
      .def(py::init<std::shared_ptr<const ufc::form>,
	   std::vector<std::shared_ptr<const dolfin::FunctionSpace>>>())
      .def(py::init<std::size_t, std::size_t>())
      .def("function_spaces", &dolfin::Form::function_spaces, "Return function spaces for arguments")
      .def("function_space", &dolfin::Form::function_space, "Return function space for i-th argument")
      .def("num_coefficients", &dolfin::Form::num_coefficients, "Return number of coefficients in form")
      .def("original_coefficient_position", &dolfin::Form::original_coefficient_position)
      .def("set_coefficient", (void (dolfin::Form::*)(std::size_t, std::shared_ptr<const dolfin::GenericFunction>))
           &dolfin::Form::set_coefficient, "Doc")
      .def("set_coefficient", (void (dolfin::Form::*)(std::string, std::shared_ptr<const dolfin::GenericFunction>))
           &dolfin::Form::set_coefficient, "Doc")
      .def("set_mesh", &dolfin::Form::set_mesh)
      .def("set_cell_domains", &dolfin::Form::set_cell_domains)
      .def("set_exterior_facet_domains", &dolfin::Form::set_exterior_facet_domains)
      .def("set_interior_facet_domains", &dolfin::Form::set_interior_facet_domains)
      .def("set_vertex_domains", &dolfin::Form::set_vertex_domains)
      .def("rank", &dolfin::Form::rank)
      .def("mesh", &dolfin::Form::mesh);

    // dolfin::MultiMeshForm
    py::class_<dolfin::MultiMeshForm, std::shared_ptr<dolfin::MultiMeshForm>>
      (m, "MultiMeshForm", "DOLFIN MultiForm object")
      .def(py::init<std::shared_ptr<const dolfin::MultiMesh>>())
      .def(py::init<std::shared_ptr<const dolfin::MultiMeshFunctionSpace>>())
      .def(py::init<std::shared_ptr<const dolfin::MultiMeshFunctionSpace>,
                    std::shared_ptr<const dolfin::MultiMeshFunctionSpace>>())
      .def("add", &dolfin::MultiMeshForm::add)
      .def("build", &dolfin::MultiMeshForm::build)
      .def("set_multimesh_coefficient",  &dolfin::MultiMeshForm::set_multimesh_coefficient);
;

    // dolfin::MultiMeshAssembler
    py::class_<dolfin::MultiMeshAssembler, std::shared_ptr<dolfin::MultiMeshAssembler>>
      (m, "MultiMeshAssembler", "DOLFIN MultiMeshAssembler object")
      .def(py::init<>())
      .def("assemble", &dolfin::MultiMeshAssembler::assemble);

    // dolfin::PointSource
    py::class_<dolfin::PointSource, std::shared_ptr<dolfin::PointSource>>
      (m, "PointSource")
      // FIXME: consolidate down to one intialiser when switching from
      // SWIG to pybind11
      .def(py::init([](py::object V, const dolfin::Point& p, double value)
                    {
                      std::shared_ptr<const dolfin::FunctionSpace> _V;
                      if (py::hasattr(V, "_cpp_object"))
                        _V = V.attr("_cpp_object").cast<std::shared_ptr<dolfin::FunctionSpace>>();
                      else
                        _V = V.cast<std::shared_ptr<dolfin::FunctionSpace>>();

                      return dolfin::PointSource(_V, p, value);
                    }), py::arg("V"), py::arg("p"), py::arg("value"))
      .def(py::init([](py::object V0, py::object V1, const dolfin::Point& p, double value)
                    {
                      std::shared_ptr<const dolfin::FunctionSpace> _V0, _V1;
                      if (py::hasattr(V0, "_cpp_object"))
                        _V0 = V0.attr("_cpp_object").cast<std::shared_ptr<dolfin::FunctionSpace>>();
                      else
                        _V0 = V0.cast<std::shared_ptr<dolfin::FunctionSpace>>();

                      if (py::hasattr(V1, "_cpp_object"))
                        _V1 = V1.attr("_cpp_object").cast<std::shared_ptr<dolfin::FunctionSpace>>();
                      else
                        _V1 = V1.cast<std::shared_ptr<dolfin::FunctionSpace>>();

                      return dolfin::PointSource(_V0, _V1, p, value);
                    }), py::arg("V0"), py::arg("V1"), py::arg("p"), py::arg("value"))
      .def(py::init([](py::object V, const std::vector<std::pair<const dolfin::Point*, double>> values)
                    {
                      std::shared_ptr<const dolfin::FunctionSpace> _V;
                      if (py::hasattr(V, "_cpp_object"))
                        _V = V.attr("_cpp_object").cast<std::shared_ptr<dolfin::FunctionSpace>>();
                      else
                        _V = V.cast<std::shared_ptr<dolfin::FunctionSpace>>();

                      return dolfin::PointSource(_V, values);
                    }), py::arg("V"), py::arg("values"))
      .def(py::init([](py::object V0, py::object V1, const std::vector<std::pair<const dolfin::Point*, double>> values)
                    {
                      std::shared_ptr<const dolfin::FunctionSpace> _V0, _V1;
                      if (py::hasattr(V0, "_cpp_object"))
                        _V0 = V0.attr("_cpp_object").cast<std::shared_ptr<dolfin::FunctionSpace>>();
                      else
                        _V0 = V0.cast<std::shared_ptr<dolfin::FunctionSpace>>();

                      if (py::hasattr(V1, "_cpp_object"))
                        _V1 = V1.attr("_cpp_object").cast<std::shared_ptr<dolfin::FunctionSpace>>();
                      else
                        _V1 = V1.cast<std::shared_ptr<dolfin::FunctionSpace>>();

                      return dolfin::PointSource(_V0, _V1, values);
                    }), py::arg("V0"), py::arg("V1"), py::arg("values"))
      //
      //.def(py::init<std::shared_ptr<const dolfin::FunctionSpace>, const dolfin::Point&, double>(),
      //     py::arg("V"), py::arg("p"), py::arg("value"))
      //.def(py::init<std::shared_ptr<const dolfin::FunctionSpace>, std::shared_ptr<const dolfin::FunctionSpace>, const dolfin::Point&, double>(),
      //     py::arg("V0"), py::arg("V1"), py::arg("p"), py::arg("value"))
      //.def(py::init<std::shared_ptr<const dolfin::FunctionSpace>, const std::vector<std::pair<const dolfin::Point*, double>>>())
      //.def(py::init<std::shared_ptr<const dolfin::FunctionSpace>, std::shared_ptr<const dolfin::FunctionSpace>,
      //     const std::vector<std::pair<const dolfin::Point*, double>>>())
      .def("apply", (void (dolfin::PointSource::*)(dolfin::GenericVector&)) &dolfin::PointSource::apply)
      .def("apply", (void (dolfin::PointSource::*)(dolfin::GenericMatrix&)) &dolfin::PointSource::apply);

    // dolfin::LinearVariationalProblem
    py::class_<dolfin::LinearVariationalProblem,
               std::shared_ptr<dolfin::LinearVariationalProblem>>
      (m, "LinearVariationalProblem")
      .def(py::init<std::shared_ptr<const dolfin::Form>,
           std::shared_ptr<const dolfin::Form>,
           std::shared_ptr<dolfin::Function>,
           std::vector<std::shared_ptr<const dolfin::DirichletBC>>>())
      .def("bcs", &dolfin::LinearVariationalProblem::bcs);

    // dolfin::LinearVariationalSolver
    py::class_<dolfin::LinearVariationalSolver,
               std::shared_ptr<dolfin::LinearVariationalSolver>,
               dolfin::Variable>(m, "LinearVariationalSolver")
      .def(py::init<std::shared_ptr<dolfin::LinearVariationalProblem>>())
      .def("solve", &dolfin::LinearVariationalSolver::solve)
      .def("default_parameters", &dolfin::LinearVariationalSolver::default_parameters);

    // dolfin::MixedLinearVariationalProblem
    py::class_<dolfin::MixedLinearVariationalProblem,
               std::shared_ptr<dolfin::MixedLinearVariationalProblem>>
      (m, "MixedLinearVariationalProblem")
      .def(py::init<std::vector<std::vector<std::shared_ptr<const dolfin::Form>>>,
           std::vector<std::vector<std::shared_ptr<const dolfin::Form>>>,
           std::vector<std::shared_ptr<dolfin::Function>>,
           std::vector<std::shared_ptr<const dolfin::DirichletBC>>>())
      .def("bcs", (std::vector<std::shared_ptr<const dolfin::DirichletBC>>
		   (dolfin::MixedLinearVariationalProblem::*)(int) const) &dolfin::MixedLinearVariationalProblem::bcs)
      .def("bcs", (std::vector<std::vector<std::shared_ptr<const dolfin::DirichletBC>>>
		   (dolfin::MixedLinearVariationalProblem::*)() const) &dolfin::MixedLinearVariationalProblem::bcs);

    // dolfin::MixedLinearVariationalSolver
    py::class_<dolfin::MixedLinearVariationalSolver,
               std::shared_ptr<dolfin::MixedLinearVariationalSolver>,
               dolfin::Variable>(m, "MixedLinearVariationalSolver")
      .def(py::init<>())
      .def(py::init<std::shared_ptr<dolfin::MixedLinearVariationalProblem>>())
      .def("solve", (void (dolfin::MixedLinearVariationalSolver::*)())&dolfin::MixedLinearVariationalSolver::solve)
      .def("solve", (void (dolfin::MixedLinearVariationalSolver::*)
		     (std::tuple<std::vector<std::shared_ptr<dolfin::GenericMatrix>>,
		      std::vector<std::shared_ptr<dolfin::GenericVector>>,
		      std::vector<std::shared_ptr<dolfin::GenericVector>> >))&dolfin::MixedLinearVariationalSolver::solve)
      .def("assemble_system", (std::tuple<std::vector<std::shared_ptr<dolfin::GenericMatrix>>,
			       std::vector<std::shared_ptr<dolfin::GenericVector>>,
			       std::vector<std::shared_ptr<dolfin::GenericVector>> >
			       (dolfin::MixedLinearVariationalSolver::*)()) &dolfin::MixedLinearVariationalSolver::assemble_system);

    // dolfin::NonlinearVariationalProblem
    py::class_<dolfin::NonlinearVariationalProblem,
               std::shared_ptr<dolfin::NonlinearVariationalProblem>>
      (m, "NonlinearVariationalProblem")
      .def(py::init<std::shared_ptr<const dolfin::Form>,
           std::shared_ptr<dolfin::Function>,
           std::vector<std::shared_ptr<const dolfin::DirichletBC>>,
           std::shared_ptr<const dolfin::Form>>())
      // FIXME: is there a better way to handle the casting
      .def("set_bounds", (void (dolfin::NonlinearVariationalProblem::*)(std::shared_ptr<const dolfin::GenericVector>,
                                                                        std::shared_ptr<const dolfin::GenericVector>))
           &dolfin::NonlinearVariationalProblem::set_bounds)
      .def("set_bounds", (void (dolfin::NonlinearVariationalProblem::*)(const dolfin::Function&, const dolfin::Function&))
           &dolfin::NonlinearVariationalProblem::set_bounds)
      .def("set_bounds", [](dolfin::NonlinearVariationalProblem& self, py::object lb, py::object ub)
           {
             auto& _lb = lb.attr("_cpp_object").cast<dolfin::Function&>();
             auto& _ub = ub.attr("_cpp_object").cast<dolfin::Function&>();
             self.set_bounds(_lb, _ub);
           });


    // dolfin::NonlinearVariationalSolver
    py::class_<dolfin::NonlinearVariationalSolver,
               std::shared_ptr<dolfin::NonlinearVariationalSolver>,
               dolfin::Variable>
      (m, "NonlinearVariationalSolver")
      .def(py::init<std::shared_ptr<dolfin::NonlinearVariationalProblem>>())
      .def("solve", &dolfin::NonlinearVariationalSolver::solve)
      .def("default_parameters", &dolfin::NonlinearVariationalSolver::default_parameters);

    // dolfin::MixedNonlinearVariationalProblem
    py::class_<dolfin::MixedNonlinearVariationalProblem,
               std::shared_ptr<dolfin::MixedNonlinearVariationalProblem>>
      (m, "MixedNonlinearVariationalProblem")
      .def(py::init<std::vector<std::vector<std::shared_ptr<const dolfin::Form>>>,
           std::vector<std::shared_ptr<dolfin::Function>>,
           std::vector<std::shared_ptr<const dolfin::DirichletBC>>,
	   std::vector<std::vector<std::shared_ptr<const dolfin::Form>>>>())
      .def("bcs", (std::vector<std::shared_ptr<const dolfin::DirichletBC>>
		   (dolfin::MixedNonlinearVariationalProblem::*)(int) const) &dolfin::MixedNonlinearVariationalProblem::bcs)
      .def("bcs", (std::vector<std::vector<std::shared_ptr<const dolfin::DirichletBC>>>
		   (dolfin::MixedNonlinearVariationalProblem::*)() const) &dolfin::MixedNonlinearVariationalProblem::bcs);

    // dolfin::MixedNonlinearVariationalSolver
    py::class_<dolfin::MixedNonlinearVariationalSolver,
               std::shared_ptr<dolfin::MixedNonlinearVariationalSolver>,
               dolfin::Variable>(m, "MixedNonlinearVariationalSolver")
      .def(py::init<std::shared_ptr<dolfin::MixedNonlinearVariationalProblem>>())
      .def("solve", &dolfin::MixedNonlinearVariationalSolver::solve);

    // dolfin::LocalSolver
    py::class_<dolfin::LocalSolver, std::shared_ptr<dolfin::LocalSolver>>
      local_solver(m, "LocalSolver");

    // dolfin::LocalSolver enums
    py::enum_<dolfin::LocalSolver::SolverType>(local_solver, "SolverType")
      .value("LU", dolfin::LocalSolver::SolverType::LU)
      .value("Cholesky", dolfin::LocalSolver::SolverType::Cholesky);

    local_solver.def(py::init<std::shared_ptr<const dolfin::Form>,
                     std::shared_ptr<const dolfin::Form>,
                     dolfin::LocalSolver::SolverType>())
      .def(py::init<std::shared_ptr<const dolfin::Form>,
                     dolfin::LocalSolver::SolverType>())
      .def("factorize", &dolfin::LocalSolver::factorize)
      .def("clear_factorization", &dolfin::LocalSolver::clear_factorization)
      .def("solve_local", &dolfin::LocalSolver::solve_local)
      .def("solve_local_rhs", &dolfin::LocalSolver::solve_local_rhs)
      .def("solve_global_rhs", &dolfin::LocalSolver::solve_global_rhs)
      .def("solve_local_rhs", [](dolfin::LocalSolver& self, py::object u)
           {
             auto _u = u.attr("_cpp_object").cast<dolfin::Function*>();
             self.solve_local_rhs(*_u);
           })
      .def("solve_global_rhs", [](dolfin::LocalSolver& self, py::object u)
           {
             auto _u = u.attr("_cpp_object").cast<dolfin::Function*>();
             self.solve_global_rhs(*_u);
           });

#ifdef HAS_PETSC
    // dolfin::PETScDMCollection
    py::class_<dolfin::PETScDMCollection, std::shared_ptr<dolfin::PETScDMCollection>>
      (m, "PETScDMCollection")
      .def(py::init<std::vector<std::shared_ptr<const dolfin::FunctionSpace>>>())
      .def(py::init([](py::list V)
                    {
                      std::vector<std::shared_ptr<const dolfin::FunctionSpace>> _V;
                      for (auto space : V)
                      {
                        auto _space = space.attr("_cpp_object").cast<std::shared_ptr<const dolfin::FunctionSpace>>();
                        _V.push_back(_space);
                      }
                      return dolfin::PETScDMCollection(_V);
                    }))
      .def_static("create_transfer_matrix", &dolfin::PETScDMCollection::create_transfer_matrix)
      .def_static("create_transfer_matrix", [](py::object V_coarse, py::object V_fine)
                  {
                    auto _V0 = V_coarse.attr("_cpp_object").cast<dolfin::FunctionSpace*>();
                    auto _V1 = V_fine.attr("_cpp_object").cast<dolfin::FunctionSpace*>();
                    return dolfin::PETScDMCollection::create_transfer_matrix(*_V0, *_V1);
                  })
      .def("check_ref_count", &dolfin::PETScDMCollection::check_ref_count)
      .def("get_dm", &dolfin::PETScDMCollection::get_dm);
#endif

    // Assemble free functions
    m.def("assemble", (void (*)(dolfin::GenericTensor&, const dolfin::Form&)) &dolfin::assemble);
    m.def("assemble", (double (*)(const dolfin::Form&)) &dolfin::assemble);

    m.def("assemble_system", (void (*)(dolfin::GenericMatrix&, dolfin::GenericVector&,
                                       const dolfin::Form&, const dolfin::Form&,
                                       std::vector<std::shared_ptr<const dolfin::DirichletBC>>))
          &dolfin::assemble_system);

    m.def("assemble_system", (void (*)(dolfin::GenericMatrix&, dolfin::GenericVector&,
                                       const dolfin::Form&, const dolfin::Form&,
                                       std::vector<std::shared_ptr<const dolfin::DirichletBC>>,
                                       const dolfin::GenericVector&))
          &dolfin::assemble_system);

    m.def("assemble_local", [](const dolfin::Form& form, const dolfin::Cell& cell)
          {
            Eigen::Matrix<double, Eigen::Dynamic, Eigen::Dynamic, Eigen::RowMajor> m;
            dolfin::assemble_local(m, form, cell);
            return m;
          });

    // FEM utils free functions
    m.def("create_mesh", dolfin::create_mesh);
    m.def("create_mesh", [](const py::object u)
          {
            auto _u = u.attr("_cpp_object").cast<dolfin::Function*>();
            return dolfin::create_mesh(*_u);
          });

    m.def("set_coordinates", &dolfin::set_coordinates);
    m.def("set_coordinates", [](dolfin::MeshGeometry& geometry, const py::object u)
          {
            auto _u = u.attr("_cpp_object").cast<const dolfin::Function*>();
            dolfin::set_coordinates(geometry, *_u);
          });

    m.def("get_coordinates", &dolfin::get_coordinates);
    m.def("get_coordinates", [](py::object u, const dolfin::MeshGeometry& geometry)
          {
            auto _u = u.attr("_cpp_object").cast<dolfin::Function*>();
            return dolfin::get_coordinates(*_u, geometry);
          });

    m.def("vertex_to_dof_map", [](const dolfin::FunctionSpace& V)
          {
            const auto _v2d = dolfin::vertex_to_dof_map(V);
            return py::array_t<dolfin::la_index>(_v2d.size(), _v2d.data());
          });

    m.def("vertex_to_dof_map", [](py::object V)
          {
            auto _V = V.attr("_cpp_object").cast<dolfin::FunctionSpace*>();
            const auto _v2d = dolfin::vertex_to_dof_map(*_V);
            return py::array_t<dolfin::la_index>(_v2d.size(), _v2d.data());
          });
    m.def("dof_to_vertex_map", &dolfin::dof_to_vertex_map);
    m.def("dof_to_vertex_map", [](py::object V)
          {
            auto _V = V.attr("_cpp_object").cast<dolfin::FunctionSpace*>();
            const auto _d2v = dolfin::dof_to_vertex_map(*_V);
            return py::array_t<std::size_t>(_d2v.size(), _d2v.data());
          });
  }
}
