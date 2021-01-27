// Copyright (C) 2017 Chris N. Richardson Garth N. Wells
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

#include <memory>
#include <string>
#include <vector>
#include <pybind11/pybind11.h>
#include <pybind11/numpy.h>
#include <pybind11/stl.h>

#include <dolfin/io/File.h>
#include <dolfin/io/HDF5Attribute.h>
#include <dolfin/io/HDF5File.h>
#include <dolfin/io/VTKFile.h>
#include <dolfin/io/XDMFFile.h>
#include <dolfin/io/X3DOM.h>
#include <dolfin/function/Function.h>
#include <dolfin/geometry/Point.h>
#include <dolfin/la/GenericVector.h>
#include <dolfin/mesh/Mesh.h>
#include <dolfin/mesh/MeshFunction.h>
#include <dolfin/mesh/MeshValueCollection.h>

#include "casters.h"

namespace py = pybind11;

namespace dolfin_wrappers
{

  void io(py::module& m)
  {
    // dolfin::File
    py::class_<dolfin::File, std::shared_ptr<dolfin::File>>(m, "File")
      .def(py::init<std::string>())
      .def(py::init<std::string, std::string>())
      .def(py::init([](const MPICommWrapper comm, std::string filename)
        { return std::unique_ptr<dolfin::File>(new dolfin::File(comm.get(), filename)); }),
        py::arg("comm"), py::arg("filename"))
      //
      .def("write", (void (dolfin::File::*)(const dolfin::Parameters&)) &dolfin::File::write)
      //
      .def("write", (void (dolfin::File::*)(const dolfin::Mesh&)) &dolfin::File::write)
      .def("write", (void (dolfin::File::*)(const dolfin::Mesh&, double)) &dolfin::File::write)
      //
      .def("write", (void (dolfin::File::*)(const dolfin::Function&)) &dolfin::File::write)
      .def("write", (void (dolfin::File::*)(const dolfin::Function&, double)) &dolfin::File::write)
       //
      .def("write", (void (dolfin::File::*)(const dolfin::MeshFunction<int>&)) &dolfin::File::write)
      .def("write", (void (dolfin::File::*)(const dolfin::MeshFunction<int>&, double)) &dolfin::File::write)
      .def("write", (void (dolfin::File::*)(const dolfin::MeshFunction<std::size_t>&)) &dolfin::File::write)
      .def("write", (void (dolfin::File::*)(const dolfin::MeshFunction<std::size_t>&, double)) &dolfin::File::write)
      .def("write", (void (dolfin::File::*)(const dolfin::MeshFunction<double>&)) &dolfin::File::write)
      .def("write", (void (dolfin::File::*)(const dolfin::MeshFunction<double>&, double)) &dolfin::File::write)
      .def("write", (void (dolfin::File::*)(const dolfin::MeshFunction<bool>&)) &dolfin::File::write)
      .def("write", (void (dolfin::File::*)(const dolfin::MeshFunction<bool>&, double)) &dolfin::File::write)
      //
      .def("write", (void (dolfin::File::*)(const dolfin::MeshValueCollection<int>&)) &dolfin::File::write)
      .def("write", (void (dolfin::File::*)(const dolfin::MeshValueCollection<std::size_t>&)) &dolfin::File::write)
      .def("write", (void (dolfin::File::*)(const dolfin::MeshValueCollection<double>&)) &dolfin::File::write)
      .def("write", (void (dolfin::File::*)(const dolfin::MeshValueCollection<bool>&)) &dolfin::File::write)
      //
      .def("write", (void (dolfin::File::*)(const dolfin::GenericVector&)) &dolfin::File::write)
      .def("write", (void (dolfin::File::*)(const dolfin::Table&)) &dolfin::File::write)
      // Unpack
      .def("write", [](dolfin::File& instance, py::object u)
           {
             auto _u = u.attr("_cpp_object").cast<dolfin::Function*>();
             instance.write(*_u);
           })
      .def("write", [](dolfin::File& instance, py::object u, double t)
           {
             auto _u = u.attr("_cpp_object").cast<dolfin::Function*>();
             instance.write(*_u, t);
           })
      // Read
      .def("read", (void (dolfin::File::*)(dolfin::Parameters&)) &dolfin::File::read)
      .def("read", (void (dolfin::File::*)(dolfin::Table&)) &dolfin::File::read)
      .def("read", (void (dolfin::File::*)(dolfin::GenericVector&)) &dolfin::File::read)
      .def("read", (void (dolfin::File::*)(dolfin::Function&)) &dolfin::File::read)
      //
      .def("read", (void (dolfin::File::*)(dolfin::MeshFunction<bool>&)) &dolfin::File::read)
      .def("read", (void (dolfin::File::*)(dolfin::MeshFunction<int>&)) &dolfin::File::read)
      .def("read", (void (dolfin::File::*)(dolfin::MeshFunction<std::size_t>&)) &dolfin::File::read)
      .def("read", (void (dolfin::File::*)(dolfin::MeshFunction<double>&)) &dolfin::File::read)
      //
      .def("read", (void (dolfin::File::*)(dolfin::MeshValueCollection<bool>&)) &dolfin::File::read)
      .def("read", (void (dolfin::File::*)(dolfin::MeshValueCollection<int>&)) &dolfin::File::read)
      .def("read", (void (dolfin::File::*)(dolfin::MeshValueCollection<std::size_t>&)) &dolfin::File::read)
      .def("read", (void (dolfin::File::*)(dolfin::MeshValueCollection<double>&)) &dolfin::File::read)
      //
      .def("read", (void (dolfin::File::*)(dolfin::Mesh&)) &dolfin::File::read);

    // dolfin::VTKFile
    py::class_<dolfin::VTKFile, std::shared_ptr<dolfin::VTKFile>>(m, "VTKFile")
      .def(py::init<std::string, std::string>())
      .def("write", [](dolfin::VTKFile& instance, const dolfin::Mesh& mesh)
           { instance.write(mesh); });

#ifdef HAS_HDF5
    // dolfin::HDF5Attribute
    py::class_<dolfin::HDF5Attribute, std::shared_ptr<dolfin::HDF5Attribute>>(m, "HDF5Attribute")
      //.def("__getitem__", [](const dolfin::HDF5Attribute& instance, std::string name){ return instance[name]; })
      .def("__setitem__", [](dolfin::HDF5Attribute& instance, std::string name, std::string value){ instance.set(name, value); })
      .def("__setitem__", [](dolfin::HDF5Attribute& instance, std::string name, double value){ instance.set(name, value); })
      .def("__setitem__", [](dolfin::HDF5Attribute& instance, std::string name, std::size_t value){ instance.set(name, value); })
      .def("__setitem__", [](dolfin::HDF5Attribute& instance, std::string name, py::array_t<double> values)
           {
             std::vector<double> _values(values.shape()[0]);
             std::copy_n(values.data(), _values.size(), _values.begin());
             instance.set(name, _values);
           })
      .def("__setitem__", [](dolfin::HDF5Attribute& instance, std::string name, py::array_t<std::size_t> values)
           {
             std::vector<std::size_t> _values(values.shape()[0]);
             std::copy_n(values.data(), _values.size(), _values.begin());
             instance.set(name, _values);
           })

      .def("__getitem__", [](const dolfin::HDF5Attribute& instance, std::string name)
           {
             const std::string type = instance.type_str(name);
             if (type == "string")
             {
               std::string attr;
               instance.get(name, attr);
               return py::cast(attr);
             }
             else if (type == "float")
             {
               double attr;
               instance.get(name, attr);
               return py::cast(attr);
             }
             else if (type == "int")
             {
               std::size_t attr;
               instance.get(name, attr);
               return py::cast(attr);
             }
             else if (type == "vectorfloat")
             {
               std::vector<double> attr;
               instance.get(name, attr);
               return py::cast(attr);
             }
             else if (type == "vectorint")
             {
               std::vector<std::size_t> attr;
               instance.get(name, attr);
               return py::cast(attr);
             }
             else
             {
               throw std::runtime_error("HDF5 attribute type unknown.");
               return py::object();
             }
           })
      .def("__len__", [](const dolfin::HDF5Attribute& self)
           { return self.list_attributes().size(); })
      .def("__contains__", [](const dolfin::HDF5Attribute& instance, std::string key)
           { return instance.exists(key); })
      .def("to_dict", [](const dolfin::HDF5Attribute& self)
           {
             auto d = py::dict();
             auto names = self.list_attributes();
             for (auto name : names)
             {
               auto type = self.type_str(name);
               if (type == "string")
               {
                 std::string a;
                 self.get(name, a);
                 d[name.c_str()] = py::str(a);
               }
               else if (type == "float")
                {
                  double a;
                  self.get(name, a);
                  d[name.c_str()] = py::float_(a);
               }
               else if (type == "int")
               {
                 // This is bad on the DOLFIN cpp side
                 std::size_t a;
                 self.get(name, a);
                 d[name.c_str()] = py::int_(a);
               }
               else if (type == "vectorfloat")
               {
                 std::vector<double> a;
                 self.get(name, a);

                 py::array_t<double> data(a.size(), a.data());
                 d[name.c_str()] = data;
               }
               else if (type == "vectorint")
               {
                 // This is bad on the DOLFIN cpp side
                 std::vector<std::size_t> a;
                 self.get(name, a);

                 py::array_t<std::size_t> data(a.size(), a.data());
                 d[name.c_str()] = data;
               }
               else
                 throw std::runtime_error("Unsupported HDF5 attribute type");
             }

             return d;
           })
      .def("list_attributes", &dolfin::HDF5Attribute::list_attributes)
      .def("type_str", &dolfin::HDF5Attribute::type_str);

    // dolfin::HDF5File
    py::class_<dolfin::HDF5File, std::shared_ptr<dolfin::HDF5File>,
               dolfin::Variable> (m, "HDF5File")
      .def(py::init([](const MPICommWrapper comm, const std::string filename, const std::string file_mode)
        { return std::unique_ptr<dolfin::HDF5File>(new dolfin::HDF5File(comm.get(), filename, file_mode)); }),
        py::arg("comm"), py::arg("filename"), py::arg("file_mode"))
      .def("__enter__", [](dolfin::HDF5File& self){ return &self; })
      .def("__exit__", [](dolfin::HDF5File& self, py::args args, py::kwargs kwargs){ self.close(); })
      .def("close", &dolfin::HDF5File::close)
      .def("flush", &dolfin::HDF5File::flush)
      // read
      .def("read", (void (dolfin::HDF5File::*)(dolfin::Mesh&, std::string, bool) const) &dolfin::HDF5File::read)
      .def("read", (void (dolfin::HDF5File::*)(dolfin::MeshValueCollection<bool>&, std::string) const)
           &dolfin::HDF5File::read, py::arg("mvc"), py::arg("name"))
      .def("read", (void (dolfin::HDF5File::*)(dolfin::MeshValueCollection<std::size_t>&, std::string) const)
           &dolfin::HDF5File::read, py::arg("mvc"), py::arg("name"))
      .def("read", (void (dolfin::HDF5File::*)(dolfin::MeshValueCollection<double>&, std::string) const)
           &dolfin::HDF5File::read, py::arg("mvc"), py::arg("name"))
      .def("read", (void (dolfin::HDF5File::*)(dolfin::MeshFunction<bool>&, std::string) const)
           &dolfin::HDF5File::read, py::arg("meshfunction"), py::arg("name"))
      .def("read", (void (dolfin::HDF5File::*)(dolfin::MeshFunction<std::size_t>&, std::string) const)
           &dolfin::HDF5File::read, py::arg("meshfunction"), py::arg("name"))
      .def("read", (void (dolfin::HDF5File::*)(dolfin::MeshFunction<int>&, std::string) const)
           &dolfin::HDF5File::read, py::arg("meshfunction"), py::arg("name"))
      .def("read", (void (dolfin::HDF5File::*)(dolfin::MeshFunction<double>&, std::string) const)
           &dolfin::HDF5File::read, py::arg("meshfunction"), py::arg("name"))
      .def("read", (void (dolfin::HDF5File::*)(dolfin::GenericVector&, std::string, bool) const)
           &dolfin::HDF5File::read, py::arg("vector"), py::arg("name"), py::arg("use_partitioning"))
      .def("read", (void (dolfin::HDF5File::*)(dolfin::Function&, const std::string))
           &dolfin::HDF5File::read, py::arg("u"), py::arg("name"))
      .def("read", [](dolfin::HDF5File& self, py::object u, std::string name)
           {
             auto _u = u.attr("_cpp_object").cast<dolfin::Function*>();
             self.read(*_u, name);
           }, py::arg("u"), py::arg("name"))
      // write
      .def("write", (void (dolfin::HDF5File::*)(const dolfin::Mesh&, std::string)) &dolfin::HDF5File::write)
      .def("write", (void (dolfin::HDF5File::*)(const dolfin::MeshValueCollection<bool>&, std::string))
           &dolfin::HDF5File::write, py::arg("mvc"), py::arg("name"))
      .def("write", (void (dolfin::HDF5File::*)(const dolfin::MeshValueCollection<std::size_t>&, std::string))
           &dolfin::HDF5File::write, py::arg("mvc"), py::arg("name"))
      .def("write", (void (dolfin::HDF5File::*)(const dolfin::MeshValueCollection<double>&, std::string))
           &dolfin::HDF5File::write, py::arg("mvc"), py::arg("name"))
      .def("write", (void (dolfin::HDF5File::*)(const dolfin::MeshFunction<bool>&, std::string))
           &dolfin::HDF5File::write, py::arg("meshfunction"), py::arg("name"))
      .def("write", (void (dolfin::HDF5File::*)(const dolfin::MeshFunction<std::size_t>&, std::string))
           &dolfin::HDF5File::write, py::arg("meshfunction"), py::arg("name"))
      .def("write", (void (dolfin::HDF5File::*)(const dolfin::MeshFunction<int>&, std::string))
           &dolfin::HDF5File::write, py::arg("meshfunction"), py::arg("name"))
      .def("write", (void (dolfin::HDF5File::*)(const dolfin::MeshFunction<double>&, std::string))
           &dolfin::HDF5File::write, py::arg("meshfunction"), py::arg("name"))
      .def("write", (void (dolfin::HDF5File::*)(const dolfin::GenericVector&, std::string))
           &dolfin::HDF5File::write, py::arg("vector"), py::arg("name"))
      .def("write", (void (dolfin::HDF5File::*)(const dolfin::Function&, std::string))
           &dolfin::HDF5File::write, py::arg("u"), py::arg("name"))
      .def("write", (void (dolfin::HDF5File::*)(const dolfin::Function&, std::string, double))
           &dolfin::HDF5File::write, py::arg("u"), py::arg("name"), py::arg("t"))
      .def("write", [](dolfin::HDF5File& self, py::object u, std::string name)
           {
             auto _u = u.attr("_cpp_object").cast<dolfin::Function*>();
             self.write(*_u, name);
           }, py::arg("u"), py::arg("name"))
      .def("write", [](dolfin::HDF5File& self, py::object u, std::string name, double t)
           {
             auto _u = u.attr("_cpp_object").cast<dolfin::Function*>();
             self.write(*_u, name, t);
           }, py::arg("u"), py::arg("name"), py::arg("t"))
      .def("set_mpi_atomicity", &dolfin::HDF5File::set_mpi_atomicity)
      .def("get_mpi_atomicity", &dolfin::HDF5File::get_mpi_atomicity)
      // others
      .def("has_dataset", &dolfin::HDF5File::has_dataset)
      .def("attributes", &dolfin::HDF5File::attributes);

#endif

    // dolfin::XDMFFile
    py::class_<dolfin::XDMFFile, std::shared_ptr<dolfin::XDMFFile>,
               dolfin::Variable> xdmf_file(m, "XDMFFile");

    xdmf_file
      .def(py::init([](const MPICommWrapper comm, std::string filename)
        { return std::unique_ptr<dolfin::XDMFFile>(new dolfin::XDMFFile(comm.get(), filename)); }),
        py::arg("comm"), py::arg("filename"))
      .def(py::init<std::string>())
      .def("__enter__", [](dolfin::XDMFFile& self){ return &self; })
      .def("__exit__", [](dolfin::XDMFFile& self, py::args args, py::kwargs kwargs){ self.close(); })
      .def("close", &dolfin::XDMFFile::close);

    // dolfin::XDMFFile::Encoding enums
    py::enum_<dolfin::XDMFFile::Encoding>(xdmf_file, "Encoding")
      .value("HDF5", dolfin::XDMFFile::Encoding::HDF5)
      .value("ASCII", dolfin::XDMFFile::Encoding::ASCII);

    // dolfin::XDMFFile::write
    xdmf_file
       // Function
      .def("write", (void (dolfin::XDMFFile::*)(const dolfin::Function&, dolfin::XDMFFile::Encoding))
           &dolfin::XDMFFile::write, py::arg("u"), py::arg("encoding")=dolfin::XDMFFile::Encoding::HDF5)
      .def("write", (void (dolfin::XDMFFile::*)(const dolfin::Function&, double, dolfin::XDMFFile::Encoding))
           &dolfin::XDMFFile::write, py::arg("u"), py::arg("t"), py::arg("encoding")=dolfin::XDMFFile::Encoding::HDF5)
      // Mesh
      .def("write", (void (dolfin::XDMFFile::*)(const dolfin::Mesh&, dolfin::XDMFFile::Encoding))
           &dolfin::XDMFFile::write, py::arg("mesh"), py::arg("encoding") = dolfin::XDMFFile::Encoding::HDF5)
      // MeshFunction
      .def("write", (void (dolfin::XDMFFile::*)(const dolfin::MeshFunction<bool>&, dolfin::XDMFFile::Encoding))
           &dolfin::XDMFFile::write, py::arg("mvc"), py::arg("encoding") = dolfin::XDMFFile::Encoding::HDF5)
      .def("write", (void (dolfin::XDMFFile::*)(const dolfin::MeshFunction<std::size_t>&, dolfin::XDMFFile::Encoding))
           &dolfin::XDMFFile::write, py::arg("mvc"), py::arg("encoding") = dolfin::XDMFFile::Encoding::HDF5)
      .def("write", (void (dolfin::XDMFFile::*)(const dolfin::MeshFunction<int>&, dolfin::XDMFFile::Encoding))
           &dolfin::XDMFFile::write, py::arg("mvc"), py::arg("encoding") = dolfin::XDMFFile::Encoding::HDF5)
      .def("write", (void (dolfin::XDMFFile::*)(const dolfin::MeshFunction<double>&, dolfin::XDMFFile::Encoding))
           &dolfin::XDMFFile::write, py::arg("mvc"), py::arg("encoding") = dolfin::XDMFFile::Encoding::HDF5)
      // MeshValueCollection
      .def("write", (void (dolfin::XDMFFile::*)(const dolfin::MeshValueCollection<bool>&, dolfin::XDMFFile::Encoding))
           &dolfin::XDMFFile::write, py::arg("mvc"), py::arg("encoding") = dolfin::XDMFFile::Encoding::HDF5)
      .def("write", (void (dolfin::XDMFFile::*)(const dolfin::MeshValueCollection<std::size_t>&, dolfin::XDMFFile::Encoding))
           &dolfin::XDMFFile::write, py::arg("mvc"), py::arg("encoding") = dolfin::XDMFFile::Encoding::HDF5)
      .def("write", (void (dolfin::XDMFFile::*)(const dolfin::MeshValueCollection<int>&, dolfin::XDMFFile::Encoding))
           &dolfin::XDMFFile::write, py::arg("mvc"), py::arg("encoding") = dolfin::XDMFFile::Encoding::HDF5)
      .def("write", (void (dolfin::XDMFFile::*)(const dolfin::MeshValueCollection<double>&, dolfin::XDMFFile::Encoding))
           &dolfin::XDMFFile::write, py::arg("mvc"), py::arg("encoding") = dolfin::XDMFFile::Encoding::HDF5)
      // Points
      .def("write", [](dolfin::XDMFFile& instance, py::list points, dolfin::XDMFFile::Encoding encoding)
           {
	     auto _points = points.cast<std::vector<dolfin::Point>>();
             instance.write(_points, encoding);
	   }, py::arg("points"), py::arg("encoding")=dolfin::XDMFFile::Encoding::HDF5)
      // Points with values
      .def("write", [](dolfin::XDMFFile& instance, py::list points, std::vector<double>& values, dolfin::XDMFFile::Encoding encoding)
           {
	     auto _points = points.cast<std::vector<dolfin::Point>>();
             instance.write(_points, values, encoding);
	   }, py::arg("points"), py::arg("values"), py::arg("encoding")=dolfin::XDMFFile::Encoding::HDF5)
      // py:object / dolfin.function.Function
      .def("write", [](dolfin::XDMFFile& instance, const py::object u, dolfin::XDMFFile::Encoding encoding)
           {
             auto _u = u.attr("_cpp_object").cast<dolfin::Function*>();
             instance.write(*_u, encoding);
           }, py::arg("u"), py::arg("encoding")=dolfin::XDMFFile::Encoding::HDF5)
      .def("write", [](dolfin::XDMFFile& instance, const py::object u, double t, dolfin::XDMFFile::Encoding encoding)
           {
             auto _u = u.attr("_cpp_object").cast<dolfin::Function*>();
	     instance.write(*_u, t, encoding);
           }, py::arg("u"), py::arg("t"), py::arg("encoding")=dolfin::XDMFFile::Encoding::HDF5)
      // Write for checkpointing cpp object
      .def("write_checkpoint", [](dolfin::XDMFFile& instance, const dolfin::Function& u,
                                  std::string function_name,
                                  double time_step, dolfin::XDMFFile::Encoding encoding, bool append)
           { instance.write_checkpoint(u, function_name, time_step, encoding, append); },
           py::arg("u"), py::arg("function_name"), py::arg("time_step")=0.0,
           py::arg("encoding")=dolfin::XDMFFile::Encoding::HDF5, py::arg("append")=false)
      // Write for checkpointing dolfin.function.function.Function
      .def("write_checkpoint", [](dolfin::XDMFFile& instance, const py::object u, std::string function_name,
                                  double time_step, dolfin::XDMFFile::Encoding encoding, bool append)
           {
             auto _u = u.attr("_cpp_object").cast<dolfin::Function*>();
             instance.write_checkpoint(*_u, function_name, time_step, encoding, append);
           },
           py::arg("u"), py::arg("function_name"), py::arg("time_step")=0.0,
           py::arg("encoding")=dolfin::XDMFFile::Encoding::HDF5, py::arg("append")=false);


    // XDFMFile::read
    xdmf_file
      // Mesh
      .def("read", (void (dolfin::XDMFFile::*)(dolfin::Mesh&) const) &dolfin::XDMFFile::read)
      // MeshFunction
      .def("read", (void (dolfin::XDMFFile::*)(dolfin::MeshFunction<bool>&, std::string))
           &dolfin::XDMFFile::read, py::arg("mf"), py::arg("name") = "")
      .def("read", (void (dolfin::XDMFFile::*)(dolfin::MeshFunction<std::size_t>&, std::string))
           &dolfin::XDMFFile::read, py::arg("mf"), py::arg("name") = "")
      .def("read", (void (dolfin::XDMFFile::*)(dolfin::MeshFunction<int>&, std::string))
           &dolfin::XDMFFile::read, py::arg("mf"), py::arg("name") = "")
      .def("read", (void (dolfin::XDMFFile::*)(dolfin::MeshFunction<double>&, std::string))
           &dolfin::XDMFFile::read, py::arg("mf"), py::arg("name") = "")
      // MeshValueCollection
      .def("read", (void (dolfin::XDMFFile::*)(dolfin::MeshValueCollection<bool>&, std::string))
           &dolfin::XDMFFile::read, py::arg("mvc"), py::arg("name") = "")
      .def("read", (void (dolfin::XDMFFile::*)(dolfin::MeshValueCollection<std::size_t>&, std::string))
           &dolfin::XDMFFile::read, py::arg("mvc"), py::arg("name") = "")
      .def("read", (void (dolfin::XDMFFile::*)(dolfin::MeshValueCollection<int>&, std::string))
           &dolfin::XDMFFile::read, py::arg("mvc"), py::arg("name") = "")
      .def("read", (void (dolfin::XDMFFile::*)(dolfin::MeshValueCollection<double>&, std::string))
           &dolfin::XDMFFile::read, py::arg("mvc"), py::arg("name") = "")
      // Read for checkpointing cpp object
      .def("read_checkpoint", &dolfin::XDMFFile::read_checkpoint, py::arg("u"), py::arg("name"),
           py::arg("counter")=-1)
      // Read for checkpointing dolfin.function.function.Function
      .def("read_checkpoint", [](dolfin::XDMFFile& instance, py::object u, std::string name, std::int64_t counter)
           {
             auto _u = u.attr("_cpp_object").cast<dolfin::Function*>();
             instance.read_checkpoint(*_u, name, counter);
           },
           py::arg("u"), py::arg("name"), py::arg("counter")=-1);


    py::class_<dolfin::X3DOMParameters>(m, "X3DOMParameters")
      .def(py::init<>())
      .def("get_diffuse_color", &dolfin::X3DOMParameters::get_diffuse_color)
      .def("set_diffuse_color", [](dolfin::X3DOMParameters& self, py::array_t<double> color)
           {
             if (color.ndim() != 1 or color.shape(0) != 3)
               throw pybind11::type_error("Color must be a 1D array or length 3");
             self.set_diffuse_color({{*color.data(0), *color.data(1), *color.data(2)}});
           });

    // dolfin::X3DOM
    py::class_<dolfin::X3DOM>(m, "X3DOM")
      .def_static("str", (std::string (*)(const dolfin::Mesh&, dolfin::X3DOMParameters)) &dolfin::X3DOM::str,
                  py::arg("mesh"), py::arg("parameters")=dolfin::X3DOMParameters())
      .def_static("str", (std::string (*)(const dolfin::Function&, dolfin::X3DOMParameters)) &dolfin::X3DOM::str,
                  py::arg("u"), py::arg("parameters")=dolfin::X3DOMParameters())
      .def_static("html", (std::string (*)(const dolfin::Mesh&, dolfin::X3DOMParameters)) &dolfin::X3DOM::html,
                  py::arg("mesh"), py::arg("parameters")=dolfin::X3DOMParameters())
      .def_static("html", (std::string (*)(const dolfin::Function&, dolfin::X3DOMParameters)) &dolfin::X3DOM::html,
                  py::arg("u"), py::arg("parameters")=dolfin::X3DOMParameters());

  }
}
