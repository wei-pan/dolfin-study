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

# Utility rule file for copy_data_test_demo.

# Include the progress variables for this target.
include CMakeFiles/copy_data_test_demo.dir/progress.make

CMakeFiles/copy_data_test_demo:
	/usr/bin/python3 -B -u /home/wpan/DATA/fenics/dolfin/cmake/scripts/copy-test-demo-data.py /home/wpan/DATA/fenics/dolfin/build

copy_data_test_demo: CMakeFiles/copy_data_test_demo
copy_data_test_demo: CMakeFiles/copy_data_test_demo.dir/build.make

.PHONY : copy_data_test_demo

# Rule to build all files generated by this target.
CMakeFiles/copy_data_test_demo.dir/build: copy_data_test_demo

.PHONY : CMakeFiles/copy_data_test_demo.dir/build

CMakeFiles/copy_data_test_demo.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/copy_data_test_demo.dir/cmake_clean.cmake
.PHONY : CMakeFiles/copy_data_test_demo.dir/clean

CMakeFiles/copy_data_test_demo.dir/depend:
	cd /home/wpan/DATA/fenics/dolfin/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/wpan/DATA/fenics/dolfin /home/wpan/DATA/fenics/dolfin /home/wpan/DATA/fenics/dolfin/build /home/wpan/DATA/fenics/dolfin/build /home/wpan/DATA/fenics/dolfin/build/CMakeFiles/copy_data_test_demo.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/copy_data_test_demo.dir/depend

