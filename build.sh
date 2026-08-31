#!/bin/bash

rm -f clear.sh build.bat

if ! command -v clang >/dev/null && ! command -v gcc >/dev/null; then
    echo "No compiler found."
    exit 1
fi

arch=$(uname -m)
case "$arch" in
    x86_64) march="x86-64" ;;
    aarch64|arm64) march="armv8-a" ;;
    i686) march="i686" ;;
    *) march="native" ;;
esac

echo "1) portable"
echo "2) native"
read -p "[1|2] > " mode

if [ "$mode" = "1" ]; then
    CFLAGS="-O2 -march=$march"
else
    CFLAGS="-Ofast -march=native -flto"
fi

mkdir -p safe

if command -v clang >/dev/null; then
    clang $CFLAGS -c src/dcc.cpp -o safe/dcc.o
else
    gcc $CFLAGS -c src/dcc.cpp -o safe/dcc.o
fi

> dcc.hpp

if command -v clang >/dev/null; then
    clang -E include/main.hpp >> dcc.hpp
else
    gcc -E include/main.hpp >> dcc.hpp
fi

rm -rf include src start.bat

echo "Build complete."
echo "Create your bot here."
echo "chmod +x start.sh && ./start.sh"