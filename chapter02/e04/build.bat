md build
cd build
cmake .. -G "Visual Studio 14 2015 Win64"
cd ..
rmdir /q /s build

md build
cd build
cmake .. -G "Visual Studio 14 2015"
cd ..
rmdir /q /s build
