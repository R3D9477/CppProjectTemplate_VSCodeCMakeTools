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

    while (true)
    {
        std::cout << 1;

        // int *p = new int[1];
        //*p = 1;
    }

    return 0;
}
