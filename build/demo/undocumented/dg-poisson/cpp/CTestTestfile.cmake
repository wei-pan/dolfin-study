# CMake generated Testfile for 
# Source directory: /home/wpan/DATA/fenics/dolfin/demo/undocumented/dg-poisson/cpp
# Build directory: /home/wpan/DATA/fenics/dolfin/build/demo/undocumented/dg-poisson/cpp
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(demo_dg-poisson_mpi "mpirun" "-np" "3" "./demo_dg-poisson")
set_tests_properties(demo_dg-poisson_mpi PROPERTIES  _BACKTRACE_TRIPLES "/home/wpan/DATA/fenics/dolfin/demo/undocumented/dg-poisson/cpp/CMakeLists.txt;42;add_test;/home/wpan/DATA/fenics/dolfin/demo/undocumented/dg-poisson/cpp/CMakeLists.txt;0;")
add_test(demo_dg-poisson_serial "/home/wpan/DATA/fenics/dolfin/build/demo/undocumented/dg-poisson/cpp/demo_dg-poisson")
set_tests_properties(demo_dg-poisson_serial PROPERTIES  _BACKTRACE_TRIPLES "/home/wpan/DATA/fenics/dolfin/demo/undocumented/dg-poisson/cpp/CMakeLists.txt;43;add_test;/home/wpan/DATA/fenics/dolfin/demo/undocumented/dg-poisson/cpp/CMakeLists.txt;0;")
