@echo off
TITLE Protect Drive From AutorunVirus - TADT

:: BatchGotAdmin
:-------------------------------------
REM  --> Check for permissions
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"

REM --> If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
    echo Requesting administrative privileges...
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    echo UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
    if exist "%temp%\getadmin.vbs" ( del "%temp%\getadmin.vbs" )
    pushd "%CD%"
    CD /D "%~dp0"
:--------------------------------------

CLS
:s
echo This will unhide all files and folders in your thumbdrive you choose in next prompt
echo.
echo  1. Unhide
echo  2. Exit
echo.
set /p twk=Choose an option:
if "%twk%"=="1" goto d
exit
:d
set /p usbdr=Now Choose the Drive (eg. E):
if not exist %usbdr%:\nul echo Invalid Drive %usbdr%:\
if not exist %usbdr%:\nul goto d
if "%twk%"=="1" goto u
exit
:u
attrib /D /S %usbdr%:\*.* -r -s -h
del /f %usbdr%:\*.exe
del /f %usbdr%:\*.lnk
goto x
:x
set usbdr=
echo.
echo  1. Recover other drives
echo  2. Exit
echo.
set /p e=Choose an option:
if "%e%"=="1" goto d
exit
rem pause>nul
