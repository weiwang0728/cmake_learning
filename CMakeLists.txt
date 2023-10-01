#指定最小CMAKE版本
cmake_minimum_required(VERSION 3.9)

#设置项目名称
project(answer)


#[[
添加可执行文件target, 类似于原来Makefile的:
    answer: main.o answer.o
    main.o: anser.hpp main.cpp
    answer.o: answer.hpp answer.cpp

CMake 会自动找到依赖的头文件， 因此不需要特别指定，
当头文件修改的时候， 会重新编译依赖它的目标文件。
#]]

add_executable(answer main.cpp answer.cpp)

#[[
使用如下命令来构建项目:

    cmake -B build      # 生成构建文件
    cmake --build build # 构建项目
    ./build/answer      # 运行可执行文件
#]]

