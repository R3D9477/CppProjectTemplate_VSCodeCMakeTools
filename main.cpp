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

    for (std::size_t s = 0U; s < 100000000; ++s)
    {
        std::cout << s;

        int *p = new int[1];
        *p = 100;
    }

    return 0;
}
