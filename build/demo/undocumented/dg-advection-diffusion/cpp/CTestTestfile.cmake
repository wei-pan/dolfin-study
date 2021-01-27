# CMake generated Testfile for 
# Source directory: /home/wpan/DATA/fenics/dolfin/demo/undocumented/dg-advection-diffusion/cpp
# Build directory: /home/wpan/DATA/fenics/dolfin/build/demo/undocumented/dg-advection-diffusion/cpp
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(demo_dg-advection-diffusion_mpi "mpirun" "-np" "3" "./demo_dg-advection-diffusion")
set_tests_properties(demo_dg-advection-diffusion_mpi PROPERTIES  _BACKTRACE_TRIPLES "/home/wpan/DATA/fenics/dolfin/demo/undocumented/dg-advection-diffusion/cpp/CMakeLists.txt;42;add_test;/home/wpan/DATA/fenics/dolfin/demo/undocumented/dg-advection-diffusion/cpp/CMakeLists.txt;0;")
add_test(demo_dg-advection-diffusion_serial "/home/wpan/DATA/fenics/dolfin/build/demo/undocumented/dg-advection-diffusion/cpp/demo_dg-advection-diffusion")
set_tests_properties(demo_dg-advection-diffusion_serial PROPERTIES  _BACKTRACE_TRIPLES "/home/wpan/DATA/fenics/dolfin/demo/undocumented/dg-advection-diffusion/cpp/CMakeLists.txt;43;add_test;/home/wpan/DATA/fenics/dolfin/demo/undocumented/dg-advection-diffusion/cpp/CMakeLists.txt;0;")
