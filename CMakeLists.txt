cmake_minimum_required(VERSION 3.10)

project(NikaWindows)

set(CMAKE_CXX_STANDARD 11)

include_directories(include)

add_executable(NikaWindows src/main.cpp src/memory.cpp)
