# CMake generated Testfile for 
# Source directory: /home/wpan/DATA/fenics/dolfin/demo/documented/periodic/cpp
# Build directory: /home/wpan/DATA/fenics/dolfin/build/demo/documented/periodic/cpp
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(demo_periodic_mpi "mpirun" "-np" "3" "./demo_periodic")
set_tests_properties(demo_periodic_mpi PROPERTIES  _BACKTRACE_TRIPLES "/home/wpan/DATA/fenics/dolfin/demo/documented/periodic/cpp/CMakeLists.txt;42;add_test;/home/wpan/DATA/fenics/dolfin/demo/documented/periodic/cpp/CMakeLists.txt;0;")
add_test(demo_periodic_serial "/home/wpan/DATA/fenics/dolfin/build/demo/documented/periodic/cpp/demo_periodic")
set_tests_properties(demo_periodic_serial PROPERTIES  _BACKTRACE_TRIPLES "/home/wpan/DATA/fenics/dolfin/demo/documented/periodic/cpp/CMakeLists.txt;43;add_test;/home/wpan/DATA/fenics/dolfin/demo/documented/periodic/cpp/CMakeLists.txt;0;")
