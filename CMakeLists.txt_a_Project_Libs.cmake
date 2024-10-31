# ATTACH EXTERNAL LIBRARIES BELOW...

add_subdirectory("lib/libcppinfo")
add_subdirectory("lib/libproject_version")
add_subdirectory("lib/libzexample")

find_package(Boost REQUIRED COMPONENTS ALL CONFIG)
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
