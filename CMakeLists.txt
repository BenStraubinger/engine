cmake_minimum_required(VERSION 3.4)
project(imgui-demo)

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++14")


include(${PROJECT_SOURCE_DIR}/conanbuildinfo.cmake)
conan_basic_setup()


set( CMAKE_RUNTIME_OUTPUT_DIRECTORY "${PROJECT_SOURCE_DIR}/bin" )


include_directories("${PROJECT_SOURCE_DIR}/src")
include_directories("${PROJECT_SOURCE_DIR}/ext")


################################################################################
#
# system libraries:
#
################################################################################

#
# OpenGL: (https://www.opengl.org/wiki/Getting_Started
#
find_package(OpenGL)
if(NOT OPENGL_FOUND)
    message(ERROR "OpenGL not found!")
endif(NOT OPENGL_FOUND)
if(NOT OPENGL_GLU_FOUND)
    message(ERROR "OpenGL GLU not found!")
endif(NOT OPENGL_GLU_FOUND)

include_directories(${OPENGL_INCLUDE_DIR})


################################################################################
#
# build and link:
#
################################################################################

add_executable( imgui-demo

        src/main.cpp
		src/ext/imgui_impl_sdl_gl3.cpp
		src/ext/imgui_impl_sdl_gl3.h

        #src/Util.h

        #
        # external source libraries
        #

		ext/imgui/imgui.h
		ext/imgui/imgui.cpp
		ext/imgui/imconfig.h
		ext/imgui/imgui_internal.h
		ext/imgui/imgui_draw.cpp
		ext/imgui/imgui_demo.cpp
		ext/imgui/stb_rect_pack.h
		ext/imgui/stb_textedit.h
		ext/imgui/stb_truetype.h

)


target_link_libraries( imgui-demo 
    ${CONAN_LIBS}
    ${OPENGL_gl_LIBRARY}
    ${OPENGL_glu_LIBRARY}
)


#file(COPY install_root/ DESTINATION "${PROJECT_SOURCE_DIR}/bin")
