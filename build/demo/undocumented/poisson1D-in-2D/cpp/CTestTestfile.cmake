# CMake generated Testfile for 
# Source directory: /home/wpan/DATA/fenics/dolfin/demo/undocumented/poisson1D-in-2D/cpp
# Build directory: /home/wpan/DATA/fenics/dolfin/build/demo/undocumented/poisson1D-in-2D/cpp
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(demo_poisson1D-in-2D_mpi "mpirun" "-np" "3" "./demo_poisson1D-in-2D")
set_tests_properties(demo_poisson1D-in-2D_mpi PROPERTIES  _BACKTRACE_TRIPLES "/home/wpan/DATA/fenics/dolfin/demo/undocumented/poisson1D-in-2D/cpp/CMakeLists.txt;42;add_test;/home/wpan/DATA/fenics/dolfin/demo/undocumented/poisson1D-in-2D/cpp/CMakeLists.txt;0;")
add_test(demo_poisson1D-in-2D_serial "/home/wpan/DATA/fenics/dolfin/build/demo/undocumented/poisson1D-in-2D/cpp/demo_poisson1D-in-2D")
set_tests_properties(demo_poisson1D-in-2D_serial PROPERTIES  _BACKTRACE_TRIPLES "/home/wpan/DATA/fenics/dolfin/demo/undocumented/poisson1D-in-2D/cpp/CMakeLists.txt;43;add_test;/home/wpan/DATA/fenics/dolfin/demo/undocumented/poisson1D-in-2D/cpp/CMakeLists.txt;0;")
