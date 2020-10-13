rmdir /q /s build
md build
cd build
cmake ..
cmake --build . --target install
cd ..
