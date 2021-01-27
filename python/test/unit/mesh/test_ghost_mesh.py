"Unit tests for ghosted meshes"

# Copyright (C) 2016 Garth N. Wells
#
# This file is part of DOLFIN.
#
# DOLFIN is free software: you can redistribute it and/or modify
# it under the terms of the GNU Lesser General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.

# DOLFIN is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU Lesser General Public License for more details.
#
# You should have received a copy of the GNU Lesser General Public License
# along with DOLFIN. If not, see <http://www.gnu.org/licenses/>.

import pytest
import numpy
from dolfin import *
import os

from dolfin_utils.test import (fixture, skip_in_parallel, xfail_in_parallel, cd_tempdir,
                               pushpop_parameters)


# See https://bitbucket.org/fenics-project/dolfin/issues/579
def xtest_ghost_vertex_1d(pushpop_parameters):
    parameters["ghost_mode"] = "shared_vertex"
    mesh = UnitIntervalMesh(20)
    #print("Test: {}".format(MPI.sum(mesh.mpi_comm(), mesh.num_cells())))


def xtest_ghost_facet_1d(pushpop_parameters):
    parameters["ghost_mode"] = "shared_facet"
    mesh = UnitIntervalMesh(20)


def test_ghost_2d(pushpop_parameters):
    modes = ["shared_vertex", "shared_facet"]
    for mode in modes:
        parameters["ghost_mode"] = mode
        N = 8
        num_cells = 128

        mesh = UnitSquareMesh(N, N)
        if MPI.size(mesh.mpi_comm()) > 1:
            assert MPI.sum(mesh.mpi_comm(), mesh.num_cells()) > num_cells

        parameters["reorder_cells_gps"] = True
        parameters["reorder_vertices_gps"] = False
        mesh = UnitSquareMesh(N, N)
        if MPI.size(mesh.mpi_comm()) > 1:
            assert MPI.sum(mesh.mpi_comm(), mesh.num_cells()) > num_cells

        parameters["reorder_cells_gps"] = True
        parameters["reorder_vertices_gps"] = True
        mesh = UnitSquareMesh(N, N)
        if MPI.size(mesh.mpi_comm()) > 1:
            assert MPI.sum(mesh.mpi_comm(), mesh.num_cells()) > num_cells

        parameters["reorder_cells_gps"] = False
        parameters["reorder_vertices_gps"] = True
        mesh = UnitSquareMesh(N, N)
        if MPI.size(mesh.mpi_comm()) > 1:
            assert MPI.sum(mesh.mpi_comm(), mesh.num_cells()) > num_cells


def test_ghost_3d(pushpop_parameters):
    modes = ["shared_vertex", "shared_facet"]
    for mode in modes:
        parameters["ghost_mode"] = mode
        N = 2
        num_cells = 48

        mesh = UnitCubeMesh(N, N, N)
        if MPI.size(mesh.mpi_comm()) > 1:
            assert MPI.sum(mesh.mpi_comm(), mesh.num_cells()) > num_cells

        parameters["reorder_cells_gps"] = True
        parameters["reorder_vertices_gps"] = False
        mesh = UnitCubeMesh(N, N, N)
        if MPI.size(mesh.mpi_comm()) > 1:
            assert MPI.sum(mesh.mpi_comm(), mesh.num_cells()) > num_cells

        parameters["reorder_cells_gps"] = True
        parameters["reorder_vertices_gps"] = True
        mesh = UnitCubeMesh(N, N, N)
        if MPI.size(mesh.mpi_comm()) > 1:
            assert MPI.sum(mesh.mpi_comm(), mesh.num_cells()) > num_cells

        parameters["reorder_cells_gps"] = False
        parameters["reorder_vertices_gps"] = True
        mesh = UnitCubeMesh(N, N, N)
        if MPI.size(mesh.mpi_comm()) > 1:
            assert MPI.sum(mesh.mpi_comm(), mesh.num_cells()) > num_cells


@pytest.mark.parametrize('gmode', ['shared_vertex', 'shared_facet', 'none'])
def test_ghost_connectivities(gmode, pushpop_parameters):
    parameters['ghost_mode'] = gmode

    # Ghosted mesh
    meshG = UnitSquareMesh(MPI.comm_world, 4, 4)
    meshG.init(1, 2)

    # Reference mesh, not ghosted, not parallel
    meshR = UnitSquareMesh(MPI.comm_self, 4, 4)
    meshR.init(1, 2)

    # Create reference mapping from facet midpoint to cell midpoint
    reference = {}
    for facet in facets(meshR):
        fidx = facet.index()
        facet_mp = tuple(facet.midpoint()[:])
        reference[facet_mp] = []
        for cidx in meshR.topology()(1, 2)(fidx):
            cell = Cell(meshR, cidx)
            cell_mp = tuple(cell.midpoint()[:])
            reference[facet_mp].append(cell_mp)

    # Loop through ghosted mesh and check connectivities
    allowable_cell_indices = [cell.index() for cell in cells(meshG, 'all')]
    for facet in facets(meshG, 'regular'):
        fidx = facet.index()
        facet_mp = tuple(facet.midpoint()[:])
        assert facet_mp in reference

        for cidx in meshG.topology()(1, 2)(fidx):
            assert cidx in allowable_cell_indices
            cell = Cell(meshG, cidx)
            cell_mp = tuple(cell.midpoint()[:])
            assert cell_mp in reference[facet_mp]
