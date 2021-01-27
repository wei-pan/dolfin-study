# CMake generated Testfile for 
# Source directory: /home/wpan/DATA/fenics/dolfin/demo/undocumented/block-matrix/cpp
# Build directory: /home/wpan/DATA/fenics/dolfin/build/demo/undocumented/block-matrix/cpp
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(demo_block-matrix_mpi "mpirun" "-np" "3" "./demo_block-matrix")
set_tests_properties(demo_block-matrix_mpi PROPERTIES  _BACKTRACE_TRIPLES "/home/wpan/DATA/fenics/dolfin/demo/undocumented/block-matrix/cpp/CMakeLists.txt;42;add_test;/home/wpan/DATA/fenics/dolfin/demo/undocumented/block-matrix/cpp/CMakeLists.txt;0;")
add_test(demo_block-matrix_serial "/home/wpan/DATA/fenics/dolfin/build/demo/undocumented/block-matrix/cpp/demo_block-matrix")
set_tests_properties(demo_block-matrix_serial PROPERTIES  _BACKTRACE_TRIPLES "/home/wpan/DATA/fenics/dolfin/demo/undocumented/block-matrix/cpp/CMakeLists.txt;43;add_test;/home/wpan/DATA/fenics/dolfin/demo/undocumented/block-matrix/cpp/CMakeLists.txt;0;")
