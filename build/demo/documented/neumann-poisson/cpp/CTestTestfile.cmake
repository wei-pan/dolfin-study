# CMake generated Testfile for 
# Source directory: /home/wpan/DATA/fenics/dolfin/demo/documented/neumann-poisson/cpp
# Build directory: /home/wpan/DATA/fenics/dolfin/build/demo/documented/neumann-poisson/cpp
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(demo_neumann-poisson_mpi "mpirun" "-np" "3" "./demo_neumann-poisson")
set_tests_properties(demo_neumann-poisson_mpi PROPERTIES  _BACKTRACE_TRIPLES "/home/wpan/DATA/fenics/dolfin/demo/documented/neumann-poisson/cpp/CMakeLists.txt;42;add_test;/home/wpan/DATA/fenics/dolfin/demo/documented/neumann-poisson/cpp/CMakeLists.txt;0;")
add_test(demo_neumann-poisson_serial "/home/wpan/DATA/fenics/dolfin/build/demo/documented/neumann-poisson/cpp/demo_neumann-poisson")
set_tests_properties(demo_neumann-poisson_serial PROPERTIES  _BACKTRACE_TRIPLES "/home/wpan/DATA/fenics/dolfin/demo/documented/neumann-poisson/cpp/CMakeLists.txt;43;add_test;/home/wpan/DATA/fenics/dolfin/demo/documented/neumann-poisson/cpp/CMakeLists.txt;0;")
