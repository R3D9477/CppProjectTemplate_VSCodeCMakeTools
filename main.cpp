#include "cppinfo.hpp"
#include "somelib.hpp"

#include <iostream>

int main()
{
    std::cout << "Hi." << std::endl;

    CppInfo cppInfo;
    std::cout << "C++ language version: " << cppInfo.GetLanguageVersion()
              << std::endl;
    std::cout << "C++ compiler version: " << cppInfo.GetCompilerVersion()
              << std::endl;

    return 0;
}
