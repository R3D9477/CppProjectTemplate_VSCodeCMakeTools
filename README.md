# UCMakeSkeleton
Universal simple skeleton of project's tree, based on CMake build system.

# Stucture:
[ PROJECT ]
<br/>ㅤㅤㅤ|- [CMakeLists.txt](CMakeLists.txt)
<br/>ㅤㅤㅤ|- include
<br/>ㅤㅤㅤ|- src
<br/>ㅤㅤㅤ|- test
<br/>ㅤㅤㅤ|- lib
<br/>ㅤㅤㅤㅤㅤㅤ|- [ SOMELIB ]
<br/>ㅤㅤㅤㅤㅤㅤㅤㅤㅤ|- [CMakeLists.txt](lib/somelib/CMakeLists.txt)
<br/>ㅤㅤㅤㅤㅤㅤㅤㅤㅤ|- include
<br/>ㅤㅤㅤㅤㅤㅤㅤㅤㅤ|- src
<br/>ㅤㅤㅤㅤㅤㅤㅤㅤㅤ|- test
<br/>ㅤㅤㅤㅤㅤㅤㅤㅤㅤ|- thirdparty
<br/>ㅤㅤㅤㅤㅤㅤㅤㅤㅤ|- [ THIRDLIB ]
<br/>ㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤ|- [CMakeLists.txt](lib/somelib/thirdparty/thirdlib/CMakeLists.txt)
<br/>ㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤ|- include
<br/>ㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤ|- src
<br/>ㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤ|- test

# Features:
* auto scan/add into project's tree all of needed sources and includes of the project and child libs
* auto adding of some of libraries: Boost, Qt5, Qt6
* easy and flexible configuration process of sources tree

# Links:
* based on https://gist.github.com/R3D9477/308b6e709241956e72491bc59defbc12
* used in https://github.com/R3D9477/EmptyQmlMuiApp
