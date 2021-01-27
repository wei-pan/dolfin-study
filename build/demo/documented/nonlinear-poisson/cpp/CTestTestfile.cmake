# CMake generated Testfile for 
# Source directory: /home/wpan/DATA/fenics/dolfin/demo/documented/nonlinear-poisson/cpp
# Build directory: /home/wpan/DATA/fenics/dolfin/build/demo/documented/nonlinear-poisson/cpp
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(demo_nonlinear-poisson_mpi "mpirun" "-np" "3" "./demo_nonlinear-poisson")
set_tests_properties(demo_nonlinear-poisson_mpi PROPERTIES  _BACKTRACE_TRIPLES "/home/wpan/DATA/fenics/dolfin/demo/documented/nonlinear-poisson/cpp/CMakeLists.txt;42;add_test;/home/wpan/DATA/fenics/dolfin/demo/documented/nonlinear-poisson/cpp/CMakeLists.txt;0;")
add_test(demo_nonlinear-poisson_serial "/home/wpan/DATA/fenics/dolfin/build/demo/documented/nonlinear-poisson/cpp/demo_nonlinear-poisson")
set_tests_properties(demo_nonlinear-poisson_serial PROPERTIES  _BACKTRACE_TRIPLES "/home/wpan/DATA/fenics/dolfin/demo/documented/nonlinear-poisson/cpp/CMakeLists.txt;43;add_test;/home/wpan/DATA/fenics/dolfin/demo/documented/nonlinear-poisson/cpp/CMakeLists.txt;0;")
