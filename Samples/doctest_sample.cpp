#define DOCTEST_CONFIG_IMPLEMENT_WITH_MAIN
#include <doctest/doctest.h>

#include <iostream>

TEST_CASE("my-test")
{
    std::cout << "Hello, World!" << std::endl;
}
