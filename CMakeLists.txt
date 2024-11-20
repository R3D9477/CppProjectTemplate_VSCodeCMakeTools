cmake_minimum_required(VERSION 3.25)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
set(CMAKE_COLOR_DIAGNOSTICS ON)

set(CMAKE_CXX_FLAGS_DEBUG "-gdwarf-4")
set(CMAKE_CXX_FLAGS_RELEASE "-O3")

get_filename_component(MAIN_TARGET ${CMAKE_CURRENT_SOURCE_DIR} NAME)

project(${MAIN_TARGET} VERSION 0.1.0 LANGUAGES CXX)

#------------------------------------------------------------------------------------------------------

# - DEFINE THE LIST OF THE SOURCES (CURRENT TARGET) BELOW IN VARIABLE SCAN_SOURCES_FOLDER
# - ATTACH EXTERNAL LIBRARIES AT THE BOTTOM OF THAT FILE
list(APPEND SCAN_SOURCES_FOLDER "src")

#------------------------------------------------------------------------------------------------------
#------------------------------------------------------------------------------------------------------

include(CMakeLists.txt_z_Utils.cmake)

#------------------------------------------------------------------------------------------------------

include(CMakeLists.txt_z_Utils_SetupQt6App.cmake) # Setup Qt6 application

if(NOT TARGET ${MAIN_TARGET})
    add_executable(${MAIN_TARGET} ${${PROJECT_NAME}_SOURCES}) # Setup regular application
endif()

include(CMakeLists.txt_z_Utils_SafetyFlags.cmake) # Set compiler's safety flags

include(CMakeLists.txt_z_Utils_VCRuntime.cmake) # Add VCRuntime libs if needed

#------------------------------------------------------------------------------------------------------

target_include_directories(${MAIN_TARGET} PUBLIC ${${PROJECT_NAME}_INCLUDES})

#------------------------------------------------------------------------------------------------------
#------------------------------------------------------------------------------------------------------
# ATTACH LIBRARIES

set(EXT_LIBS_FILE "${PROJECT_SOURCE_DIR}/CMakeLists.txt_a_Project_Libs.cmake")
if(EXISTS "${EXT_LIBS_FILE}")
    include("${EXT_LIBS_FILE}")
endif()

#------------------------------------------------------------------------------------------------------
#------------------------------------------------------------------------------------------------------
# ADD TESTS

set(EXT_LIBS_FILE "${PROJECT_SOURCE_DIR}/CMakeLists.txt_b_Project_Tests.cmake")
if(EXISTS "${EXT_LIBS_FILE}")
    include("${EXT_LIBS_FILE}")
endif()