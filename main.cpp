#include <iostream>
#include <answer/answer.hpp>

int main(int argc, char** argv) {
    for (;;) {
        std::cout << "What is the ultimate answer?" << std::endl;
        std::string answer;
        std::cin >> answer;
        std::string expected_answer = answer::v2::find_the_ultimate_answer();
        if (answer == expected_answer) {
            std::cout << "You already got the ultimate answer, Congrs" << std::endl;
            break;
        }
    }
    return 0;
}