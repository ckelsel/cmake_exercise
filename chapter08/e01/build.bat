rmdir /q /s build
md build
cd build
cmake ..
cmake --build . --config debug
cd ..

rmdir /q /s build
