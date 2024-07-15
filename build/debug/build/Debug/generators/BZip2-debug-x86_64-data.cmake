########### AGGREGATED COMPONENTS AND DEPENDENCIES FOR THE MULTI CONFIG #####################
#############################################################################################

set(bzip2_COMPONENT_NAMES "")
if(DEFINED bzip2_FIND_DEPENDENCY_NAMES)
  list(APPEND bzip2_FIND_DEPENDENCY_NAMES )
  list(REMOVE_DUPLICATES bzip2_FIND_DEPENDENCY_NAMES)
else()
  set(bzip2_FIND_DEPENDENCY_NAMES )
endif()

########### VARIABLES #######################################################################
#############################################################################################
set(bzip2_PACKAGE_FOLDER_DEBUG "/home/luxoft/.conan2/p/b/bzip2ec8511aba025a/p")
set(bzip2_BUILD_MODULES_PATHS_DEBUG "${bzip2_PACKAGE_FOLDER_DEBUG}/lib/cmake/conan-official-bzip2-variables.cmake")


set(bzip2_INCLUDE_DIRS_DEBUG )
set(bzip2_RES_DIRS_DEBUG )
set(bzip2_DEFINITIONS_DEBUG )
set(bzip2_SHARED_LINK_FLAGS_DEBUG )
set(bzip2_EXE_LINK_FLAGS_DEBUG )
set(bzip2_OBJECTS_DEBUG )
set(bzip2_COMPILE_DEFINITIONS_DEBUG )
set(bzip2_COMPILE_OPTIONS_C_DEBUG )
set(bzip2_COMPILE_OPTIONS_CXX_DEBUG )
set(bzip2_LIB_DIRS_DEBUG "${bzip2_PACKAGE_FOLDER_DEBUG}/lib")
set(bzip2_BIN_DIRS_DEBUG )
set(bzip2_LIBRARY_TYPE_DEBUG STATIC)
set(bzip2_IS_HOST_WINDOWS_DEBUG 0)
set(bzip2_LIBS_DEBUG bz2)
set(bzip2_SYSTEM_LIBS_DEBUG )
set(bzip2_FRAMEWORK_DIRS_DEBUG )
set(bzip2_FRAMEWORKS_DEBUG )
set(bzip2_BUILD_DIRS_DEBUG )
set(bzip2_NO_SONAME_MODE_DEBUG FALSE)


# COMPOUND VARIABLES
set(bzip2_COMPILE_OPTIONS_DEBUG
    "$<$<COMPILE_LANGUAGE:CXX>:${bzip2_COMPILE_OPTIONS_CXX_DEBUG}>"
    "$<$<COMPILE_LANGUAGE:C>:${bzip2_COMPILE_OPTIONS_C_DEBUG}>")
set(bzip2_LINKER_FLAGS_DEBUG
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${bzip2_SHARED_LINK_FLAGS_DEBUG}>"
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${bzip2_SHARED_LINK_FLAGS_DEBUG}>"
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${bzip2_EXE_LINK_FLAGS_DEBUG}>")


set(bzip2_COMPONENTS_DEBUG )