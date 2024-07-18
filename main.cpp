#include "somelib.hpp"
#include "cppinfo.hpp"

#include <iostream>

int main()
{
    std::cout << "Hi." << std::endl;

    CppInfo cppInfo;
    std::cout << "C++ language version: " << cppInfo.GetLanguageVersion() << std::endl;
    std::cout << "C++ compiler version: " << cppInfo.GetCompilerVersion() << std::endl;

    int *k = new int[1];
    *k = 1;
    //...

    return 0;
}