#!/bin/bash

# 1. Rimuove la documentazione e lo script clear per Windows
rm -f README.md LICENSE.md clear.bat

# 2. Si sposta fuori, rinomina dcc.hpp in DCC e rientra nella nuova cartella
cd ..
if [ -d "dcc.hpp" ]; then
    mv dcc.hpp DCC
    cd DCC
fi

# 3. Ora che la cartella è rinominata, rende eseguibile build.sh e lo avvia
if [ -f "build.sh" ]; then
    chmod +x build.sh
    exec ./build.sh clear.sh
else
    echo "Setup completed! 'build.sh' not found."
    rm -- "$0"
fi
