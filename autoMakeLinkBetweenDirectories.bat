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
echo C:\Users\TADT\AppData\Local
echo.
echo add Arduino15
mklink /j "C:\Users\TADT\AppData\Local\Arduino15" "H:\AppData\Local\Arduino15"
echo.
echo add FluxSoftware
mklink /j "C:\Users\TADT\AppData\Local\FluxSoftware" "H:\AppData\Local\FluxSoftware"

echo.
echo add Google
mklink /j "C:\Users\TADT\AppData\Local\Google" "H:\AppData\Local\Google"

echo.
echo add Outlook
mklink /j "C:\Users\TADT\AppData\Local\Microsoft\Outlook" "H:\AppData\Local\Microsoft\Outlook"
echo.
echo add Sublime Text 3
mklink /j "C:\Users\TADT\AppData\Local\Sublime Text 3" "H:\AppData\Local\Sublime Text 3"

echo C:\Users\TADT\AppData\LocalLow
echo.
echo add Dashlane
mklink /j "C:\Users\TADT\AppData\LocalLow\Dashlane" "H:\AppData\LocalLow\Dashlane"

echo.
echo C:\Users\TADT\AppData\Roaming

echo.
echo add Dashlane
mklink /j "C:\Users\TADT\AppData\Roaming\Dashlane" "H:\AppData\Roaming\Dashlane"

echo.
echo add IDM
mklink /j "C:\Users\TADT\AppData\Roaming\IDM" "H:\AppData\Roaming\IDM"

echo.
echo add PotPlayerMini
mklink /j "C:\Users\TADT\AppData\Roaming\PotPlayerMini" "H:\AppData\Roaming\PotPlayerMini"

echo.
echo add Processing
mklink /j "C:\Users\TADT\AppData\Roaming\Processing" "H:\AppData\Roaming\Processing"

echo.
echo add Sublime Text 3
mklink /j "C:\Users\TADT\AppData\Roaming\Sublime Text 3" "H:\AppData\Roaming\Sublime Text 3"

echo.
echo add Firefox

mklink /j "C:\Users\TADT\AppData\LocalLow\Mozilla" "H:\AppData\LocalLow\Mozilla\"
mklink /j "C:\Users\TADT\AppData\Local\Mozilla" "H:\AppData\Local\Mozilla\"
mklink /j "C:\Users\TADT\AppData\Roaming\Mozilla" "H:\AppData\Roaming\Mozilla\"

pause