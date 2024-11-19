#------------------------------------------------------------------------------------------------------
#------------------------------------------------------------------------------------------------------
# Add Qt application (if possible).

if(TRY_TO_FIND_Qt6)

    find_package(Qt6 REQUIRED COMPONENTS Core Gui Widgets Network Qml Quick QuickWidgets)

    if(QT_FOUND)

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

        # Define target properties for Android with Qt 6 as:
        #  set_property(TARGET ${MAIN_TARGET} APPEND PROPERTY QT_ANDROID_PACKAGE_SOURCE_DIR
        #         ${CMAKE_CURRENT_SOURCE_DIR}/android)
        # For more information, see https://doc.qt.io/qt-6/qt-add-executable.html#target-creation

        set_target_properties(${MAIN_TARGET} PROPERTIES
            MACOSX_BUNDLE_GUI_IDENTIFIER "com.${MAIN_TARGET}"
            MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
            MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
        )

        target_compile_definitions(${MAIN_TARGET} PRIVATE $<$<OR:$<CONFIG:Debug>,$<CONFIG:RelWithDebInfo>>:QT_QML_DEBUG>)

        target_link_libraries(${MAIN_TARGET} PRIVATE
            Qt6::Core
            Qt6::Gui
            Qt6::Qml
            Qt6::Quick
        )

        set(IS_Qt6_APP TRUE)

    endif()

endif()
