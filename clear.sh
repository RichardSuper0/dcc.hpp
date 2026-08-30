#!/bin/bash

# 1. Rimuove la documentazione e il file .bat di clear
rm -f README.md LICENSE.md clear.bat

# 2. Rende eseguibile build.sh e passa il controllo ad esso
if [ -f "build.sh" ]; then
    chmod +x build.sh
    exec ./build.sh clear.sh
else
    echo "Setup completed! 'build.sh' not found."
    rm -- "$0"
fi
