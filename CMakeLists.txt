
add_executable(main)
target_sources(main PRIVATE src/main.cpp)

install(
    TARGETS main
    EXPORT ${PROJECT_NAME}_Targets
    INCLUDES DESTINATION ${CMAKE_INSTALL_INCLUDEDIR})
