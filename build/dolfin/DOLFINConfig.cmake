# - Build details for DOLFIN: Dynamic Object-oriented Library for
# - FINite element computation
#
# This file has been automatically generated.

# FIXME: Check that naming conforms to CMake standards

if (POLICY CMP0011)
  cmake_policy(SET CMP0011 NEW)
endif()

if (POLICY CMP0012)
  cmake_policy(SET CMP0012 NEW)
endif()

# Compute path
get_filename_component(DOLFIN_CMAKE_DIR "${CMAKE_CURRENT_LIST_FILE}" PATH)

# Library dependencies (contains definitions for IMPORTED targets)
# NOTE: DOLFIN demo CMakeLists.txt are written to be stand-alone, as
# well as the build system building the demo. Therefore, we need the
# below guard to avoid exporting the targets twice.
if (NOT TARGET dolfin)
  include("${DOLFIN_CMAKE_DIR}/DOLFINTargets.cmake")
endif()

# Compilers
set(DOLFIN_CXX_COMPILER "/usr/bin/c++")

# Compiler defintions
set(DOLFIN_CXX_DEFINITIONS "-DDOLFIN_VERSION=\"2019.2.0.dev0\";")

# Compiler flags
set(DOLFIN_CXX_FLAGS "")

# Linker flags
set(DOLFIN_LINK_FLAGS "")

# Include directories
set(DOLFIN_INCLUDE_DIRS "/usr/local/include")

# Third party include directories
set(DOLFIN_3RD_PARTY_INCLUDE_DIRS ";")

# DOLFIN library
set(DOLFIN_LIBRARIES dolfin)

# Version
set(DOLFIN_VERSION_MAJOR "2019")
set(DOLFIN_VERSION_MINOR "2")
set(DOLFIN_VERSION_MICRO "0")
set(DOLFIN_VERSION_STR   "2019.2.0.dev0")

# The location of the UseDOLFIN.cmake file
set(DOLFIN_USE_FILE "${DOLFIN_CMAKE_DIR}/UseDOLFIN.cmake")
