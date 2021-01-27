# CMake generated Testfile for 
# Source directory: /home/wpan/DATA/fenics/dolfin/demo/undocumented/contact-vi-tao/cpp
# Build directory: /home/wpan/DATA/fenics/dolfin/build/demo/undocumented/contact-vi-tao/cpp
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(demo_contact-vi-tao_mpi "mpirun" "-np" "3" "./demo_contact-vi-tao")
set_tests_properties(demo_contact-vi-tao_mpi PROPERTIES  _BACKTRACE_TRIPLES "/home/wpan/DATA/fenics/dolfin/demo/undocumented/contact-vi-tao/cpp/CMakeLists.txt;42;add_test;/home/wpan/DATA/fenics/dolfin/demo/undocumented/contact-vi-tao/cpp/CMakeLists.txt;0;")
add_test(demo_contact-vi-tao_serial "/home/wpan/DATA/fenics/dolfin/build/demo/undocumented/contact-vi-tao/cpp/demo_contact-vi-tao")
set_tests_properties(demo_contact-vi-tao_serial PROPERTIES  _BACKTRACE_TRIPLES "/home/wpan/DATA/fenics/dolfin/demo/undocumented/contact-vi-tao/cpp/CMakeLists.txt;43;add_test;/home/wpan/DATA/fenics/dolfin/demo/undocumented/contact-vi-tao/cpp/CMakeLists.txt;0;")
