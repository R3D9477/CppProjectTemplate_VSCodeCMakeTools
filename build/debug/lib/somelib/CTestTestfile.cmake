# CMake generated Testfile for 
# Source directory: /home/luxoft/Projects/r3d/UCMakeSkeleton/lib/somelib
# Build directory: /home/luxoft/Projects/r3d/UCMakeSkeleton/build/debug/lib/somelib
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(test_somelib "test_somelib")
set_tests_properties(test_somelib PROPERTIES  _BACKTRACE_TRIPLES "/home/luxoft/Projects/r3d/UCMakeSkeleton/CMakeLists.txt;86;add_test;/home/luxoft/Projects/r3d/UCMakeSkeleton/lib/somelib/CMakeLists.txt;32;target_add_tests_from_folder;/home/luxoft/Projects/r3d/UCMakeSkeleton/lib/somelib/CMakeLists.txt;0;")
add_test(test_somelib_2 "test_somelib_2")
set_tests_properties(test_somelib_2 PROPERTIES  _BACKTRACE_TRIPLES "/home/luxoft/Projects/r3d/UCMakeSkeleton/CMakeLists.txt;86;add_test;/home/luxoft/Projects/r3d/UCMakeSkeleton/lib/somelib/CMakeLists.txt;32;target_add_tests_from_folder;/home/luxoft/Projects/r3d/UCMakeSkeleton/lib/somelib/CMakeLists.txt;0;")
subdirs("thirdparty/thirdlib")
