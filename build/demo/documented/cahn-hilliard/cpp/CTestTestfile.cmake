# CMake generated Testfile for 
# Source directory: /home/wpan/DATA/fenics/dolfin/demo/documented/cahn-hilliard/cpp
# Build directory: /home/wpan/DATA/fenics/dolfin/build/demo/documented/cahn-hilliard/cpp
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(demo_cahn-hilliard_mpi "mpirun" "-np" "3" "./demo_cahn-hilliard")
set_tests_properties(demo_cahn-hilliard_mpi PROPERTIES  _BACKTRACE_TRIPLES "/home/wpan/DATA/fenics/dolfin/demo/documented/cahn-hilliard/cpp/CMakeLists.txt;42;add_test;/home/wpan/DATA/fenics/dolfin/demo/documented/cahn-hilliard/cpp/CMakeLists.txt;0;")
add_test(demo_cahn-hilliard_serial "/home/wpan/DATA/fenics/dolfin/build/demo/documented/cahn-hilliard/cpp/demo_cahn-hilliard")
set_tests_properties(demo_cahn-hilliard_serial PROPERTIES  _BACKTRACE_TRIPLES "/home/wpan/DATA/fenics/dolfin/demo/documented/cahn-hilliard/cpp/CMakeLists.txt;43;add_test;/home/wpan/DATA/fenics/dolfin/demo/documented/cahn-hilliard/cpp/CMakeLists.txt;0;")
