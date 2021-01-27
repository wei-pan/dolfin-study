# CMake generated Testfile for 
# Source directory: /home/wpan/DATA/fenics/dolfin/demo/documented/navier-stokes/cpp
# Build directory: /home/wpan/DATA/fenics/dolfin/build/demo/documented/navier-stokes/cpp
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(demo_navier-stokes_mpi "mpirun" "-np" "3" "./demo_navier-stokes")
set_tests_properties(demo_navier-stokes_mpi PROPERTIES  _BACKTRACE_TRIPLES "/home/wpan/DATA/fenics/dolfin/demo/documented/navier-stokes/cpp/CMakeLists.txt;42;add_test;/home/wpan/DATA/fenics/dolfin/demo/documented/navier-stokes/cpp/CMakeLists.txt;0;")
add_test(demo_navier-stokes_serial "/home/wpan/DATA/fenics/dolfin/build/demo/documented/navier-stokes/cpp/demo_navier-stokes")
set_tests_properties(demo_navier-stokes_serial PROPERTIES  _BACKTRACE_TRIPLES "/home/wpan/DATA/fenics/dolfin/demo/documented/navier-stokes/cpp/CMakeLists.txt;43;add_test;/home/wpan/DATA/fenics/dolfin/demo/documented/navier-stokes/cpp/CMakeLists.txt;0;")
