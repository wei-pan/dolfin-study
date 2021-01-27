# -*- coding: utf-8 -*-
"""FIXME: Add description"""

# Copyright (C) 2017 Chris N. Richardson and Garth N. Wells
#
# Distributed under the terms of the GNU Lesser Public License (LGPL),
# either version 3 of the License, or (at your option) any later
# version.

from dolfin.cpp.log import log, LogLevel
from dolfin.cpp import MPI
from dolfin.jit.jit import compile_class, _math_header


def jit_generate(class_data, module_name, signature, parameters):
    """TODO: document"""

    template_code = """
// Based on https://gcc.gnu.org/wiki/Visibility
#if defined _WIN32 || defined __CYGWIN__
    #ifdef __GNUC__
        #define DLL_EXPORT __attribute__ ((dllexport))
    #else
        #define DLL_EXPORT __declspec(dllexport)
    #endif
#else
    #define DLL_EXPORT __attribute__ ((visibility ("default")))
#endif

#include <dolfin/function/Expression.h>
#include <dolfin/math/basic.h>
#include <Eigen/Dense>

{math_header}

namespace dolfin
{{
  class {classname} : public Expression
  {{
     public:
       {members}

       {classname}()
       {{
            {constructor}
       }}

       void eval(Eigen::Ref<Eigen::VectorXd> values, Eigen::Ref<const Eigen::VectorXd> x) const override
       {{
{statement}
       }}

       void set_property(std::string name, double _value) override
       {{
{set_props}
       throw std::runtime_error("No such property");
       }}

       double get_property(std::string name) const override
       {{
{get_props}
       throw std::runtime_error("No such property");
       return 0.0;
       }}

       void set_generic_function(std::string name, std::shared_ptr<dolfin::GenericFunction> _value) override
       {{
{set_generic_function}
       throw std::runtime_error("No such property");
       }}

       std::shared_ptr<dolfin::GenericFunction> get_generic_function(std::string name) const override
       {{
{get_generic_function}
       throw std::runtime_error("No such property");
       }}

  }};
}}

extern "C" DLL_EXPORT dolfin::Expression * create_{classname}()
{{
  return new dolfin::{classname};
}}

"""
    _get_props = """          if (name == "{key_name}") return {name};"""
    _set_props = """          if (name == "{key_name}") {{ {name} = _value; return; }}"""

    log(LogLevel.TRACE, "Calling dijitso just-in-time (JIT) compiler for Expression.")

    statements = class_data["statements"]
    statement = ""
    if isinstance(statements, str):
        statement += "          values[0] = " + statements + ";\n"
    else:
        for i, val in enumerate(statements):
            statement += "          values[" + str(i) + "] = " + val + ";\n"

    constructor = ""
    members = ""
    set_props = ""
    get_props = ""
    set_generic_function = ""
    get_generic_function = ""

    # Add code for setting and getting property values
    properties = class_data["properties"]
    for k in properties:
        value = properties[k]
        if isinstance(value, (float, int)):
            members += "double " + k + ";\n"
            set_props += _set_props.format(key_name=k, name=k)
            get_props += _get_props.format(key_name=k, name=k)
        elif hasattr(value, "_cpp_object"):
            members += "std::shared_ptr<dolfin::GenericFunction> generic_function_{key};\n".format(key=k)
            set_generic_function += _set_props.format(key_name=k,
                                                      name="generic_function_" + k)
            get_generic_function += _get_props.format(key_name=k,
                                                      name="generic_function_" + k)

            value_size = value._cpp_object.value_size()
            if value_size == 1:
                _setup_statement = """          double {key};
            generic_function_{key}->eval(Eigen::Map<Eigen::Matrix<double, 1, 1>>(&{key}), x);\n""".format(key=k)
            else:
                _setup_statement = """          double {key}[{value_size}];

            generic_function_{key}->eval(Eigen::Map<Eigen::Matrix<double, {value_size}, 1>>({key}), x);\n""".format(key=k, value_size=value_size)
            statement = _setup_statement + statement

    # Set the value_shape
    for dim in class_data['value_shape']:
        constructor += "_value_shape.push_back(" + str(dim) + ");"

    classname = signature
    code_c = template_code.format(statement=statement,
                                  classname=classname,
                                  members=members,
                                  constructor=constructor,
                                  set_props=set_props,
                                  get_props=get_props,
                                  get_generic_function=get_generic_function,
                                  set_generic_function=set_generic_function,
                                  math_header=_math_header)
    code_h = ""
    depends = []

    return code_h, code_c, depends


def compile_expression(statements, properties):

    mpi_comm = properties.pop("mpi_comm", MPI.comm_world)
    cpp_data = {'statements': statements, 'properties': properties,
                'name': 'expression', 'jit_generate': jit_generate}

    expression = compile_class(cpp_data, mpi_comm=mpi_comm)
    return expression
