#include <iostream>
using namespace std;

int main(int argc, char **argv)
{
#ifdef OS_LINUX
    cout << "hello from Linux" << endl;;
#elif defined OS_WINDOWS
    cout << "hello from Windows" << endl;
#endif
    return 0;
}
