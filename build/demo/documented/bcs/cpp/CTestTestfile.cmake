# CMake generated Testfile for 
# Source directory: /home/wpan/DATA/fenics/dolfin/demo/documented/bcs/cpp
# Build directory: /home/wpan/DATA/fenics/dolfin/build/demo/documented/bcs/cpp
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(demo_bcs_mpi "mpirun" "-np" "3" "./demo_bcs")
set_tests_properties(demo_bcs_mpi PROPERTIES  _BACKTRACE_TRIPLES "/home/wpan/DATA/fenics/dolfin/demo/documented/bcs/cpp/CMakeLists.txt;42;add_test;/home/wpan/DATA/fenics/dolfin/demo/documented/bcs/cpp/CMakeLists.txt;0;")
add_test(demo_bcs_serial "/home/wpan/DATA/fenics/dolfin/build/demo/documented/bcs/cpp/demo_bcs")
set_tests_properties(demo_bcs_serial PROPERTIES  _BACKTRACE_TRIPLES "/home/wpan/DATA/fenics/dolfin/demo/documented/bcs/cpp/CMakeLists.txt;43;add_test;/home/wpan/DATA/fenics/dolfin/demo/documented/bcs/cpp/CMakeLists.txt;0;")
