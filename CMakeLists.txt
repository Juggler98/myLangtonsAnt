cmake_minimum_required(VERSION 3.17)
project(langtonsAntCpp)

set(CMAKE_CXX_STANDARD 14)

set(SDL2_INCLUDE_DIR C:/libsdl/SDL/include)
set(SDL2_LIB_DIR C:/libsdl/SDL/lib/x86)

include_directories(${SDL2_INCLUDE_DIR})
link_directories(${SDL2_LIB_DIR})

add_executable(langtonsAntCpp main.cpp)

target_link_libraries(${PROJECT_NAME} SDL2main SDL2)