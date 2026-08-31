@echo off
setlocal

del /q clear.bat build.sh 2>nul

where clang >nul 2>nul
if %errorlevel% neq 0 (
    where gcc >nul 2>nul
    if %errorlevel% neq 0 (
        echo No compiler found.
        exit /b
    )
)

set arch=%PROCESSOR_ARCHITECTURE%
if "%arch%"=="AMD64" set march=x86-64
if "%arch%"=="ARM64" set march=armv8-a
if "%arch%"=="x86" set march=i686
if "%march%"=="" set march=native

echo 1) portable
echo 2) native
set /p mode="[1|2] > "

if "%mode%"=="1" (
    set CFLAGS=-O2 -march=%march%
) else (
    set CFLAGS=-Ofast -march=native -flto
)

mkdir safe 2>nul

where clang >nul 2>nul
if %errorlevel%==0 (
    clang %CFLAGS% -c src\dcc.cpp -o safe\dcc.o
) else (
    gcc %CFLAGS% -c src\dcc.cpp -o safe\dcc.o
)

type nul > dcc.hpp

where clang >nul 2>nul
if %errorlevel%==0 (
    clang -E include\main.hpp >> dcc.hpp
) else (
    gcc -E include\main.hpp >> dcc.hpp
)

rmdir /s /q include
rmdir /s /q src
del /q start.sh 2>nul

echo Build complete.
echo Create your bot here.
echo Run start.bat when ready.