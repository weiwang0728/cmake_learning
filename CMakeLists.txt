#指定最小CMAKE版本
cmake_minimum_required(VERSION 3.9)

#设置项目名称
project(answer)

#添加answer 子目录
add_subdirectory(answer)
add_subdirectory(curl_wrapper)
add_subdirectory(wolfram)
add_executable(answer_app main.cpp)
target_link_libraries(answer_app libanswer)

#[[
使用如下命令来构建项目:

    cmake -B build      # 生成构建文件
    cmake --build build # 构建项目
    ./build/answer      # 运行可执行文件
#]]

