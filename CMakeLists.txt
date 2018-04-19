cmake_minimum_required(VERSION 3.0)

project(hello CXX)

include(${CMAKE_BINARY_DIR}/conanbuildinfo.cmake)
conan_basic_setup()
target_link_libraries(${PROJECT_NAME} ${CONAN_LIBS})

set(${PROJECT_NAME}_SRC
	src/hello.cpp
)

add_executable(${PROJECT_NAME} ${${PROJECT_NAME}_SRC})

set_property(TARGET ${PROJECT_NAME} PROPERTY CXX_STANDARD 14)
