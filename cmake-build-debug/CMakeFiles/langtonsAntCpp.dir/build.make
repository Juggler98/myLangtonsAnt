# CMAKE generated file: DO NOT EDIT!
# Generated by "MinGW Makefiles" Generator, CMake Version 3.17

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

# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

SHELL = cmd.exe

# The CMake executable.
CMAKE_COMMAND = "C:\Program Files\JetBrains\CLion 2020.2.4\bin\cmake\win\bin\cmake.exe"

# The command to remove a file.
RM = "C:\Program Files\JetBrains\CLion 2020.2.4\bin\cmake\win\bin\cmake.exe" -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = C:\Users\abeli\CLionProjects\langtonsAntCpp

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = C:\Users\abeli\CLionProjects\langtonsAntCpp\cmake-build-debug

# Include any dependencies generated for this target.
include CMakeFiles/langtonsAntCpp.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/langtonsAntCpp.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/langtonsAntCpp.dir/flags.make

CMakeFiles/langtonsAntCpp.dir/main.cpp.obj: CMakeFiles/langtonsAntCpp.dir/flags.make
CMakeFiles/langtonsAntCpp.dir/main.cpp.obj: CMakeFiles/langtonsAntCpp.dir/includes_CXX.rsp
CMakeFiles/langtonsAntCpp.dir/main.cpp.obj: ../main.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=C:\Users\abeli\CLionProjects\langtonsAntCpp\cmake-build-debug\CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/langtonsAntCpp.dir/main.cpp.obj"
	C:\MinGW\bin\g++.exe  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles\langtonsAntCpp.dir\main.cpp.obj -c C:\Users\abeli\CLionProjects\langtonsAntCpp\main.cpp

CMakeFiles/langtonsAntCpp.dir/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/langtonsAntCpp.dir/main.cpp.i"
	C:\MinGW\bin\g++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E C:\Users\abeli\CLionProjects\langtonsAntCpp\main.cpp > CMakeFiles\langtonsAntCpp.dir\main.cpp.i

CMakeFiles/langtonsAntCpp.dir/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/langtonsAntCpp.dir/main.cpp.s"
	C:\MinGW\bin\g++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S C:\Users\abeli\CLionProjects\langtonsAntCpp\main.cpp -o CMakeFiles\langtonsAntCpp.dir\main.cpp.s

# Object files for target langtonsAntCpp
langtonsAntCpp_OBJECTS = \
"CMakeFiles/langtonsAntCpp.dir/main.cpp.obj"

# External object files for target langtonsAntCpp
langtonsAntCpp_EXTERNAL_OBJECTS =

langtonsAntCpp.exe: CMakeFiles/langtonsAntCpp.dir/main.cpp.obj
langtonsAntCpp.exe: CMakeFiles/langtonsAntCpp.dir/build.make
langtonsAntCpp.exe: CMakeFiles/langtonsAntCpp.dir/linklibs.rsp
langtonsAntCpp.exe: CMakeFiles/langtonsAntCpp.dir/objects1.rsp
langtonsAntCpp.exe: CMakeFiles/langtonsAntCpp.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=C:\Users\abeli\CLionProjects\langtonsAntCpp\cmake-build-debug\CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable langtonsAntCpp.exe"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles\langtonsAntCpp.dir\link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/langtonsAntCpp.dir/build: langtonsAntCpp.exe

.PHONY : CMakeFiles/langtonsAntCpp.dir/build

CMakeFiles/langtonsAntCpp.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles\langtonsAntCpp.dir\cmake_clean.cmake
.PHONY : CMakeFiles/langtonsAntCpp.dir/clean

CMakeFiles/langtonsAntCpp.dir/depend:
	$(CMAKE_COMMAND) -E cmake_depends "MinGW Makefiles" C:\Users\abeli\CLionProjects\langtonsAntCpp C:\Users\abeli\CLionProjects\langtonsAntCpp C:\Users\abeli\CLionProjects\langtonsAntCpp\cmake-build-debug C:\Users\abeli\CLionProjects\langtonsAntCpp\cmake-build-debug C:\Users\abeli\CLionProjects\langtonsAntCpp\cmake-build-debug\CMakeFiles\langtonsAntCpp.dir\DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/langtonsAntCpp.dir/depend

