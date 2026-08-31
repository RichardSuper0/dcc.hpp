#!/bin/bash

rm -f README.md LICENSE.md clear.bat

cd ..
if [ -d "dcc.hpp" ]; then
    mv dcc.hpp DCC
    cd DCC
fi

if [ -f "build.sh" ]; then
    chmod +x build.sh
    exec ./build.sh clear.sh
fi