# CMake generated Testfile for 
# Source directory: /home/wpan/DATA/fenics/dolfin/demo/undocumented/curl-curl/cpp
# Build directory: /home/wpan/DATA/fenics/dolfin/build/demo/undocumented/curl-curl/cpp
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(demo_curl-curl_mpi "mpirun" "-np" "3" "./demo_curl-curl")
set_tests_properties(demo_curl-curl_mpi PROPERTIES  _BACKTRACE_TRIPLES "/home/wpan/DATA/fenics/dolfin/demo/undocumented/curl-curl/cpp/CMakeLists.txt;42;add_test;/home/wpan/DATA/fenics/dolfin/demo/undocumented/curl-curl/cpp/CMakeLists.txt;0;")
add_test(demo_curl-curl_serial "/home/wpan/DATA/fenics/dolfin/build/demo/undocumented/curl-curl/cpp/demo_curl-curl")
set_tests_properties(demo_curl-curl_serial PROPERTIES  _BACKTRACE_TRIPLES "/home/wpan/DATA/fenics/dolfin/demo/undocumented/curl-curl/cpp/CMakeLists.txt;43;add_test;/home/wpan/DATA/fenics/dolfin/demo/undocumented/curl-curl/cpp/CMakeLists.txt;0;")
