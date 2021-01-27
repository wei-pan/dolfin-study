# CMake generated Testfile for 
# Source directory: /home/wpan/DATA/fenics/dolfin/demo/undocumented/nonmatching-projection/cpp
# Build directory: /home/wpan/DATA/fenics/dolfin/build/demo/undocumented/nonmatching-projection/cpp
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(demo_nonmatching-projection_mpi "mpirun" "-np" "3" "./demo_nonmatching-projection")
set_tests_properties(demo_nonmatching-projection_mpi PROPERTIES  _BACKTRACE_TRIPLES "/home/wpan/DATA/fenics/dolfin/demo/undocumented/nonmatching-projection/cpp/CMakeLists.txt;42;add_test;/home/wpan/DATA/fenics/dolfin/demo/undocumented/nonmatching-projection/cpp/CMakeLists.txt;0;")
add_test(demo_nonmatching-projection_serial "/home/wpan/DATA/fenics/dolfin/build/demo/undocumented/nonmatching-projection/cpp/demo_nonmatching-projection")
set_tests_properties(demo_nonmatching-projection_serial PROPERTIES  _BACKTRACE_TRIPLES "/home/wpan/DATA/fenics/dolfin/demo/undocumented/nonmatching-projection/cpp/CMakeLists.txt;43;add_test;/home/wpan/DATA/fenics/dolfin/demo/undocumented/nonmatching-projection/cpp/CMakeLists.txt;0;")
