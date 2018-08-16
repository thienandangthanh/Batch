@echo off
TITLE Make links between directories - TADT

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
echo.
echo add Arduino15
if exist "C:\Users\TADT\AppData\Local\Arduino15"  ( del "C:\Users\TADT\AppData\Local\Arduino15" )
mklink /j "C:\Users\TADT\AppData\Local\Arduino15" "H:\AppData\Local\Arduino15"
echo.
echo add FluxSoftware
if exist "C:\Users\TADT\AppData\Local\FluxSoftware"  ( del "C:\Users\TADT\AppData\Local\FluxSoftware" )
mklink /j "C:\Users\TADT\AppData\Local\FluxSoftware" "H:\AppData\Local\FluxSoftware"

echo.
echo add Google
if exist "C:\Users\TADT\AppData\Local\Google"  ( del "C:\Users\TADT\AppData\Local\Google" )
mklink /j "C:\Users\TADT\AppData\Local\Google" "H:\AppData\Local\Google"

echo.
echo add Outlook
if exist "C:\Users\TADT\AppData\Local\Microsoft\Outlook"  ( del "C:\Users\TADT\AppData\Local\Microsoft\Outlook" )
mklink /j "C:\Users\TADT\AppData\Local\Microsoft\Outlook" "H:\AppData\Local\Microsoft\Outlook"
echo.
echo add Sublime Text 3
if exist "C:\Users\TADT\AppData\Local\Sublime Text 3"  ( del "C:\Users\TADT\AppData\Local\Sublime Text 3" )
mklink /j "C:\Users\TADT\AppData\Local\Sublime Text 3" "H:\AppData\Local\Sublime Text 3"

echo C:\Users\TADT\AppData\LocalLow
echo.

echo C:\Users\TADT\AppData\Roaming

echo.
echo add IDM
if exist "C:\Users\TADT\AppData\Roaming\IDM"  ( del "C:\Users\TADT\AppData\Roaming\IDM" )
mklink /j "C:\Users\TADT\AppData\Roaming\IDM" "H:\AppData\Roaming\IDM"

echo.
echo add PotPlayerMini
if exist "C:\Users\TADT\AppData\Roaming\PotPlayerMini"  ( del "C:\Users\TADT\AppData\Roaming\PotPlayerMini" )
mklink /j "C:\Users\TADT\AppData\Roaming\PotPlayerMini" "H:\AppData\Roaming\PotPlayerMini"

rem echo.
rem echo add Processing
rem if exist "C:\Users\TADT\AppData\Roaming\Processing"  ( del "C:\Users\TADT\AppData\Roaming\Processing" )
rem mklink /j "C:\Users\TADT\AppData\Roaming\Processing" "H:\AppData\Roaming\Processing"

rem echo.
rem echo add Sublime Text 3
rem if exist "C:\Users\TADT\AppData\Roaming\Sublime Text 3"  ( del "C:\Users\TADT\AppData\Roaming\Sublime Text 3" )
rem mklink /j "C:\Users\TADT\AppData\Roaming\Sublime Text 3" "H:\AppData\Roaming\Sublime Text 3"

echo.
echo add Firefox
if exist "C:\Users\TADT\AppData\LocalLow\Mozilla"  ( del "C:\Users\TADT\AppData\LocalLow\Mozilla" )
mklink /j "C:\Users\TADT\AppData\LocalLow\Mozilla" "H:\AppData\LocalLow\Mozilla\"
if exist "C:\Users\TADT\AppData\Local\Mozilla"  ( del "C:\Users\TADT\AppData\Local\Mozilla" )
mklink /j "C:\Users\TADT\AppData\Local\Mozilla" "H:\AppData\Local\Mozilla\"
if exist "C:\Users\TADT\AppData\Roaming\Mozilla"  ( del "C:\Users\TADT\AppData\Roaming\Mozilla" )
mklink /j "C:\Users\TADT\AppData\Roaming\Mozilla" "H:\AppData\Roaming\Mozilla\"

echo.
echo add Qt
if exist "C:\Users\TADT\AppData\Roaming\Qt"  ( del "C:\Users\TADT\AppData\Roaming\Qt" )
mklink /j "C:\Users\TADT\AppData\Roaming\Qt" "H:\AppData\Roaming\Qt\"
if exist "C:\Users\TADT\AppData\Roaming\QtProject"  ( del "C:\Users\TADT\AppData\Roaming\QtProject" )
mklink /j "C:\Users\TADT\AppData\Roaming\QtProject" "H:\AppData\Roaming\QtProject\"

echo.
echo add ZaloPC
if exist "C:\Users\TADT\AppData\Local\ZaloPC"  ( del "C:\Users\TADT\AppData\Local\ZaloPC" )
mklink /j "C:\Users\TADT\AppData\Local\ZaloPC" "H:\AppData\Local\ZaloPC"
if exist "C:\Users\TADT\AppData\Roaming\Zalo"  ( del "C:\Users\TADT\AppData\Roaming\Zalo" )
mklink /j "C:\Users\TADT\AppData\Roaming\Zalo" "H:\AppData\Roaming\Zalo"
pause
