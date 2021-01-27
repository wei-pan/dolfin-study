# CMake generated Testfile for 
# Source directory: /home/wpan/DATA/fenics/dolfin/demo/undocumented/mesh-quality/cpp
# Build directory: /home/wpan/DATA/fenics/dolfin/build/demo/undocumented/mesh-quality/cpp
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(demo_mesh-quality_mpi "mpirun" "-np" "3" "./demo_mesh-quality")
set_tests_properties(demo_mesh-quality_mpi PROPERTIES  _BACKTRACE_TRIPLES "/home/wpan/DATA/fenics/dolfin/demo/undocumented/mesh-quality/cpp/CMakeLists.txt;42;add_test;/home/wpan/DATA/fenics/dolfin/demo/undocumented/mesh-quality/cpp/CMakeLists.txt;0;")
add_test(demo_mesh-quality_serial "/home/wpan/DATA/fenics/dolfin/build/demo/undocumented/mesh-quality/cpp/demo_mesh-quality")
set_tests_properties(demo_mesh-quality_serial PROPERTIES  _BACKTRACE_TRIPLES "/home/wpan/DATA/fenics/dolfin/demo/undocumented/mesh-quality/cpp/CMakeLists.txt;43;add_test;/home/wpan/DATA/fenics/dolfin/demo/undocumented/mesh-quality/cpp/CMakeLists.txt;0;")
