cmake_minimum_required(VERSION 3.21.1)

project(QmlStudy VERSION 0.0.0 LANGUAGES CXX)
set(CMAKE_AUTOUIC ON)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
message("dir "  ${CMAKE_CURRENT_SOURCE_DIR})
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
add_subdirectory(lib/spdlog )
if(NOT CMAKE_CXX_STANDARD)
  set(CMAKE_CXX_STANDARD 11)
  SET(CMAKE_CXX_STANDARD_REQUIRED ON)
endif()


#指定输出路径
SET(OUT_PATH ${CMAKE_CURRENT_SOURCE_DIR}/bin)
if (NOT EXISTS ${OUT_PATH})
    file(MAKE_DIRECTORY ${OUT_PATH})
endif ()
SET(EXECUTABLE_OUTPUT_PATH ${OUT_PATH})
SET(LIBRARY_OUTPUT_PATH ${OUT_PATH})
# 指定 自定模块目录
set(QML_IMPORT_PATH ${OUT_PATH})

#查找依赖
find_package(Qt6 COMPONENTS  QuickControls2 REQUIRED)
set(BIN_NAME qmlStudy)
#寻找源码
message("dir "  ${CMAKE_CURRENT_SOURCE_DIR})
#file(GLOB_RECURSE   SRCS  RELATIVE ${CMAKE_CURRENT_SOURCE_DIR}  LIST_DIRECTORIES false  
#       ${CMAKE_CURRENT_SOURCE_DIR}/main.cpp
#       ${CMAKE_CURRENT_SOURCE_DIR}/*.qrc
#    )
#aux_source_directory("./src/" SRCS)

file(GLOB_RECURSE SRCS RELATIVE ${CMAKE_CURRENT_SOURCE_DIR} 
    ${CMAKE_CURRENT_SOURCE_DIR}/src/*.cpp
    #${CMAKE_CURRENT_SOURCE_DIR}/src/include/*.h
    ${CMAKE_CURRENT_SOURCE_DIR}/assets/*.qrc

)


message("src dir "  ${CMAKE_CURRENT_SOURCE_DIR}/src)

add_executable(${BIN_NAME}   WIN32)
target_sources(${BIN_NAME} PRIVATE ${SRCS})
target_link_libraries(${BIN_NAME} PRIVATE
        Qt6::Quick
        Qt6::Qml
        Qt6::Core
        Qt6::QuickControls2
        spdlog::spdlog_header_only
    )


