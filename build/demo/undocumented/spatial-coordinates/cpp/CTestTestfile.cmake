# CMake generated Testfile for 
# Source directory: /home/wpan/DATA/fenics/dolfin/demo/undocumented/spatial-coordinates/cpp
# Build directory: /home/wpan/DATA/fenics/dolfin/build/demo/undocumented/spatial-coordinates/cpp
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(demo_spatial-coordinates_mpi "mpirun" "-np" "3" "./demo_spatial-coordinates")
set_tests_properties(demo_spatial-coordinates_mpi PROPERTIES  _BACKTRACE_TRIPLES "/home/wpan/DATA/fenics/dolfin/demo/undocumented/spatial-coordinates/cpp/CMakeLists.txt;42;add_test;/home/wpan/DATA/fenics/dolfin/demo/undocumented/spatial-coordinates/cpp/CMakeLists.txt;0;")
add_test(demo_spatial-coordinates_serial "/home/wpan/DATA/fenics/dolfin/build/demo/undocumented/spatial-coordinates/cpp/demo_spatial-coordinates")
set_tests_properties(demo_spatial-coordinates_serial PROPERTIES  _BACKTRACE_TRIPLES "/home/wpan/DATA/fenics/dolfin/demo/undocumented/spatial-coordinates/cpp/CMakeLists.txt;43;add_test;/home/wpan/DATA/fenics/dolfin/demo/undocumented/spatial-coordinates/cpp/CMakeLists.txt;0;")
