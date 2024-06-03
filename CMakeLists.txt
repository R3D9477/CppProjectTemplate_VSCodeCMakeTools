cmake_minimum_required(VERSION 3.16)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

get_filename_component(OUTPUT_NAME ${CMAKE_CURRENT_SOURCE_DIR} NAME)
project(${OUTPUT_NAME} VERSION 0.1 LANGUAGES CXX)

# - DEFINE THE LIST OF THE SOURCES (CURRENT TARGET) BELOW IN VARIABLE SCAN_SOURCES_FOLDER
# - ATTACH EXTERNAL LIBRARIES AT THE BOTTOM OF THAT FILE
list(APPEND SCAN_SOURCES_FOLDER ".")
list(APPEND CMAKE_PREFIX_PATH ${CMAKE_BINARY_DIR})

#------------------------------------------------------------------------------------------------------
#------------------------------------------------------------------------------------------------------
# Scan project's sources folders.

set(SOURCE_MASK *.c *.cc *.cpp *.cxx *.c++ *.h *.hh *.hpp *.hxx *.h++ *.tcc *.tpp *.ipp *.qrc)

function(get_sources_from_dir DEST_SRCs_VAR DEST_INCs_VAR SRC_DIR)
  unset(DIR_SRCs_FOUND)
  foreach(SRC_MASK ${SOURCE_MASK})
    file(GLOB DIR_SRCs "${SRC_DIR}/${SRC_MASK}")
    if(NOT "${DIR_SRCs}" STREQUAL "")
      set(DIR_SRCs_FOUND true)
      get_filename_component(DIR_SRCs "${DIR_SRCs}" ABSOLUTE)
      if(NOT "${DIR_SRCs}" IN_LIST ${DEST_SRCs_VAR})
        list(APPEND ${DEST_SRCs_VAR} ${DIR_SRCs})
        set(${DEST_SRCs_VAR} ${${DEST_SRCs_VAR}} PARENT_SCOPE)
      endif()
    endif()
  endforeach()
  if(${DIR_SRCs_FOUND})
    get_filename_component(SRC_DIR "${SRC_DIR}" ABSOLUTE)
    if(NOT "${SRC_DIR}" IN_LIST ${DEST_INCs_VAR})
      list(APPEND ${DEST_INCs_VAR} ${SRC_DIR})
      set(${DEST_INCs_VAR} ${${DEST_INCs_VAR}} PARENT_SCOPE)
    endif()
  endif()
endfunction()

foreach(SRC_FOLDER ${SCAN_SOURCES_FOLDER})
  get_sources_from_dir(${PROJECT_NAME}_SOURCES ${PROJECT_NAME}_INCLUDES ${SRC_FOLDER})
endforeach()

#------------------------------------------------------------------------------------------------------
# Scan project's unit tests sources folder.

file(READ "conanfile.txt" CONAN_PACKAGES)
if("${CONAN_PACKAGES}" MATCHES "gtest")
  set(GTEST_REQUIRED 1)
endif()
if("${CONAN_PACKAGES}" MATCHES "boost")
  set(BOOST_REQUIRED 1)
endif()

enable_testing()

set(SOURCE_MASK_TEST *.c *.cc *.cpp *.cxx *.c++)

function(target_add_tests_from_folder TARGET_NAME FOLDER_PATH)
  foreach(SRC_MASK_TEST ${SOURCE_MASK_TEST})
    file(GLOB TEST_SRCs "${FOLDER_PATH}/${SRC_MASK_TEST}")
    foreach(TEST_SRC ${TEST_SRCs})
      get_filename_component(TEST_NAME ${TEST_SRC} NAME_WE)
      set(TEST_TARGET_NAME ${TEST_NAME})
      add_executable(${TEST_TARGET_NAME} "${TEST_SRC}")
      target_include_directories(${TEST_TARGET_NAME} PUBLIC ${${TARGET_NAME}_INCLUDES})
      if(${GTEST_REQUIRED} EQUAL 1)
        find_package(GTest REQUIRED)
        target_link_libraries(${TEST_TARGET_NAME} PUBLIC gtest::gtest)
      endif()
      if(${BOOST_REQUIRED} EQUAL 1)
        find_package(Boost REQUIRED COMPONENTS unit_test_framework)
        target_link_libraries(${TEST_TARGET_NAME} PUBLIC Boost::unit_test_framework)
      endif()
      get_target_property(target_type ${TARGET_NAME} TYPE)
      if (NOT target_type STREQUAL "EXECUTABLE")
        target_link_libraries(${TEST_TARGET_NAME} PUBLIC ${TARGET_NAME})
      endif ()
      add_test(${TEST_TARGET_NAME} ${TEST_TARGET_NAME})
    endforeach()
  endforeach()
endfunction()

add_executable(${OUTPUT_NAME} ${${PROJECT_NAME}_SOURCES})

#------------------------------------------------------------------------------------------------------

target_include_directories(${OUTPUT_NAME} PUBLIC ${${PROJECT_NAME}_INCLUDES})

#------------------------------------------------------------------------------------------------------
# Compiler's safety flags.

string(TOUPPER ${CMAKE_CXX_COMPILER_ID} SFF_POSTFIX)
set(SAFETY_FLAGS_FILE "${PROJECT_SOURCE_DIR}/SAFETY_FLAGS_${SFF_POSTFIX}.cmake")
if(EXISTS "${SAFETY_FLAGS_FILE}")
  include("${SAFETY_FLAGS_FILE}")
endif()

message("SAFETY_FLAGS_FILE: ${SAFETY_FLAGS_FILE}")
message("SAFETY_FLAGS: ${SAFETY_FLAGS}")

target_compile_options(${OUTPUT_NAME} PRIVATE ${SAFETY_FLAGS})

#------------------------------------------------------------------------------------------------------
# Add VCRuntime libs if needed.

if(MSVC)
  set(CMAKE_INSTALL_SYSTEM_RUNTIME_LIBS_SKIP true)
  include(InstallRequiredSystemLibraries)
  file(COPY ${CMAKE_INSTALL_SYSTEM_RUNTIME_LIBS} DESTINATION .)
endif()

#------------------------------------------------------------------------------------------------------
# Add Boost if it possible.
#  https://cmake.org/cmake/help/latest/module/FindBoost.html#hints
#  https://doc.qt.io/qtcreator/creator-build-settings-cmake.html

find_package(Boost)
function(target_add_boost TARGET_NAME)
  if(Boost_FOUND)
    target_link_libraries(${TARGET_NAME} PUBLIC Boost::boost)
    if(WIN32)
      target_link_libraries(${TARGET_NAME} PUBLIC ws2_32)
    else()
      target_link_libraries(${TARGET_NAME} PUBLIC pthread)
    endif()
  endif()
endfunction()

target_add_boost(${OUTPUT_NAME})

#------------------------------------------------------------------------------------------------------
#------------------------------------------------------------------------------------------------------
# ATTACH EXTERNAL LIBRARIES BELOW...

add_subdirectory("lib/somelib")
target_link_libraries(${OUTPUT_NAME} PUBLIC "somelib")

#...
#...
#...

#------------------------------------------------------------------------------------------------------
#------------------------------------------------------------------------------------------------------
# ADD TESTS BELOW...

target_add_tests_from_folder(${OUTPUT_NAME} "test")

#...
#...
#...
