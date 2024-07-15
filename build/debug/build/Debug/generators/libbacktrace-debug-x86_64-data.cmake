########### AGGREGATED COMPONENTS AND DEPENDENCIES FOR THE MULTI CONFIG #####################
#############################################################################################

set(libbacktrace_COMPONENT_NAMES "")
if(DEFINED libbacktrace_FIND_DEPENDENCY_NAMES)
  list(APPEND libbacktrace_FIND_DEPENDENCY_NAMES )
  list(REMOVE_DUPLICATES libbacktrace_FIND_DEPENDENCY_NAMES)
else()
  set(libbacktrace_FIND_DEPENDENCY_NAMES )
endif()

########### VARIABLES #######################################################################
#############################################################################################
set(libbacktrace_PACKAGE_FOLDER_DEBUG "/home/luxoft/.conan2/p/b/libba8e3b57435a253/p")
set(libbacktrace_BUILD_MODULES_PATHS_DEBUG )


set(libbacktrace_INCLUDE_DIRS_DEBUG "${libbacktrace_PACKAGE_FOLDER_DEBUG}/include")
set(libbacktrace_RES_DIRS_DEBUG )
set(libbacktrace_DEFINITIONS_DEBUG )
set(libbacktrace_SHARED_LINK_FLAGS_DEBUG )
set(libbacktrace_EXE_LINK_FLAGS_DEBUG )
set(libbacktrace_OBJECTS_DEBUG )
set(libbacktrace_COMPILE_DEFINITIONS_DEBUG )
set(libbacktrace_COMPILE_OPTIONS_C_DEBUG )
set(libbacktrace_COMPILE_OPTIONS_CXX_DEBUG )
set(libbacktrace_LIB_DIRS_DEBUG "${libbacktrace_PACKAGE_FOLDER_DEBUG}/lib")
set(libbacktrace_BIN_DIRS_DEBUG )
set(libbacktrace_LIBRARY_TYPE_DEBUG STATIC)
set(libbacktrace_IS_HOST_WINDOWS_DEBUG 0)
set(libbacktrace_LIBS_DEBUG backtrace)
set(libbacktrace_SYSTEM_LIBS_DEBUG )
set(libbacktrace_FRAMEWORK_DIRS_DEBUG )
set(libbacktrace_FRAMEWORKS_DEBUG )
set(libbacktrace_BUILD_DIRS_DEBUG )
set(libbacktrace_NO_SONAME_MODE_DEBUG FALSE)


# COMPOUND VARIABLES
set(libbacktrace_COMPILE_OPTIONS_DEBUG
    "$<$<COMPILE_LANGUAGE:CXX>:${libbacktrace_COMPILE_OPTIONS_CXX_DEBUG}>"
    "$<$<COMPILE_LANGUAGE:C>:${libbacktrace_COMPILE_OPTIONS_C_DEBUG}>")
set(libbacktrace_LINKER_FLAGS_DEBUG
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${libbacktrace_SHARED_LINK_FLAGS_DEBUG}>"
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${libbacktrace_SHARED_LINK_FLAGS_DEBUG}>"
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${libbacktrace_EXE_LINK_FLAGS_DEBUG}>")


set(libbacktrace_COMPONENTS_DEBUG )