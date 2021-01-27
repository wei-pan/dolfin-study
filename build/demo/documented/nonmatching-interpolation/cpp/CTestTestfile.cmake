# CMake generated Testfile for 
# Source directory: /home/wpan/DATA/fenics/dolfin/demo/documented/nonmatching-interpolation/cpp
# Build directory: /home/wpan/DATA/fenics/dolfin/build/demo/documented/nonmatching-interpolation/cpp
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(demo_nonmatching-interpolation_mpi "mpirun" "-np" "3" "./demo_nonmatching-interpolation")
set_tests_properties(demo_nonmatching-interpolation_mpi PROPERTIES  _BACKTRACE_TRIPLES "/home/wpan/DATA/fenics/dolfin/demo/documented/nonmatching-interpolation/cpp/CMakeLists.txt;42;add_test;/home/wpan/DATA/fenics/dolfin/demo/documented/nonmatching-interpolation/cpp/CMakeLists.txt;0;")
add_test(demo_nonmatching-interpolation_serial "/home/wpan/DATA/fenics/dolfin/build/demo/documented/nonmatching-interpolation/cpp/demo_nonmatching-interpolation")
set_tests_properties(demo_nonmatching-interpolation_serial PROPERTIES  _BACKTRACE_TRIPLES "/home/wpan/DATA/fenics/dolfin/demo/documented/nonmatching-interpolation/cpp/CMakeLists.txt;43;add_test;/home/wpan/DATA/fenics/dolfin/demo/documented/nonmatching-interpolation/cpp/CMakeLists.txt;0;")
