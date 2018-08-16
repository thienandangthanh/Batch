@echo off
TITLE Crack IDM - TADT

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

attrib %windir%\system32\drivers\etc\hosts -r +s +h
rem TYPE hosts.txt >> %windir%\system32\drivers\etc\hosts
@echo 127.0.0.1 registeridm.com >> %windir%\system32\drivers\etc\hosts
@echo 127.0.0.1 *.registeridm.com >> %windir%\system32\drivers\etc\hosts
@echo 127.0.0.1 www.internetdownloadmanager.com >> %windir%\system32\drivers\etc\hosts
@echo 127.0.0.1 *.internetdownloadmanager.com >> %windir%\system32\drivers\etc\hosts
@echo 127.0.0.1 http://internetdownloadmanager.com/invalid_serial >> %windir%\system32\drivers\etc\hosts
@echo 127.0.0.1 http://internetdownloadmanager.com/invalid_serial2.html? >> %windir%\system32\drivers\etc\hosts
@echo 127.0.0.1 star.tonec.com >> %windir%\system32\drivers\etc\hosts
attrib %windir%\system32\drivers\etc\hosts +r +s +h
