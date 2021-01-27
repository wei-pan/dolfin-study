# CMake generated Testfile for 
# Source directory: /home/wpan/DATA/fenics/dolfin/demo/undocumented/ale/cpp
# Build directory: /home/wpan/DATA/fenics/dolfin/build/demo/undocumented/ale/cpp
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(demo_ale_mpi "mpirun" "-np" "3" "./demo_ale")
set_tests_properties(demo_ale_mpi PROPERTIES  _BACKTRACE_TRIPLES "/home/wpan/DATA/fenics/dolfin/demo/undocumented/ale/cpp/CMakeLists.txt;42;add_test;/home/wpan/DATA/fenics/dolfin/demo/undocumented/ale/cpp/CMakeLists.txt;0;")
add_test(demo_ale_serial "/home/wpan/DATA/fenics/dolfin/build/demo/undocumented/ale/cpp/demo_ale")
set_tests_properties(demo_ale_serial PROPERTIES  _BACKTRACE_TRIPLES "/home/wpan/DATA/fenics/dolfin/demo/undocumented/ale/cpp/CMakeLists.txt;43;add_test;/home/wpan/DATA/fenics/dolfin/demo/undocumented/ale/cpp/CMakeLists.txt;0;")
