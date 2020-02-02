rmdir /q /s build
md build
cd build
cmake ..
cmake --build . --config release
cd ..

REM  rmdir /q /s build
