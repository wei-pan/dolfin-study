# CMake generated Testfile for 
# Source directory: /home/wpan/DATA/fenics/dolfin/demo/undocumented/parallel-refinement/cpp
# Build directory: /home/wpan/DATA/fenics/dolfin/build/demo/undocumented/parallel-refinement/cpp
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(demo_parallel-refinement_mpi "mpirun" "-np" "3" "./demo_parallel-refinement")
set_tests_properties(demo_parallel-refinement_mpi PROPERTIES  _BACKTRACE_TRIPLES "/home/wpan/DATA/fenics/dolfin/demo/undocumented/parallel-refinement/cpp/CMakeLists.txt;42;add_test;/home/wpan/DATA/fenics/dolfin/demo/undocumented/parallel-refinement/cpp/CMakeLists.txt;0;")
add_test(demo_parallel-refinement_serial "/home/wpan/DATA/fenics/dolfin/build/demo/undocumented/parallel-refinement/cpp/demo_parallel-refinement")
set_tests_properties(demo_parallel-refinement_serial PROPERTIES  _BACKTRACE_TRIPLES "/home/wpan/DATA/fenics/dolfin/demo/undocumented/parallel-refinement/cpp/CMakeLists.txt;43;add_test;/home/wpan/DATA/fenics/dolfin/demo/undocumented/parallel-refinement/cpp/CMakeLists.txt;0;")
