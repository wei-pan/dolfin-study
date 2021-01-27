# CMake generated Testfile for 
# Source directory: /home/wpan/DATA/fenics/dolfin/demo/undocumented/multimesh-stokes/cpp
# Build directory: /home/wpan/DATA/fenics/dolfin/build/demo/undocumented/multimesh-stokes/cpp
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(demo_multimesh-stokes_mpi "mpirun" "-np" "3" "./demo_multimesh-stokes")
set_tests_properties(demo_multimesh-stokes_mpi PROPERTIES  _BACKTRACE_TRIPLES "/home/wpan/DATA/fenics/dolfin/demo/undocumented/multimesh-stokes/cpp/CMakeLists.txt;42;add_test;/home/wpan/DATA/fenics/dolfin/demo/undocumented/multimesh-stokes/cpp/CMakeLists.txt;0;")
add_test(demo_multimesh-stokes_serial "/home/wpan/DATA/fenics/dolfin/build/demo/undocumented/multimesh-stokes/cpp/demo_multimesh-stokes")
set_tests_properties(demo_multimesh-stokes_serial PROPERTIES  _BACKTRACE_TRIPLES "/home/wpan/DATA/fenics/dolfin/demo/undocumented/multimesh-stokes/cpp/CMakeLists.txt;43;add_test;/home/wpan/DATA/fenics/dolfin/demo/undocumented/multimesh-stokes/cpp/CMakeLists.txt;0;")
