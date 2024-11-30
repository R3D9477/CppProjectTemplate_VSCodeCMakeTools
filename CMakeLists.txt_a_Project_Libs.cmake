# ATTACH EXTERNAL LIBRARIES BELOW...

add_subdirectory("lib/libcppinfo")
add_subdirectory("lib/libproject_version")
add_subdirectory("lib/libzexample")

IS_CONANFILE_CONTAINS("boost" IS_IN_CONANFILE)
if(${IS_IN_CONANFILE})
    find_package(Boost COMPONENTS ALL CONFIG)
    if(Boost_FOUND)
        message("Boost version is " ${Boost_VERSION})
        target_link_libraries(${MAIN_TARGET} PUBLIC Boost::boost)
        target_link_libraries(${MAIN_TARGET} PUBLIC boost_thread)
        if(WIN32)
            target_link_libraries(${MAIN_TARGET} PUBLIC ws2_32)
        else()
            target_link_libraries(${MAIN_TARGET} PUBLIC pthread)
        endif()
    endif()
endif()

find_package(imgui REQUIRED)
target_link_libraries(${MAIN_TARGET} PUBLIC imgui::imgui)
target_compile_definitions(${MAIN_TARGET} PUBLIC IMGUI_IMPL_OPENGL_LOADER_GLEW)

find_package(glfw3 REQUIRED)
target_link_libraries(${MAIN_TARGET} PUBLIC glfw)

find_package(glew REQUIRED)
target_link_libraries(${MAIN_TARGET} PUBLIC GLEW::glew_s)

find_package(OpenGL REQUIRED COMPONENTS OpenGL)
target_link_libraries(${MAIN_TARGET} PUBLIC OpenGL::GL)
