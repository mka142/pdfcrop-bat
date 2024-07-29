@echo off
setlocal

if "%~1"=="" (
    echo No file specified.
    pause
    exit /b 1
)

set "filename=%~1"
set "output=%~dpn1_c.pdf"

"C:\Users\Think\AppData\Local\Programs\MiKTeX\miktex\bin\x64\pdfcrop.exe" "%filename%" "%output%"

if %errorlevel% equ 0 (
    echo Cropping successful. Output file: %output%
) else (
    echo Cropping failed.
)

pause
endlocal

