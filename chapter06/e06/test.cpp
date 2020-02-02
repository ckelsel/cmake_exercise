#include <iostream>
#include <windows.h>
#include "config.h"
using namespace std;

int main(int argc, char **argv)
{
    printf("hash: %s\n", GIT_HASH);
    return 0;
}
