#include "cppinfo.hpp"
#include "somelib.hpp"

#include <cstdint>
#include <iostream>

int main()
{
    std::cout << "Hi." << std::endl;

#pragma region Region_CPP_INFO

    CppInfo cppInfo;
    std::cout << "C++ language version: " << cppInfo.GetLanguageVersion()
              << std::endl;
    std::cout << "C++ compiler version: " << cppInfo.GetCompilerVersion()
              << std::endl;

#pragma endregion Region_CPP_INFO

#pragma region Region_PROBLEM_TESTING
/*
    std::cout << "Problematic code for testing:" << std::endl;
    for (std::size_t s = 0U; s < 5000000; ++s)
    {
        std::uint8_t *p = new std::uint8_t[1];
        *p = 0xFF;
        std::cout << "    Allocated: " << s << " byte(s)" << std::endl;
    }
*/
#pragma endregion Region_PROBLEM_TESTING

    return 0;
}
