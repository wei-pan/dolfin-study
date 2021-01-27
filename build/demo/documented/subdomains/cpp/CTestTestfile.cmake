# CMake generated Testfile for 
# Source directory: /home/wpan/DATA/fenics/dolfin/demo/documented/subdomains/cpp
# Build directory: /home/wpan/DATA/fenics/dolfin/build/demo/documented/subdomains/cpp
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(demo_subdomains_mpi "mpirun" "-np" "3" "./demo_subdomains")
set_tests_properties(demo_subdomains_mpi PROPERTIES  _BACKTRACE_TRIPLES "/home/wpan/DATA/fenics/dolfin/demo/documented/subdomains/cpp/CMakeLists.txt;42;add_test;/home/wpan/DATA/fenics/dolfin/demo/documented/subdomains/cpp/CMakeLists.txt;0;")
add_test(demo_subdomains_serial "/home/wpan/DATA/fenics/dolfin/build/demo/documented/subdomains/cpp/demo_subdomains")
set_tests_properties(demo_subdomains_serial PROPERTIES  _BACKTRACE_TRIPLES "/home/wpan/DATA/fenics/dolfin/demo/documented/subdomains/cpp/CMakeLists.txt;43;add_test;/home/wpan/DATA/fenics/dolfin/demo/documented/subdomains/cpp/CMakeLists.txt;0;")
