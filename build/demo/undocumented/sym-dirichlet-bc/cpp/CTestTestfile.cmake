# CMake generated Testfile for 
# Source directory: /home/wpan/DATA/fenics/dolfin/demo/undocumented/sym-dirichlet-bc/cpp
# Build directory: /home/wpan/DATA/fenics/dolfin/build/demo/undocumented/sym-dirichlet-bc/cpp
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(demo_sym-dirichlet-bc_mpi "mpirun" "-np" "3" "./demo_sym-dirichlet-bc")
set_tests_properties(demo_sym-dirichlet-bc_mpi PROPERTIES  _BACKTRACE_TRIPLES "/home/wpan/DATA/fenics/dolfin/demo/undocumented/sym-dirichlet-bc/cpp/CMakeLists.txt;42;add_test;/home/wpan/DATA/fenics/dolfin/demo/undocumented/sym-dirichlet-bc/cpp/CMakeLists.txt;0;")
add_test(demo_sym-dirichlet-bc_serial "/home/wpan/DATA/fenics/dolfin/build/demo/undocumented/sym-dirichlet-bc/cpp/demo_sym-dirichlet-bc")
set_tests_properties(demo_sym-dirichlet-bc_serial PROPERTIES  _BACKTRACE_TRIPLES "/home/wpan/DATA/fenics/dolfin/demo/undocumented/sym-dirichlet-bc/cpp/CMakeLists.txt;43;add_test;/home/wpan/DATA/fenics/dolfin/demo/undocumented/sym-dirichlet-bc/cpp/CMakeLists.txt;0;")
