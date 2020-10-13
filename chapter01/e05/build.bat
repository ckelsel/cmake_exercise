md build
cd build
cmake -D USE_LIBRARY=ON ..
cmake --build .
cd ..

rmdir /q /s build
