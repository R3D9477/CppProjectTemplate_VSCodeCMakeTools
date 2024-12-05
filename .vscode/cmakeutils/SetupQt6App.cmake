IS_CONANFILE_CONTAINS("qt/6" IS_IN_CONANFILE)
IS_VCPKGJSON_CONTAINS("\"qt\"" IS_IN_VCPKGJSON)
if(${IS_IN_CONANFILE} OR ${IS_IN_VCPKGJSON})

    find_package(Qt6 COMPONENTS Core Gui Quick REQUIRED)

    qt_standard_project_setup()

    set(CMAKE_INCLUDE_CURRENT_DIR ON)

    set(CMAKE_AUTOUIC ON)
    set(CMAKE_AUTOMOC ON)
    set(CMAKE_AUTORCC ON)

    set(MAIN_TARGET "app${MAIN_TARGET}")

    qt_add_executable(${MAIN_TARGET} ${${PROJECT_NAME}_SOURCES})

    file(GLOB_RECURSE MODULE_QMLs RELATIVE ${CMAKE_CURRENT_SOURCE_DIR} *.qml)

    if(NOT "${MODULE_QMLs}" STREQUAL "")
        qt_add_qml_module(${MAIN_TARGET} URI ${PROJECT_NAME} VERSION 1.0 QML_FILES ${MODULE_QMLs})
    endif()

    target_compile_definitions(${MAIN_TARGET} PRIVATE $<$<OR:$<CONFIG:Debug>,$<CONFIG:RelWithDebInfo>>:QT_QML_DEBUG>)

    target_link_libraries(${MAIN_TARGET} PUBLIC Qt6::Core Qt6::Gui Qt6::Quick)

    message("")
    message("--> Qt6 application has been added")
    message("")

endif()
