#include "cppinfo.hpp"
#include "libexample.hpp"
#include "project_version.hpp"

#include <cstdint>
#include <iostream>

int main()
{
    std::cout << "Hi." << std::endl;

    std::cout << "Project version: " << project_version() << std::endl;

    CppInfo cppInfo;
    std::cout << "C++ language version: " << cppInfo.GetLanguageVersion() << std::endl;
    std::cout << "C++ compiler version: " << cppInfo.GetCompilerVersion() << std::endl;

    /*std::cout << "Problematic code for testing:" << std::endl;
    for (std::size_t s = 0U; s < 50000000; ++s)
    {
        std::uint8_t *p = new std::uint8_t[1];
        *p = 0xFF;
        std::cout << "    Allocated: " << s << " byte(s)" << std::endl;
    }*/

    return 0;
}
