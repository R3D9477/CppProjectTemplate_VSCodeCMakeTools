# Avoid multiple calls to find_package to append duplicated properties to the targets
include_guard()########### VARIABLES #######################################################################
#############################################################################################
set(libbacktrace_FRAMEWORKS_FOUND_DEBUG "") # Will be filled later
conan_find_apple_frameworks(libbacktrace_FRAMEWORKS_FOUND_DEBUG "${libbacktrace_FRAMEWORKS_DEBUG}" "${libbacktrace_FRAMEWORK_DIRS_DEBUG}")

set(libbacktrace_LIBRARIES_TARGETS "") # Will be filled later


######## Create an interface target to contain all the dependencies (frameworks, system and conan deps)
if(NOT TARGET libbacktrace_DEPS_TARGET)
    add_library(libbacktrace_DEPS_TARGET INTERFACE IMPORTED)
endif()

set_property(TARGET libbacktrace_DEPS_TARGET
             APPEND PROPERTY INTERFACE_LINK_LIBRARIES
             $<$<CONFIG:Debug>:${libbacktrace_FRAMEWORKS_FOUND_DEBUG}>
             $<$<CONFIG:Debug>:${libbacktrace_SYSTEM_LIBS_DEBUG}>
             $<$<CONFIG:Debug>:>)

####### Find the libraries declared in cpp_info.libs, create an IMPORTED target for each one and link the
####### libbacktrace_DEPS_TARGET to all of them
conan_package_library_targets("${libbacktrace_LIBS_DEBUG}"    # libraries
                              "${libbacktrace_LIB_DIRS_DEBUG}" # package_libdir
                              "${libbacktrace_BIN_DIRS_DEBUG}" # package_bindir
                              "${libbacktrace_LIBRARY_TYPE_DEBUG}"
                              "${libbacktrace_IS_HOST_WINDOWS_DEBUG}"
                              libbacktrace_DEPS_TARGET
                              libbacktrace_LIBRARIES_TARGETS  # out_libraries_targets
                              "_DEBUG"
                              "libbacktrace"    # package_name
                              "${libbacktrace_NO_SONAME_MODE_DEBUG}")  # soname

# FIXME: What is the result of this for multi-config? All configs adding themselves to path?
set(CMAKE_MODULE_PATH ${libbacktrace_BUILD_DIRS_DEBUG} ${CMAKE_MODULE_PATH})

########## GLOBAL TARGET PROPERTIES Debug ########################################
    set_property(TARGET libbacktrace::libbacktrace
                 APPEND PROPERTY INTERFACE_LINK_LIBRARIES
                 $<$<CONFIG:Debug>:${libbacktrace_OBJECTS_DEBUG}>
                 $<$<CONFIG:Debug>:${libbacktrace_LIBRARIES_TARGETS}>
                 )

    if("${libbacktrace_LIBS_DEBUG}" STREQUAL "")
        # If the package is not declaring any "cpp_info.libs" the package deps, system libs,
        # frameworks etc are not linked to the imported targets and we need to do it to the
        # global target
        set_property(TARGET libbacktrace::libbacktrace
                     APPEND PROPERTY INTERFACE_LINK_LIBRARIES
                     libbacktrace_DEPS_TARGET)
    endif()

    set_property(TARGET libbacktrace::libbacktrace
                 APPEND PROPERTY INTERFACE_LINK_OPTIONS
                 $<$<CONFIG:Debug>:${libbacktrace_LINKER_FLAGS_DEBUG}>)
    set_property(TARGET libbacktrace::libbacktrace
                 APPEND PROPERTY INTERFACE_INCLUDE_DIRECTORIES
                 $<$<CONFIG:Debug>:${libbacktrace_INCLUDE_DIRS_DEBUG}>)
    # Necessary to find LINK shared libraries in Linux
    set_property(TARGET libbacktrace::libbacktrace
                 APPEND PROPERTY INTERFACE_LINK_DIRECTORIES
                 $<$<CONFIG:Debug>:${libbacktrace_LIB_DIRS_DEBUG}>)
    set_property(TARGET libbacktrace::libbacktrace
                 APPEND PROPERTY INTERFACE_COMPILE_DEFINITIONS
                 $<$<CONFIG:Debug>:${libbacktrace_COMPILE_DEFINITIONS_DEBUG}>)
    set_property(TARGET libbacktrace::libbacktrace
                 APPEND PROPERTY INTERFACE_COMPILE_OPTIONS
                 $<$<CONFIG:Debug>:${libbacktrace_COMPILE_OPTIONS_DEBUG}>)

########## For the modules (FindXXX)
set(libbacktrace_LIBRARIES_DEBUG libbacktrace::libbacktrace)
