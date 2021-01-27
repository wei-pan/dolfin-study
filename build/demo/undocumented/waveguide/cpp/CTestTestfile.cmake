# CMake generated Testfile for 
# Source directory: /home/wpan/DATA/fenics/dolfin/demo/undocumented/waveguide/cpp
# Build directory: /home/wpan/DATA/fenics/dolfin/build/demo/undocumented/waveguide/cpp
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(demo_waveguide_mpi "mpirun" "-np" "3" "./demo_waveguide")
set_tests_properties(demo_waveguide_mpi PROPERTIES  _BACKTRACE_TRIPLES "/home/wpan/DATA/fenics/dolfin/demo/undocumented/waveguide/cpp/CMakeLists.txt;42;add_test;/home/wpan/DATA/fenics/dolfin/demo/undocumented/waveguide/cpp/CMakeLists.txt;0;")
add_test(demo_waveguide_serial "/home/wpan/DATA/fenics/dolfin/build/demo/undocumented/waveguide/cpp/demo_waveguide")
set_tests_properties(demo_waveguide_serial PROPERTIES  _BACKTRACE_TRIPLES "/home/wpan/DATA/fenics/dolfin/demo/undocumented/waveguide/cpp/CMakeLists.txt;43;add_test;/home/wpan/DATA/fenics/dolfin/demo/undocumented/waveguide/cpp/CMakeLists.txt;0;")
