@echo off

:: 1. Rimuove la documentazione e lo script clear per Linux
del /q README.md LICENSE.md clear.sh

:: 2. Si sposta fuori, rinomina dcc.hpp in DCC e rientra nella nuova cartella
cd ..
if exist dcc.hpp (
    ren dcc.hpp DCC
    cd DCC
)

:: 3. Ora che la cartella è rinominata, lancia build.bat passando il nome di questo file da eliminare
if exist build.bat (
    start "" build.bat clear.bat
    exit
) else (
    echo Setup completed! 'build.bat' not found.
    del "%~f0"
    pause
)
