# -*- coding: utf-8 -*-
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
#
# First added:  2009-02-12
# Last changed: 2012-09-28

from dolfin.cpp.mesh import Vertex, edges
from dolfin.cpp.log import info
from dolfin import cpp

__all__ = ["compute_vertex_map", "compute_edge_map", "init_parent_edge_indices"]


def compute_vertex_map(mesh0, mesh1):
    """
    Compute map from vertices of mesh0 to vertices of mesh1.

    *Arguments*
        mesh0
            a :py:class:`Mesh <dolfin.cpp.Mesh>`.
        mesh1
            a :py:class:`Mesh <dolfin.cpp.Mesh>`.

    It is assumed that both meshes have a :py:class:`MeshFunction
    <dolfin.cpp.MeshFunction>` over the vertices named
    "parent_vertex_indices" which contain a mapping from the
    local vertices to a common parent vertex numbering.

    """

    # Check arguments
    if not isinstance(mesh0, cpp.mesh.Mesh) or not isinstance(mesh1, cpp.mesh.Mesh):
        raise RuntimeError("Compute vertex map. Expected 'Mesh' as argument.")

    # Get parent vertex numbers
    vertices0 = mesh0.data().array("parent_vertex_indices", 0)
    vertices1 = mesh1.data().array("parent_vertex_indices", 0)

    # Check mappings
    if vertices0 is None or vertices1 is None:
        raise RuntimeError("Compute vertex map. Parent vertex indices are missing")

    # Compute parent-to-local mapping for mesh1
    parent_to_local_mesh1 = {}
    for i in range(len(vertices1)):
        parent_to_local_mesh1[vertices1[i]] = i

    # Compute local-to-local mapping
    vertex_map = {}
    for i in range(vertices0.size):
        parent_vertex = vertices0[i]
        if parent_vertex in parent_to_local_mesh1:
            vertex_map[i] = parent_to_local_mesh1[parent_vertex]

    return vertex_map


def compute_edge_map(mesh0, mesh1):
    """
    Compute map from edges of mesh0 to vertices of mesh1.

    *Arguments*
        mesh0
            a :py:class:`Mesh <dolfin.cpp.Mesh>`.
        mesh1
            a :py:class:`Mesh <dolfin.cpp.Mesh>`.

    It is assumed that both meshes have a :py:class:`MeshFunction
    <dolfin.cpp.MeshFunction>` over the vertices named
    "parent_vertex_indices" which contain a mapping from the
    local vertices to a common parent vertex numbering.

    """

    # Check arguments
    if not isinstance(mesh0, cpp.mesh.Mesh) or not isinstance(mesh1, cpp.mesh.Mesh):
        raise RuntimeError("Compute edge map. Expected 'Mesh' as argument.")

    # Get parent vertex numbers
    vertices0 = mesh0.data().array("parent_vertex_indices", 0)
    vertices1 = mesh1.data().array("parent_vertex_indices", 0)

    # Check mappings
    if len(vertices0) == 0 or len(vertices1) == 0:
        raise RuntimeError("Compute edge map. Parent vertex indices are missing.")

    # Initialize edges
    mesh0.init(1)
    mesh1.init(1)

    # Build parent to local map from vertex pair to local edge for mesh0
    parent_to_local_mesh0 = {}
    for edge in edges(mesh0):
        v = [vertices0[int(i)] for i in edge.entities(0)]
        v.sort()
        parent_to_local_mesh0[tuple(v)] = edge.index()

    # Build parent to local map from vertex pair to local edge for mesh1
    parent_to_local_mesh1 = {}
    for edge in edges(mesh1):
        v = [vertices1[int(i)] for i in edge.entities(0)]
        v.sort()
        parent_to_local_mesh1[tuple(v)] = edge.index()

    # Get common edges
    common_edges = set(parent_to_local_mesh0.keys()).intersection(set(parent_to_local_mesh1.keys()))

    # Compute map
    edge_map = {}
    for edge in common_edges:
        edge_map[parent_to_local_mesh0[edge]] = parent_to_local_mesh1[edge]

    return edge_map


def init_parent_edge_indices(submesh, mesh):
    "Initialize data 'parent_edge_indices' for submesh."

    # Check arguments
    if not isinstance(submesh, cpp.mesh.Mesh) or not isinstance(mesh, cpp.mesh.Mesh):
        raise RuntimeError("Initialize parent edge indices. Expected 'Mesh' as argument")

    # Check if edge map has already been computed
    if not submesh.data().exists("parent_edge_indices", 1):
        info("Edge map 'parent_edge_indices' already computed, not computing again.")

    # Get parent vertex numbers
    parent_vertex_indices = submesh.data().array("parent_vertex_indices", 0)
    if parent_vertex_indices is None:
        raise RuntimeError("Initialize parent edge indices. Parent vertex indice are missing.")

    # Make sure that we have edges for both meshes
    submesh.init(1)
    mesh.init(1)

    # Make sure we have vertex-edge connectivity for parent mesh
    mesh.init(0, 1)

    # Create the edge map
    parent_edge_indices = submesh.data().create_array("parent_edge_indices", 1)

    # Iterate over the edges and figure out their parent number
    for local_edge in edges(submesh):

        # Get parent indices for edge vertices
        v0, v1 = local_edge.entities(0)
        V0 = Vertex(mesh, parent_vertex_indices[int(v0)])
        V1 = Vertex(mesh, parent_vertex_indices[int(v1)])

        # Get outgoing edges from the two parent vertices
        edges0 = set(V0.entities(1))
        edges1 = set(V1.entities(1))

        # Check intersection
        common_edges = edges0.intersection(edges1)
        if not len(common_edges) == 1:
            raise RuntimeError("Initialize parent edge indices. Parent vertices do not share exactly one common edge")
        parent_edge_index = list(common_edges)[0]

        # Set value
        parent_edge_indices[local_edge.index()] = parent_edge_index
