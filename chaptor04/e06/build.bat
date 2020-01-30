md build
cd build
cmake ..
cmake --build . --config release
ctest -C release -VV
cd ..
rmdir /q /s build
