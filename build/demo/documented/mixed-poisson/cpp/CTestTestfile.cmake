# CMake generated Testfile for 
# Source directory: /home/wpan/DATA/fenics/dolfin/demo/documented/mixed-poisson/cpp
# Build directory: /home/wpan/DATA/fenics/dolfin/build/demo/documented/mixed-poisson/cpp
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(demo_mixed-poisson_mpi "mpirun" "-np" "3" "./demo_mixed-poisson")
set_tests_properties(demo_mixed-poisson_mpi PROPERTIES  _BACKTRACE_TRIPLES "/home/wpan/DATA/fenics/dolfin/demo/documented/mixed-poisson/cpp/CMakeLists.txt;42;add_test;/home/wpan/DATA/fenics/dolfin/demo/documented/mixed-poisson/cpp/CMakeLists.txt;0;")
add_test(demo_mixed-poisson_serial "/home/wpan/DATA/fenics/dolfin/build/demo/documented/mixed-poisson/cpp/demo_mixed-poisson")
set_tests_properties(demo_mixed-poisson_serial PROPERTIES  _BACKTRACE_TRIPLES "/home/wpan/DATA/fenics/dolfin/demo/documented/mixed-poisson/cpp/CMakeLists.txt;43;add_test;/home/wpan/DATA/fenics/dolfin/demo/documented/mixed-poisson/cpp/CMakeLists.txt;0;")
