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
echo This will create an undeletable folder AUTORUN.INF and a file RECYCLER on
echo the drive you choose in next prompt.
echo.
echo  1. Enable
echo  2. Disable (Undo this tweak)
echo  3. Exit
echo.
set /p twk=Choose an option:
if "%twk%"=="1" goto d
if "%twk%"=="2" goto d
exit
:d
set /p usbdr=Now Choose the Drive (eg. E):
if not exist %usbdr%:\nul echo Invalid Drive %usbdr%:\
if not exist %usbdr%:\nul goto d
if "%twk%"=="1" goto m
if "%twk%"=="2" goto r
exit
:m
if exist %usbdr%:\Recycler\nul rmdir /s /q \\.\\%usbdr%:\Recycler
if exist %usbdr%:\Recycler del /f /q /a %usbdr%:\Recycler
echo www.hiren.info.txt> %usbdr%:\Recycler
attrib %usbdr%:\Recycler +r +s +h

if exist %usbdr%:\$Recycle.Bin\nul rmdir /s /q \\.\\%usbdr%:\$Recycle.Bin
if exist %usbdr%:\$Recycle.Bin del /f /q /a %usbdr%:\$Recycle.Bin
echo www.hiren.info.txt> %usbdr%:\$Recycle.Bin
attrib %usbdr%:\$Recycle.Bin +r +s +h

if exist %usbdr%:\Recycled\nul rmdir /s /q \\.\\%usbdr%:\Recycled
if exist %usbdr%:\Recycled del /f /q /a %usbdr%:\Recycled
echo www.hiren.info.txt> %usbdr%:\Recycled
attrib %usbdr%:\Recycled +r +s +h

if exist %usbdr%:\Autorun.inf del /f /q /a %usbdr%:\Autorun.inf
mkdir \\.\\%usbdr%:\Autorun.inf\nul.Hiren'sBootCD
attrib %usbdr%:\Autorun.inf +r +s +h

if exist %usbdr%:\Autorun.ini del /f /q /a %usbdr%:\Autorun.ini
mkdir \\.\\%usbdr%:\Autorun.ini\nul.Hiren'sBootCD
attrib %usbdr%:\Autorun.ini +r +s +h

echo Folder %usbdr%:\AUTORUN.INF and %usbdr%:\AUTORUN.INI and File RECYCLER created
goto x
:r
rmdir /s /q \\.\\%usbdr%:\Autorun.inf
rmdir /s /q \\.\\%usbdr%:\Autorun.ini
del /f /q /a %usbdr%:\Recycled
del /f /q /a %usbdr%:\Recycler
del /f /q /a %usbdr%:\$Recycle.Bin
echo Folder %usbdr%:\AUTORUN.INF and %usbdr%:\AUTORUN.INI and RECYCLER Files removed
:x
set usbdr=
echo.
echo  1. Protect other drives
echo  2. Exit
echo.
set /p e=Choose an option:
if "%e%"=="1" goto d
exit
rem pause>nul
