# CMake generated Testfile for 
# Source directory: /home/wpan/DATA/fenics/dolfin/demo/undocumented/parameters/cpp
# Build directory: /home/wpan/DATA/fenics/dolfin/build/demo/undocumented/parameters/cpp
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(demo_parameters_mpi "mpirun" "-np" "3" "./demo_parameters")
set_tests_properties(demo_parameters_mpi PROPERTIES  _BACKTRACE_TRIPLES "/home/wpan/DATA/fenics/dolfin/demo/undocumented/parameters/cpp/CMakeLists.txt;42;add_test;/home/wpan/DATA/fenics/dolfin/demo/undocumented/parameters/cpp/CMakeLists.txt;0;")
add_test(demo_parameters_serial "/home/wpan/DATA/fenics/dolfin/build/demo/undocumented/parameters/cpp/demo_parameters")
set_tests_properties(demo_parameters_serial PROPERTIES  _BACKTRACE_TRIPLES "/home/wpan/DATA/fenics/dolfin/demo/undocumented/parameters/cpp/CMakeLists.txt;43;add_test;/home/wpan/DATA/fenics/dolfin/demo/undocumented/parameters/cpp/CMakeLists.txt;0;")
