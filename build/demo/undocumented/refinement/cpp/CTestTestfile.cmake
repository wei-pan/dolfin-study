# CMake generated Testfile for 
# Source directory: /home/wpan/DATA/fenics/dolfin/demo/undocumented/refinement/cpp
# Build directory: /home/wpan/DATA/fenics/dolfin/build/demo/undocumented/refinement/cpp
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(demo_refinement_mpi "mpirun" "-np" "3" "./demo_refinement")
set_tests_properties(demo_refinement_mpi PROPERTIES  _BACKTRACE_TRIPLES "/home/wpan/DATA/fenics/dolfin/demo/undocumented/refinement/cpp/CMakeLists.txt;42;add_test;/home/wpan/DATA/fenics/dolfin/demo/undocumented/refinement/cpp/CMakeLists.txt;0;")
add_test(demo_refinement_serial "/home/wpan/DATA/fenics/dolfin/build/demo/undocumented/refinement/cpp/demo_refinement")
set_tests_properties(demo_refinement_serial PROPERTIES  _BACKTRACE_TRIPLES "/home/wpan/DATA/fenics/dolfin/demo/undocumented/refinement/cpp/CMakeLists.txt;43;add_test;/home/wpan/DATA/fenics/dolfin/demo/undocumented/refinement/cpp/CMakeLists.txt;0;")
