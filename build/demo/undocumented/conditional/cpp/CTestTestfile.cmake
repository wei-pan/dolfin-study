# CMake generated Testfile for 
# Source directory: /home/wpan/DATA/fenics/dolfin/demo/undocumented/conditional/cpp
# Build directory: /home/wpan/DATA/fenics/dolfin/build/demo/undocumented/conditional/cpp
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(demo_conditional_mpi "mpirun" "-np" "3" "./demo_conditional")
set_tests_properties(demo_conditional_mpi PROPERTIES  _BACKTRACE_TRIPLES "/home/wpan/DATA/fenics/dolfin/demo/undocumented/conditional/cpp/CMakeLists.txt;42;add_test;/home/wpan/DATA/fenics/dolfin/demo/undocumented/conditional/cpp/CMakeLists.txt;0;")
add_test(demo_conditional_serial "/home/wpan/DATA/fenics/dolfin/build/demo/undocumented/conditional/cpp/demo_conditional")
set_tests_properties(demo_conditional_serial PROPERTIES  _BACKTRACE_TRIPLES "/home/wpan/DATA/fenics/dolfin/demo/undocumented/conditional/cpp/CMakeLists.txt;43;add_test;/home/wpan/DATA/fenics/dolfin/demo/undocumented/conditional/cpp/CMakeLists.txt;0;")
