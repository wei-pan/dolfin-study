# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.16

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/local/bin/cmake

# The command to remove a file.
RM = /usr/local/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/wpan/DATA/fenics/dolfin

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/wpan/DATA/fenics/dolfin/build

# Include any dependencies generated for this target.
include demo/documented/neumann-poisson/cpp/CMakeFiles/demo_neumann-poisson.dir/depend.make

# Include the progress variables for this target.
include demo/documented/neumann-poisson/cpp/CMakeFiles/demo_neumann-poisson.dir/progress.make

# Include the compile flags for this target's objects.
include demo/documented/neumann-poisson/cpp/CMakeFiles/demo_neumann-poisson.dir/flags.make

demo/documented/neumann-poisson/cpp/CMakeFiles/demo_neumann-poisson.dir/main.cpp.o: demo/documented/neumann-poisson/cpp/CMakeFiles/demo_neumann-poisson.dir/flags.make
demo/documented/neumann-poisson/cpp/CMakeFiles/demo_neumann-poisson.dir/main.cpp.o: ../demo/documented/neumann-poisson/cpp/main.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/wpan/DATA/fenics/dolfin/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object demo/documented/neumann-poisson/cpp/CMakeFiles/demo_neumann-poisson.dir/main.cpp.o"
	cd /home/wpan/DATA/fenics/dolfin/build/demo/documented/neumann-poisson/cpp && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/demo_neumann-poisson.dir/main.cpp.o -c /home/wpan/DATA/fenics/dolfin/demo/documented/neumann-poisson/cpp/main.cpp

demo/documented/neumann-poisson/cpp/CMakeFiles/demo_neumann-poisson.dir/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/demo_neumann-poisson.dir/main.cpp.i"
	cd /home/wpan/DATA/fenics/dolfin/build/demo/documented/neumann-poisson/cpp && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/wpan/DATA/fenics/dolfin/demo/documented/neumann-poisson/cpp/main.cpp > CMakeFiles/demo_neumann-poisson.dir/main.cpp.i

demo/documented/neumann-poisson/cpp/CMakeFiles/demo_neumann-poisson.dir/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/demo_neumann-poisson.dir/main.cpp.s"
	cd /home/wpan/DATA/fenics/dolfin/build/demo/documented/neumann-poisson/cpp && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/wpan/DATA/fenics/dolfin/demo/documented/neumann-poisson/cpp/main.cpp -o CMakeFiles/demo_neumann-poisson.dir/main.cpp.s

# Object files for target demo_neumann-poisson
demo_neumann__poisson_OBJECTS = \
"CMakeFiles/demo_neumann-poisson.dir/main.cpp.o"

# External object files for target demo_neumann-poisson
demo_neumann__poisson_EXTERNAL_OBJECTS =

demo/documented/neumann-poisson/cpp/demo_neumann-poisson: demo/documented/neumann-poisson/cpp/CMakeFiles/demo_neumann-poisson.dir/main.cpp.o
demo/documented/neumann-poisson/cpp/demo_neumann-poisson: demo/documented/neumann-poisson/cpp/CMakeFiles/demo_neumann-poisson.dir/build.make
demo/documented/neumann-poisson/cpp/demo_neumann-poisson: dolfin/libdolfin.so.2019.2.0.dev0
demo/documented/neumann-poisson/cpp/demo_neumann-poisson: /usr/local/lib/libboost_timer.so
demo/documented/neumann-poisson/cpp/demo_neumann-poisson: /usr/local/lib/libboost_chrono.so
demo/documented/neumann-poisson/cpp/demo_neumann-poisson: /home/wpan/DATA/petsc/arch-linux-c-debug/lib/libpetsc.so
demo/documented/neumann-poisson/cpp/demo_neumann-poisson: /home/wpan/DATA/mpich/lib/libmpicxx.so
demo/documented/neumann-poisson/cpp/demo_neumann-poisson: /home/wpan/DATA/mpich/lib/libmpi.so
demo/documented/neumann-poisson/cpp/demo_neumann-poisson: demo/documented/neumann-poisson/cpp/CMakeFiles/demo_neumann-poisson.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/wpan/DATA/fenics/dolfin/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable demo_neumann-poisson"
	cd /home/wpan/DATA/fenics/dolfin/build/demo/documented/neumann-poisson/cpp && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/demo_neumann-poisson.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
demo/documented/neumann-poisson/cpp/CMakeFiles/demo_neumann-poisson.dir/build: demo/documented/neumann-poisson/cpp/demo_neumann-poisson

.PHONY : demo/documented/neumann-poisson/cpp/CMakeFiles/demo_neumann-poisson.dir/build

demo/documented/neumann-poisson/cpp/CMakeFiles/demo_neumann-poisson.dir/clean:
	cd /home/wpan/DATA/fenics/dolfin/build/demo/documented/neumann-poisson/cpp && $(CMAKE_COMMAND) -P CMakeFiles/demo_neumann-poisson.dir/cmake_clean.cmake
.PHONY : demo/documented/neumann-poisson/cpp/CMakeFiles/demo_neumann-poisson.dir/clean

demo/documented/neumann-poisson/cpp/CMakeFiles/demo_neumann-poisson.dir/depend:
	cd /home/wpan/DATA/fenics/dolfin/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/wpan/DATA/fenics/dolfin /home/wpan/DATA/fenics/dolfin/demo/documented/neumann-poisson/cpp /home/wpan/DATA/fenics/dolfin/build /home/wpan/DATA/fenics/dolfin/build/demo/documented/neumann-poisson/cpp /home/wpan/DATA/fenics/dolfin/build/demo/documented/neumann-poisson/cpp/CMakeFiles/demo_neumann-poisson.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : demo/documented/neumann-poisson/cpp/CMakeFiles/demo_neumann-poisson.dir/depend

