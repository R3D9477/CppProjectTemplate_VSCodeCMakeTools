# Avoid multiple calls to find_package to append duplicated properties to the targets
include_guard()########### VARIABLES #######################################################################
#############################################################################################
set(bzip2_FRAMEWORKS_FOUND_DEBUG "") # Will be filled later
conan_find_apple_frameworks(bzip2_FRAMEWORKS_FOUND_DEBUG "${bzip2_FRAMEWORKS_DEBUG}" "${bzip2_FRAMEWORK_DIRS_DEBUG}")

set(bzip2_LIBRARIES_TARGETS "") # Will be filled later


######## Create an interface target to contain all the dependencies (frameworks, system and conan deps)
if(NOT TARGET bzip2_DEPS_TARGET)
    add_library(bzip2_DEPS_TARGET INTERFACE IMPORTED)
endif()

set_property(TARGET bzip2_DEPS_TARGET
             APPEND PROPERTY INTERFACE_LINK_LIBRARIES
             $<$<CONFIG:Debug>:${bzip2_FRAMEWORKS_FOUND_DEBUG}>
             $<$<CONFIG:Debug>:${bzip2_SYSTEM_LIBS_DEBUG}>
             $<$<CONFIG:Debug>:>)

####### Find the libraries declared in cpp_info.libs, create an IMPORTED target for each one and link the
####### bzip2_DEPS_TARGET to all of them
conan_package_library_targets("${bzip2_LIBS_DEBUG}"    # libraries
                              "${bzip2_LIB_DIRS_DEBUG}" # package_libdir
                              "${bzip2_BIN_DIRS_DEBUG}" # package_bindir
                              "${bzip2_LIBRARY_TYPE_DEBUG}"
                              "${bzip2_IS_HOST_WINDOWS_DEBUG}"
                              bzip2_DEPS_TARGET
                              bzip2_LIBRARIES_TARGETS  # out_libraries_targets
                              "_DEBUG"
                              "bzip2"    # package_name
                              "${bzip2_NO_SONAME_MODE_DEBUG}")  # soname

# FIXME: What is the result of this for multi-config? All configs adding themselves to path?
set(CMAKE_MODULE_PATH ${bzip2_BUILD_DIRS_DEBUG} ${CMAKE_MODULE_PATH})

########## GLOBAL TARGET PROPERTIES Debug ########################################
    set_property(TARGET BZip2::BZip2
                 APPEND PROPERTY INTERFACE_LINK_LIBRARIES
                 $<$<CONFIG:Debug>:${bzip2_OBJECTS_DEBUG}>
                 $<$<CONFIG:Debug>:${bzip2_LIBRARIES_TARGETS}>
                 )

    if("${bzip2_LIBS_DEBUG}" STREQUAL "")
        # If the package is not declaring any "cpp_info.libs" the package deps, system libs,
        # frameworks etc are not linked to the imported targets and we need to do it to the
        # global target
        set_property(TARGET BZip2::BZip2
                     APPEND PROPERTY INTERFACE_LINK_LIBRARIES
                     bzip2_DEPS_TARGET)
    endif()

    set_property(TARGET BZip2::BZip2
                 APPEND PROPERTY INTERFACE_LINK_OPTIONS
                 $<$<CONFIG:Debug>:${bzip2_LINKER_FLAGS_DEBUG}>)
    set_property(TARGET BZip2::BZip2
                 APPEND PROPERTY INTERFACE_INCLUDE_DIRECTORIES
                 $<$<CONFIG:Debug>:${bzip2_INCLUDE_DIRS_DEBUG}>)
    # Necessary to find LINK shared libraries in Linux
    set_property(TARGET BZip2::BZip2
                 APPEND PROPERTY INTERFACE_LINK_DIRECTORIES
                 $<$<CONFIG:Debug>:${bzip2_LIB_DIRS_DEBUG}>)
    set_property(TARGET BZip2::BZip2
                 APPEND PROPERTY INTERFACE_COMPILE_DEFINITIONS
                 $<$<CONFIG:Debug>:${bzip2_COMPILE_DEFINITIONS_DEBUG}>)
    set_property(TARGET BZip2::BZip2
                 APPEND PROPERTY INTERFACE_COMPILE_OPTIONS
                 $<$<CONFIG:Debug>:${bzip2_COMPILE_OPTIONS_DEBUG}>)

########## For the modules (FindXXX)
set(bzip2_LIBRARIES_DEBUG BZip2::BZip2)
