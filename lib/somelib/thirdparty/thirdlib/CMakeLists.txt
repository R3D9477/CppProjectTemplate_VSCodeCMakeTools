
#------------------------------------------------------------------------------------------------------
#------------------------------------------------------------------------------------------------------
# LIBRARY

get_filename_component(LIB_NAME ${CMAKE_CURRENT_SOURCE_DIR} NAME)

get_sources_from_dir(${LIB_NAME}_SOURCES ${LIB_NAME}_INCLUDES "include")
get_sources_from_dir(${LIB_NAME}_SOURCES ${LIB_NAME}_INCLUDES "src")

add_library(${LIB_NAME} ${${LIB_NAME}_SOURCES})

target_include_directories(${LIB_NAME} PUBLIC ${${LIB_NAME}_INCLUDES})

target_compile_options(${LIB_NAME} PRIVATE ${SAFETY_FLAGS})

#------------------------------------------------------------------------------------------------------
#------------------------------------------------------------------------------------------------------
# ATTACH EXTERNAL LIBRARIES BELOW...

#...
#...
#...

#------------------------------------------------------------------------------------------------------
#------------------------------------------------------------------------------------------------------
# ADD TESTS BELOW...

if(EXISTS "${CMAKE_CURRENT_SOURCE_DIR}/test/test_${LIB_NAME}.cpp")
  find_package(Boost REQUIRED COMPONENTS unit_test_framework)
  add_executable(test_${LIB_NAME} "test/test_${LIB_NAME}.cpp")
  target_include_directories(test_${LIB_NAME} PUBLIC ${${LIB_NAME}_INCLUDES})
  target_link_libraries(test_${LIB_NAME} PRIVATE Boost::unit_test_framework)
  target_link_libraries(test_${LIB_NAME} PRIVATE ${LIB_NAME})
  add_test(test_${LIB_NAME} test_${LIB_NAME})
endif()

#...
#...
#...
