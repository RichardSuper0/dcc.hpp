@echo off
setlocal

del /q README.md LICENSE.md clear.sh 2>nul

cd ..
if exist dcc.hpp (
    ren dcc.hpp DCC
    cd DCC
)

if exist build.bat (
    start "" build.bat clear.bat
    exit
) else (
    del "%~f0"
    pause
)