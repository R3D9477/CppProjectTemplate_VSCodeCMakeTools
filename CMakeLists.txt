cmake_minimum_required(VERSION 3.16)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

get_filename_component(OUTPUT_NAME ${CMAKE_CURRENT_SOURCE_DIR} NAME)
project(${OUTPUT_NAME} VERSION 0.1 LANGUAGES CXX)

# - DEFINE THE LIST OF THE SOURCES (CURRENT TARGET) BELOW IN VARIABLE SCAN_SOURCES_FOLDER
# - ATTACH EXTERNAL LIBRARIES AT THE BOTTOM OF THAT FILE
list(APPEND SCAN_SOURCES_FOLDER ".")

#------------------------------------------------------------------------------------------------------
#------------------------------------------------------------------------------------------------------
# Scan project's sources folders.

set(SOURCE_EXTENSIONS *.c *.cc *.cpp *.cxx *.c++ *.h *.hh *.hpp *.hxx *.h++ *.tcc *.tpp *.ipp *.qrc)

function(get_sources_from_dir DEST_SRCs_VAR DEST_INCs_VAR SRC_DIR)
  foreach(SRC_EXT ${SOURCE_EXTENSIONS})
    file(GLOB DIR_SRCs "${SRC_DIR}/${SRC_EXT}")
    if(NOT "${DIR_SRCs}" STREQUAL "")
      get_filename_component(DIR_SRCs "${DIR_SRCs}" ABSOLUTE)
      if(NOT "${DIR_SRCs}" IN_LIST ${DEST_SRCs_VAR})
        list(APPEND ${DEST_SRCs_VAR} ${DIR_SRCs})
        set(${DEST_SRCs_VAR} ${${DEST_SRCs_VAR}} PARENT_SCOPE)
      endif()
    endif()
    get_filename_component(SRC_DIR "${SRC_DIR}" ABSOLUTE)
    if(NOT "${SRC_DIR}" IN_LIST ${DEST_INCs_VAR})
      list(APPEND ${DEST_INCs_VAR} ${SRC_DIR})
      set(${DEST_INCs_VAR} ${${DEST_INCs_VAR}} PARENT_SCOPE)
    endif()
  endforeach()
endfunction()

foreach(SRC_FOLDER ${SCAN_SOURCES_FOLDER})
  get_sources_from_dir(${PROJECT_NAME}_SOURCES ${PROJECT_NAME}_INCLUDES ${SRC_FOLDER})
endforeach()

#------------------------------------------------------------------------------------------------------
# Add Qt application (if possible).

# Comment the line below if you're using QtCreator, but Qt is no needed
find_package(QT NAMES Qt6 Qt5 COMPONENTS Core Quick REQUIRED)

if(QT_FOUND)
  # Based on default templates of CMakeLists.txt for Qt5 and Qt6

  find_package(Qt${QT_VERSION_MAJOR} COMPONENTS Core Quick Widgets REQUIRED)

  set(CMAKE_INCLUDE_CURRENT_DIR ON)

  set(CMAKE_AUTOUIC ON)
  set(CMAKE_AUTOMOC ON)
  set(CMAKE_AUTORCC ON)

  if(${QT_VERSION_MAJOR} GREATER_EQUAL 6)
    set(OUTPUT_NAME "app${OUTPUT_NAME}")
    qt_add_executable(${OUTPUT_NAME} ${${PROJECT_NAME}_SOURCES})
    file(GLOB_RECURSE MODULE_QMLs RELATIVE ${CMAKE_CURRENT_SOURCE_DIR} *.qml)
    if(NOT "${MODULE_QMLs}" STREQUAL "")
      qt_add_qml_module(${OUTPUT_NAME} URI ${PROJECT_NAME} VERSION 1.0 QML_FILES ${MODULE_QMLs})
    endif()
    # Define target properties for Android with Qt 6 as:
    #  set_property(TARGET ${OUTPUT_NAME} APPEND PROPERTY QT_ANDROID_PACKAGE_SOURCE_DIR
    #         ${CMAKE_CURRENT_SOURCE_DIR}/android)
    # For more information, see https://doc.qt.io/qt-6/qt-add-executable.html#target-creation
  else()
    if(ANDROID)
      add_library(${OUTPUT_NAME} SHARED ${${PROJECT_NAME}_SOURCES})
      # Define properties for Android with Qt 5 after find_package() calls as:
      #  set(ANDROID_PACKAGE_SOURCE_DIR "${CMAKE_CURRENT_SOURCE_DIR}/android")
    else()
      add_executable(${OUTPUT_NAME} ${${PROJECT_NAME}_SOURCES})
    endif()

  endif()

  set_target_properties(${OUTPUT_NAME} PROPERTIES
    MACOSX_BUNDLE_GUI_IDENTIFIER "com.${OUTPUT_NAME}"
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
  )

  function(target_add_Qt TARGET_NAME)
    target_compile_definitions(${TARGET_NAME} PRIVATE $<$<OR:$<CONFIG:Debug>,$<CONFIG:RelWithDebInfo>>:QT_QML_DEBUG>)
    target_link_libraries(${TARGET_NAME} PUBLIC Qt::Core Qt::Quick Qt::Widgets)
  endfunction()

  target_add_Qt(${OUTPUT_NAME})

#------------------------------------------------------------------------------------------------------
# Add common application (if Qt is not exists).

else()
  add_executable(${OUTPUT_NAME} ${${PROJECT_NAME}_SOURCES})
endif()

#------------------------------------------------------------------------------------------------------

target_include_directories(${OUTPUT_NAME} PUBLIC ${${PROJECT_NAME}_INCLUDES})

#------------------------------------------------------------------------------------------------------
# Compiler's safety flags.
# Based on:
#  https://gcc.gnu.org/onlinedocs/gcc/Warning-Options.html
#  https://gcc.gnu.org/onlinedocs/gcc/Instrumentation-Options.html
#  https://developers.redhat.com/blog/2018/03/21/compiler-and-linker-flags-gcc
#  https://interrupt.memfault.com/blog/best-and-worst-gcc-clang-compiler-flags#-weverything-clang-only

if(CMAKE_CXX_COMPILER_ID STREQUAL "Clang" OR CMAKE_CXX_COMPILER_ID STREQUAL "GCC")
  list(APPEND SAFETY_FLAGS
    -Wall
    -Wextra
    -Wshadow
    -Winit-self
    -Wuninitialized
    #-Wmaybe-uninitialized  # bad flag makes possible operations with uninitialized variables
    -Wundef
    -Wswitch-enum
    -Wdouble-promotion
    -Wformat=2
    -Wformat-security
    -Wconversion
    -Wsign-conversion
    -Wold-style-cast
    -Wunreachable-code
    -Werror
    -Wpedantic
    -Wno-unused-value
    -Wno-unused-result
    -Wno-unused-function
    -Wno-unused-parameter
    -Wno-ignored-pragmas
  )
  list(APPEND SAFETY_FLAGS
    -fno-lto
    -march=native
    -D_FORTIFY_SOURCE=2
  )
  if(QT_FOUND)
    list(APPEND SAFETY_FLAGS
      -Wno-padded
      -Wno-redundant-parens
      -Wno-extra-semi-stmt
    )
    if(${QT_VERSION_MAJOR} GREATER_EQUAL 6)
      list(APPEND SAFETY_FLAGS
        -Wno-missing-prototypes
        -Wno-missing-variable-declarations
      )
    endif()
  endif()
endif()

if(CMAKE_CXX_COMPILER_ID STREQUAL "Clang")
  list(APPEND SAFETY_FLAGS
    -Weverything
    -Wno-c++98-compat
    -Wno-exit-time-destructors
    -Wno-global-constructors
  )
elseif(CMAKE_CXX_COMPILER_ID STREQUAL "GCC")
  list(APPEND SAFETY_FLAGS
    -Wformat-overflow
    -Wformat-truncation
    -Wl,-z,defs
    -Wl,-z,now
    -Wl,-z,relro
    -fstack-clash-protection
    -fmudflap
  )
endif()
if(NOT WIN32)
  list(APPEND SAFETY_FLAGS
    -finstrument-functions
    -fstack-protector-all
    -fstack-protector-strong
  )
  if(CMAKE_CXX_COMPILER_ID STREQUAL "GCC") # flags don't work in clang-cl
    list(APPEND SAFETY_FLAGS
      -fno-short-enums
      -fno-fast-math
      -fno-common
      -fexceptions
      -fverbose-asm
      -fasynchronous-unwind-tables
      -pipe
    )
  endif()
endif()

target_compile_options(${OUTPUT_NAME} PRIVATE ${SAFETY_FLAGS})

#------------------------------------------------------------------------------------------------------
# Add VCRuntime libs if needed

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

if(EXISTS "${CMAKE_CURRENT_SOURCE_DIR}/test/test_${PROJECT_NAME}.cpp")
  find_package(Boost REQUIRED COMPONENTS unit_test_framework)
  enable_testing()
  add_executable(test_${PROJECT_NAME} "test/test_${PROJECT_NAME}.cpp")
  target_include_directories(test_${PROJECT_NAME} PUBLIC ${${PROJECT_NAME}_INCLUDES})
  target_link_libraries(test_${PROJECT_NAME} PRIVATE Boost::unit_test_framework)
  add_test(test_${PROJECT_NAME} test_${PROJECT_NAME})
endif()

#...
#...
#...
