@echo off
setlocal

if not "%1"=="am_admin" (
    powershell -Command "Start-Process -Verb RunAs -FilePath '%0' -ArgumentList 'am_admin %*'"
    exit /b
)

echo main code here

if "%~2"=="" (
    echo No file specified.
    pause
    exit /b 1
)

set "filename=%~2"
set "output=%~dpn2_c.pdf"

:: Run pdfcrop with administrative privileges
"C:\Users\Think\AppData\Local\Programs\MiKTeX\miktex\bin\x64\pdfcrop.exe" "%filename%" "%output%"

if %errorlevel% equ 0 (
    echo File: %filename%
    echo Cropping successful. Output file: %output%
) else (
    echo Cropping failed.
)

: pause
endlocal
