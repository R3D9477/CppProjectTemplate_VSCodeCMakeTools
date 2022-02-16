# UCMakeSkeleton
Universal simple skeleton of project's tree, based on CMake build system.

# Stucture:
**[ PROJECT ]**
<br/>ㅤㅤㅤ|- *[CMakeLists.txt](CMakeLists.txt)*
<br/>ㅤㅤㅤ|- test
<br/>ㅤㅤㅤ|- lib
<br/>ㅤㅤㅤㅤㅤㅤ|- **[ somelib ]**
<br/>ㅤㅤㅤㅤㅤㅤㅤㅤㅤ|- *[CMakeLists.txt](lib/somelib/CMakeLists.txt)*
<br/>ㅤㅤㅤㅤㅤㅤㅤㅤㅤ|- include
<br/>ㅤㅤㅤㅤㅤㅤㅤㅤㅤ|- src
<br/>ㅤㅤㅤㅤㅤㅤㅤㅤㅤ|- test
<br/>ㅤㅤㅤㅤㅤㅤㅤㅤㅤ|- thirdparty
<br/>ㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤ|- **[ thirdlib ]**
<br/>ㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤ|- *[CMakeLists.txt](lib/somelib/thirdparty/thirdlib/CMakeLists.txt)*
<br/>ㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤ|- include
<br/>ㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤ|- src
<br/>ㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤ|- test

# Features:
* automatically [applies](https://github.com/R3D9477/UCMakeSkeleton/blob/main/CMakeLists.txt#L6) name of directory as name of a project/library
* automatically [applies](https://github.com/R3D9477/UCMakeSkeleton/blob/main/CMakeLists.txt#L9) scans and adds needed sources and includes into the project's tree; easy and flexible configuration process of source tree for current target: just add needed folder to list
* automatically adds some of libraries (if possible): [Boost](https://github.com/R3D9477/UCMakeSkeleton/blob/main/CMakeLists.txt#L198), [Qt5](https://github.com/R3D9477/UCMakeSkeleton/blob/main/CMakeLists.txt#L40), [Qt6](https://github.com/R3D9477/UCMakeSkeleton/blob/main/CMakeLists.txt#L40)
* [applies](https://github.com/R3D9477/UCMakeSkeleton/blob/main/CMakeLists.txt#L104) some compiler's extra flags because of safety
* automatically adds unit tests (Boost), if source `test/test_<TARGET_NAME>.cpp` was found

# Tested on:
* Linux (GCC,Clang)
* Windows (CLang,MinGW,MSVC)

# Links:
* based on https://gist.github.com/R3D9477/308b6e709241956e72491bc59defbc12
* used in https://github.com/R3D9477/EmptyQmlMuiApp
