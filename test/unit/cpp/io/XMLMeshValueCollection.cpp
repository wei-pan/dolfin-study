// Copyright (C) 2007 Magnus Vikstrøm
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

#include <dolfin.h>
#include <catch.hpp>

using namespace dolfin;

//-----------------------------------------------------------------------------
TEST_CASE("MeshValueCollection IO test", "[!hide][meshvaluecollection_io]")
{
  // Create mesh and read file
  // Link to the mesh is quite long...
  auto mesh = std::make_shared<UnitCubeMesh>(5, 5, 5);
  MeshValueCollection<std::size_t> markers(mesh, "./io/xml_value_collection_ref.xml");
  //MeshValueCollection<std::size_t>
  //  markers(mesh, "./test/unit/cpp/io/xml_value_collection_ref.xml");

  // Check size
  CHECK(dolfin::MPI::sum(mesh->mpi_comm(), markers.size()) == (std::size_t) 6);

  // Check sum of values
  const std::map<std::pair<std::size_t, std::size_t>, std::size_t>&
    values = markers.values();
  std::size_t sum = 0;
  for (auto it = values.begin(); it != values.end(); ++it)
    sum += it->second;

  CHECK(dolfin::MPI::sum(mesh->mpi_comm(), sum) == (std::size_t) 48);
}
