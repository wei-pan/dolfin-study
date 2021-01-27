# CMake generated Testfile for 
# Source directory: /home/wpan/DATA/fenics/dolfin/demo/documented/auto-adaptive-poisson/cpp
# Build directory: /home/wpan/DATA/fenics/dolfin/build/demo/documented/auto-adaptive-poisson/cpp
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(demo_auto-adaptive-poisson_mpi "mpirun" "-np" "3" "./demo_auto-adaptive-poisson")
set_tests_properties(demo_auto-adaptive-poisson_mpi PROPERTIES  _BACKTRACE_TRIPLES "/home/wpan/DATA/fenics/dolfin/demo/documented/auto-adaptive-poisson/cpp/CMakeLists.txt;42;add_test;/home/wpan/DATA/fenics/dolfin/demo/documented/auto-adaptive-poisson/cpp/CMakeLists.txt;0;")
add_test(demo_auto-adaptive-poisson_serial "/home/wpan/DATA/fenics/dolfin/build/demo/documented/auto-adaptive-poisson/cpp/demo_auto-adaptive-poisson")
set_tests_properties(demo_auto-adaptive-poisson_serial PROPERTIES  _BACKTRACE_TRIPLES "/home/wpan/DATA/fenics/dolfin/demo/documented/auto-adaptive-poisson/cpp/CMakeLists.txt;43;add_test;/home/wpan/DATA/fenics/dolfin/demo/documented/auto-adaptive-poisson/cpp/CMakeLists.txt;0;")
