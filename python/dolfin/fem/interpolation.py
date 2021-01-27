# -*- coding: utf-8 -*-
"""This module provides a simple way to compute the interpolation of a
:py:class:`Function <dolfin.functions.function.Function>` or
:py:class:`Expression <dolfin.functions.expression.Expression>` onto a
finite element space.

"""

# Copyright (C) 2009-2011 Anders Logg
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

from dolfin.function.function import Function
from dolfin.function.multimeshfunction import MultiMeshFunction
from dolfin.function.multimeshfunctionspace import MultiMeshFunctionSpace


def interpolate(v, V):
    """Return interpolation of a given function into a given finite
    element space.

    *Arguments*
        v
            a :py:class:`Function <dolfin.function.function.Function>` or
            a :py:class:`MultiMeshFunction
                         <dolfin.function.function.MultiMeshFunction>` or
            an :py:class:`Expression <dolfin.functions.expression.Expression>`
        V
            a :py:class:`FunctionSpace (standard, mixed, etc.)
            <dolfin.functions.functionspace.FunctionSpace>`
            or a :py:class:`MultiMeshFunctionSpace
            <dolfin.function.MultiMeshFunctionSpace>`.


    *Example of usage*

        .. code-block:: python

            v = Expression("sin(pi*x[0])")
            V = FunctionSpace(mesh, "Lagrange", 1)
            Iv = interpolate(v, V)

    """

    # Check arguments
    # if not isinstance(V, cpp.functionFunctionSpace):
    #     cpp.dolfin_error("interpolation.py",
    #                      "compute interpolation",
    #                      "Illegal function space for interpolation, not a FunctionSpace (%s)" % str(v))

    if isinstance(V, MultiMeshFunctionSpace):
        Pv = MultiMeshFunction(V)
    else:
        Pv = Function(V)

    # Compute interpolation
    if hasattr(v, "_cpp_object"):
        Pv.interpolate(v._cpp_object)
    else:
        Pv.interpolate(v)

    return Pv
