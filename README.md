# UCMakeSkeleton
Universal simple skeleton of project's tree, based on CMake build system.

# Stucture:
```
[ PROJECT ]
```
`ㅤㅤㅤ|- `[CMakeLists.txt](CMakeLists.txt)

```
    |- include
    |- src
    |- test
    |- lib
        |- [ SOMELIB ]
```
`           |- `[CMakeLists.txt](lib/somelib/CMakeLists.txt)
```
            |- include`
            |- src`
            |- test`
            |- thirdparty`
                |- [ THIRDLIB ]
```
`                    |- `[CMakeLists.txt](lib/somelib/thirdparty/thirdlib/CMakeLists.txt)
`                    |- include`
`                    |- src`
`                    |- test`

# Features:
* auto scan/add into project's tree all of needed sources and includes of the project and child libs
* auto adding of some of libraries: Boost, Qt5, Qt6
* easy and flexible configuration process of sources tree

# Links:
* based on https://gist.github.com/R3D9477/308b6e709241956e72491bc59defbc12
* used in https://github.com/R3D9477/EmptyQmlMuiApp
