# CMake generated Testfile for 
# Source directory: /home/wpan/DATA/fenics/dolfin/demo/documented/built-in-meshes/cpp
# Build directory: /home/wpan/DATA/fenics/dolfin/build/demo/documented/built-in-meshes/cpp
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(demo_built-in-meshes_mpi "mpirun" "-np" "3" "./demo_built-in-meshes")
set_tests_properties(demo_built-in-meshes_mpi PROPERTIES  _BACKTRACE_TRIPLES "/home/wpan/DATA/fenics/dolfin/demo/documented/built-in-meshes/cpp/CMakeLists.txt;42;add_test;/home/wpan/DATA/fenics/dolfin/demo/documented/built-in-meshes/cpp/CMakeLists.txt;0;")
add_test(demo_built-in-meshes_serial "/home/wpan/DATA/fenics/dolfin/build/demo/documented/built-in-meshes/cpp/demo_built-in-meshes")
set_tests_properties(demo_built-in-meshes_serial PROPERTIES  _BACKTRACE_TRIPLES "/home/wpan/DATA/fenics/dolfin/demo/documented/built-in-meshes/cpp/CMakeLists.txt;43;add_test;/home/wpan/DATA/fenics/dolfin/demo/documented/built-in-meshes/cpp/CMakeLists.txt;0;")
