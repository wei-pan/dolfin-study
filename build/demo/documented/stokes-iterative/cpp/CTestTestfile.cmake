# CMake generated Testfile for 
# Source directory: /home/wpan/DATA/fenics/dolfin/demo/documented/stokes-iterative/cpp
# Build directory: /home/wpan/DATA/fenics/dolfin/build/demo/documented/stokes-iterative/cpp
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(demo_stokes-iterative_mpi "mpirun" "-np" "3" "./demo_stokes-iterative")
set_tests_properties(demo_stokes-iterative_mpi PROPERTIES  _BACKTRACE_TRIPLES "/home/wpan/DATA/fenics/dolfin/demo/documented/stokes-iterative/cpp/CMakeLists.txt;42;add_test;/home/wpan/DATA/fenics/dolfin/demo/documented/stokes-iterative/cpp/CMakeLists.txt;0;")
add_test(demo_stokes-iterative_serial "/home/wpan/DATA/fenics/dolfin/build/demo/documented/stokes-iterative/cpp/demo_stokes-iterative")
set_tests_properties(demo_stokes-iterative_serial PROPERTIES  _BACKTRACE_TRIPLES "/home/wpan/DATA/fenics/dolfin/demo/documented/stokes-iterative/cpp/CMakeLists.txt;43;add_test;/home/wpan/DATA/fenics/dolfin/demo/documented/stokes-iterative/cpp/CMakeLists.txt;0;")
