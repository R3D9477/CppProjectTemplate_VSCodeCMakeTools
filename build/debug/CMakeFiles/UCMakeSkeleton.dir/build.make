# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.29

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/local/lib/python3.8/dist-packages/cmake/data/bin/cmake

# The command to remove a file.
RM = /usr/local/lib/python3.8/dist-packages/cmake/data/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/luxoft/Projects/r3d/UCMakeSkeleton

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/luxoft/Projects/r3d/UCMakeSkeleton/build/debug

# Include any dependencies generated for this target.
include CMakeFiles/UCMakeSkeleton.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/UCMakeSkeleton.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/UCMakeSkeleton.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/UCMakeSkeleton.dir/flags.make

CMakeFiles/UCMakeSkeleton.dir/main.cpp.o: CMakeFiles/UCMakeSkeleton.dir/flags.make
CMakeFiles/UCMakeSkeleton.dir/main.cpp.o: /home/luxoft/Projects/r3d/UCMakeSkeleton/main.cpp
CMakeFiles/UCMakeSkeleton.dir/main.cpp.o: CMakeFiles/UCMakeSkeleton.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/luxoft/Projects/r3d/UCMakeSkeleton/build/debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/UCMakeSkeleton.dir/main.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/UCMakeSkeleton.dir/main.cpp.o -MF CMakeFiles/UCMakeSkeleton.dir/main.cpp.o.d -o CMakeFiles/UCMakeSkeleton.dir/main.cpp.o -c /home/luxoft/Projects/r3d/UCMakeSkeleton/main.cpp

CMakeFiles/UCMakeSkeleton.dir/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/UCMakeSkeleton.dir/main.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/luxoft/Projects/r3d/UCMakeSkeleton/main.cpp > CMakeFiles/UCMakeSkeleton.dir/main.cpp.i

CMakeFiles/UCMakeSkeleton.dir/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/UCMakeSkeleton.dir/main.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/luxoft/Projects/r3d/UCMakeSkeleton/main.cpp -o CMakeFiles/UCMakeSkeleton.dir/main.cpp.s

# Object files for target UCMakeSkeleton
UCMakeSkeleton_OBJECTS = \
"CMakeFiles/UCMakeSkeleton.dir/main.cpp.o"

# External object files for target UCMakeSkeleton
UCMakeSkeleton_EXTERNAL_OBJECTS =

UCMakeSkeleton: CMakeFiles/UCMakeSkeleton.dir/main.cpp.o
UCMakeSkeleton: CMakeFiles/UCMakeSkeleton.dir/build.make
UCMakeSkeleton: lib/somelib/libsomelib.a
UCMakeSkeleton: lib/somelib/thirdparty/thirdlib/libthirdlib.a
UCMakeSkeleton: CMakeFiles/UCMakeSkeleton.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --bold --progress-dir=/home/luxoft/Projects/r3d/UCMakeSkeleton/build/debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable UCMakeSkeleton"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/UCMakeSkeleton.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/UCMakeSkeleton.dir/build: UCMakeSkeleton
.PHONY : CMakeFiles/UCMakeSkeleton.dir/build

CMakeFiles/UCMakeSkeleton.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/UCMakeSkeleton.dir/cmake_clean.cmake
.PHONY : CMakeFiles/UCMakeSkeleton.dir/clean

CMakeFiles/UCMakeSkeleton.dir/depend:
	cd /home/luxoft/Projects/r3d/UCMakeSkeleton/build/debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/luxoft/Projects/r3d/UCMakeSkeleton /home/luxoft/Projects/r3d/UCMakeSkeleton /home/luxoft/Projects/r3d/UCMakeSkeleton/build/debug /home/luxoft/Projects/r3d/UCMakeSkeleton/build/debug /home/luxoft/Projects/r3d/UCMakeSkeleton/build/debug/CMakeFiles/UCMakeSkeleton.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : CMakeFiles/UCMakeSkeleton.dir/depend

