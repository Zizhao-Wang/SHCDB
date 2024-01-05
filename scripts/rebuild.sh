rm -rf */src/release
mkdir ../src/release
cd ../src/release && cmake -DCMAKE_BUILD_TYPE=Debug .. && make -j32 && cd ../../