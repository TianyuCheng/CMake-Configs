#include <iostream>
#include "cfgpath.h"

int main(int argc, const char* argv[])
{
    char cfgdir[MAX_PATH];
    get_user_config_file(cfgdir, sizeof(cfgdir), "myapp");
    if (cfgdir[0] == 0) {
        std::cerr << "Unable to find home directory." << std::endl;
        return 1;
    }
    std::cout << "Saving configuration file to " << cfgdir << std::endl;
}
