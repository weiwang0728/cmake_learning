CC := clang
CXX := clang++

objects = main.o answer.o

answer: $(objects) 
	$(CXX) -o $@ $(objects)

# Make 可以自动推断 .o 目标文件需要依赖的同名的 .cpp文件
# 不需要手动指定 main.cpp 和 answer.cpp
# 同时也不需要写编译commands, 它知道要用CXX 变量自动执行编译

main.o: answer.hpp
answer.o: answer.hpp

.PHONY: clean
clean:
	rm -f answer $(objects)