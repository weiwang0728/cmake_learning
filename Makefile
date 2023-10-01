
# := 用于给变量赋值，赋值后变量的值不会再改变 

# 一般全大写变量用来表示允许条用Make的时候传入的变量

# 这里的CC 和 CXX 指定了要使用的C 和 C++ 编译器

CC := clang
CXX := clang++

# 这里的CFLAGS 和 CXXFLAGS 指定了编译器的参数

# Makefile 中的核心概念是target(目标)， 定义target的基本语法是
# target: dependencies
#	command
#
# 也就是说，target依赖于dependencies，当dependencies中的文件有更新时，command会被执行
# target可以是一个文件，也可以是一个action，也可以是一个label
#
# 一个target可以有多个dependencies，也可以有多个command，每个command占一行，每行必须以tab开头
# 要构建某个target的时候，使用如下命令:
# make target

# .PHONY 表示 all 不是一个真实会生成的文件， 而是一个伪目标

.PHONY: all
all: hello

#由于之后多次需要使用main.o 等目标文件， 可以赋值给变量
objects := main.o

#hello 表示我们最终生成的可执行文件名， 它依赖于objcets中的所有目标文件

#它的commands 部分使用 CXX 指定的编译器将所有目标文件链接成hello可执行文件

hello: $(objects)
	$(CXX) -o $@ $(objects)

#main.o 目标文件依赖main.cpp 源文件
main.o : main.cpp
	$(CXX) -c main.cpp	

#clean 用于清楚构建生成的临时文件、目标文件和可执行文件
.PHONY:clean
clean: 
	rm -f hello $(objects)