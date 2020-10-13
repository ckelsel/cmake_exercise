md build
cd build
REM  不能有空格
REM  -D CMAKE_CONFIGURATION_TYPES
cmake .. -G"Visual Studio 14 2015 Win64" -DCMAKE_CONFIGURATION_TYPES="Release;Debug"
cmake --build . --config debug
cd ..

rmdir /q /s build
