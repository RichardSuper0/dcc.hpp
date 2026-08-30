@echo off

:: 1. Rimuove la documentazione e il file .sh di clear
del /q README.md LICENSE.md clear.sh

:: 2. Avvia build.bat passando il nome di questo file da eliminare
if exist build.bat (
    start "" build.bat clear.bat
    exit
) else (
    echo Setup completed! 'build.bat' not found.
    del "%~f0"
    pause
)
