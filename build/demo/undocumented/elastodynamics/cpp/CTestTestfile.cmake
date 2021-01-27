# CMake generated Testfile for 
# Source directory: /home/wpan/DATA/fenics/dolfin/demo/undocumented/elastodynamics/cpp
# Build directory: /home/wpan/DATA/fenics/dolfin/build/demo/undocumented/elastodynamics/cpp
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(demo_elastodynamics_mpi "mpirun" "-np" "3" "./demo_elastodynamics")
set_tests_properties(demo_elastodynamics_mpi PROPERTIES  _BACKTRACE_TRIPLES "/home/wpan/DATA/fenics/dolfin/demo/undocumented/elastodynamics/cpp/CMakeLists.txt;42;add_test;/home/wpan/DATA/fenics/dolfin/demo/undocumented/elastodynamics/cpp/CMakeLists.txt;0;")
add_test(demo_elastodynamics_serial "/home/wpan/DATA/fenics/dolfin/build/demo/undocumented/elastodynamics/cpp/demo_elastodynamics")
set_tests_properties(demo_elastodynamics_serial PROPERTIES  _BACKTRACE_TRIPLES "/home/wpan/DATA/fenics/dolfin/demo/undocumented/elastodynamics/cpp/CMakeLists.txt;43;add_test;/home/wpan/DATA/fenics/dolfin/demo/undocumented/elastodynamics/cpp/CMakeLists.txt;0;")
