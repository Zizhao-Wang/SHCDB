rm -rf */release
mkdir ../release
cd ../release && cmake -DCMAKE_BUILD_TYPE=Debug .. && make -j32 && cd ../