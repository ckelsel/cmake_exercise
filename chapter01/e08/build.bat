md build
cd build
cmake .. -G"Visual Studio 14 2015 Win64" -DCMAKE_CONFIGURATION_TYPES="Release;Debug"
cmake --build . --config debug
cd ..

rmdir /q /s build
