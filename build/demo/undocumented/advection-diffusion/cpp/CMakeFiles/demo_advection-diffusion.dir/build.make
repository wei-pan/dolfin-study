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
include demo/undocumented/advection-diffusion/cpp/CMakeFiles/demo_advection-diffusion.dir/depend.make

# Include the progress variables for this target.
include demo/undocumented/advection-diffusion/cpp/CMakeFiles/demo_advection-diffusion.dir/progress.make

# Include the compile flags for this target's objects.
include demo/undocumented/advection-diffusion/cpp/CMakeFiles/demo_advection-diffusion.dir/flags.make

demo/undocumented/advection-diffusion/cpp/CMakeFiles/demo_advection-diffusion.dir/main.cpp.o: demo/undocumented/advection-diffusion/cpp/CMakeFiles/demo_advection-diffusion.dir/flags.make
demo/undocumented/advection-diffusion/cpp/CMakeFiles/demo_advection-diffusion.dir/main.cpp.o: ../demo/undocumented/advection-diffusion/cpp/main.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/wpan/DATA/fenics/dolfin/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object demo/undocumented/advection-diffusion/cpp/CMakeFiles/demo_advection-diffusion.dir/main.cpp.o"
	cd /home/wpan/DATA/fenics/dolfin/build/demo/undocumented/advection-diffusion/cpp && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/demo_advection-diffusion.dir/main.cpp.o -c /home/wpan/DATA/fenics/dolfin/demo/undocumented/advection-diffusion/cpp/main.cpp

demo/undocumented/advection-diffusion/cpp/CMakeFiles/demo_advection-diffusion.dir/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/demo_advection-diffusion.dir/main.cpp.i"
	cd /home/wpan/DATA/fenics/dolfin/build/demo/undocumented/advection-diffusion/cpp && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/wpan/DATA/fenics/dolfin/demo/undocumented/advection-diffusion/cpp/main.cpp > CMakeFiles/demo_advection-diffusion.dir/main.cpp.i

demo/undocumented/advection-diffusion/cpp/CMakeFiles/demo_advection-diffusion.dir/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/demo_advection-diffusion.dir/main.cpp.s"
	cd /home/wpan/DATA/fenics/dolfin/build/demo/undocumented/advection-diffusion/cpp && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/wpan/DATA/fenics/dolfin/demo/undocumented/advection-diffusion/cpp/main.cpp -o CMakeFiles/demo_advection-diffusion.dir/main.cpp.s

# Object files for target demo_advection-diffusion
demo_advection__diffusion_OBJECTS = \
"CMakeFiles/demo_advection-diffusion.dir/main.cpp.o"

# External object files for target demo_advection-diffusion
demo_advection__diffusion_EXTERNAL_OBJECTS =

demo/undocumented/advection-diffusion/cpp/demo_advection-diffusion: demo/undocumented/advection-diffusion/cpp/CMakeFiles/demo_advection-diffusion.dir/main.cpp.o
demo/undocumented/advection-diffusion/cpp/demo_advection-diffusion: demo/undocumented/advection-diffusion/cpp/CMakeFiles/demo_advection-diffusion.dir/build.make
demo/undocumented/advection-diffusion/cpp/demo_advection-diffusion: dolfin/libdolfin.so.2019.2.0.dev0
demo/undocumented/advection-diffusion/cpp/demo_advection-diffusion: /usr/local/lib/libboost_timer.so
demo/undocumented/advection-diffusion/cpp/demo_advection-diffusion: /usr/local/lib/libboost_chrono.so
demo/undocumented/advection-diffusion/cpp/demo_advection-diffusion: /home/wpan/DATA/petsc/arch-linux-c-debug/lib/libpetsc.so
demo/undocumented/advection-diffusion/cpp/demo_advection-diffusion: /home/wpan/DATA/mpich/lib/libmpicxx.so
demo/undocumented/advection-diffusion/cpp/demo_advection-diffusion: /home/wpan/DATA/mpich/lib/libmpi.so
demo/undocumented/advection-diffusion/cpp/demo_advection-diffusion: demo/undocumented/advection-diffusion/cpp/CMakeFiles/demo_advection-diffusion.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/wpan/DATA/fenics/dolfin/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable demo_advection-diffusion"
	cd /home/wpan/DATA/fenics/dolfin/build/demo/undocumented/advection-diffusion/cpp && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/demo_advection-diffusion.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
demo/undocumented/advection-diffusion/cpp/CMakeFiles/demo_advection-diffusion.dir/build: demo/undocumented/advection-diffusion/cpp/demo_advection-diffusion

.PHONY : demo/undocumented/advection-diffusion/cpp/CMakeFiles/demo_advection-diffusion.dir/build

demo/undocumented/advection-diffusion/cpp/CMakeFiles/demo_advection-diffusion.dir/clean:
	cd /home/wpan/DATA/fenics/dolfin/build/demo/undocumented/advection-diffusion/cpp && $(CMAKE_COMMAND) -P CMakeFiles/demo_advection-diffusion.dir/cmake_clean.cmake
.PHONY : demo/undocumented/advection-diffusion/cpp/CMakeFiles/demo_advection-diffusion.dir/clean

demo/undocumented/advection-diffusion/cpp/CMakeFiles/demo_advection-diffusion.dir/depend:
	cd /home/wpan/DATA/fenics/dolfin/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/wpan/DATA/fenics/dolfin /home/wpan/DATA/fenics/dolfin/demo/undocumented/advection-diffusion/cpp /home/wpan/DATA/fenics/dolfin/build /home/wpan/DATA/fenics/dolfin/build/demo/undocumented/advection-diffusion/cpp /home/wpan/DATA/fenics/dolfin/build/demo/undocumented/advection-diffusion/cpp/CMakeFiles/demo_advection-diffusion.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : demo/undocumented/advection-diffusion/cpp/CMakeFiles/demo_advection-diffusion.dir/depend

