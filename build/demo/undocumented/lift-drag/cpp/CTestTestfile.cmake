# CMake generated Testfile for 
# Source directory: /home/wpan/DATA/fenics/dolfin/demo/undocumented/lift-drag/cpp
# Build directory: /home/wpan/DATA/fenics/dolfin/build/demo/undocumented/lift-drag/cpp
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(demo_lift-drag_mpi "mpirun" "-np" "3" "./demo_lift-drag")
set_tests_properties(demo_lift-drag_mpi PROPERTIES  _BACKTRACE_TRIPLES "/home/wpan/DATA/fenics/dolfin/demo/undocumented/lift-drag/cpp/CMakeLists.txt;42;add_test;/home/wpan/DATA/fenics/dolfin/demo/undocumented/lift-drag/cpp/CMakeLists.txt;0;")
add_test(demo_lift-drag_serial "/home/wpan/DATA/fenics/dolfin/build/demo/undocumented/lift-drag/cpp/demo_lift-drag")
set_tests_properties(demo_lift-drag_serial PROPERTIES  _BACKTRACE_TRIPLES "/home/wpan/DATA/fenics/dolfin/demo/undocumented/lift-drag/cpp/CMakeLists.txt;43;add_test;/home/wpan/DATA/fenics/dolfin/demo/undocumented/lift-drag/cpp/CMakeLists.txt;0;")
