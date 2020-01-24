#include <iostream>
using namespace std;

int main(int argc, char **argv)
{
#ifdef CXX_COMPILER_INTEL
    cout << "hello from intel compiler" << endl;;
#elif defined CXX_COMPILER_GNU
    cout << "hello from gnu compiler" << endl;;
#elif defined CXX_COMPILER_MSVC
    cout << "hello from msvc compiler" << endl;;
#endif
    return 0;
}
