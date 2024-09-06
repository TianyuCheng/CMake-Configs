#include <cxxopts.hpp>

int main(int argc, char* argv[])
{
    cxxopts::Options options("MyProgram", "One line description of MyProgram");

    // clang-format off
    options.add_options()
        ("d,debug", "Enable debugging") // a bool parameter
        ("i,integer", "Int param", cxxopts::value<int>())
        ("f,file", "File name", cxxopts::value<std::string>())
        ("v,verbose", "Verbose output", cxxopts::value<bool>()->default_value("false"))
        ;
    // clang-format on

    auto result = options.parse(argc, argv);
    (void)result;
    return 0;
}
