@echo off
title THIET LAP TRAM PHAT WIFI - TADT

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

    :start
@ECHO off
ECHO  ---------------------------------------------------
ECHO  		THIET LAP TRAM PHAT WIFI
ECHO  		  Mot San Pham Cua TADT
ECHO  ---------------------------------------------------
ECHO  	Chon mot trong nhung lua chon sau
ECHO  ---------------------------------------------------
ECHO  		1 Thay doi cau hinh
ECHO  		2 Bat dau phat Wifi
ECHO  		3 Ngung phat Wifi
ECHO  		4 Thoat
ECHO  ---------------------------------------------------
SET /p option=Please enter one of the options:

if %option%==1  ( goto setup )      else set /a er=1
if %option%==2  ( goto start1 )     else set /a er=er+1
if %option%==3  ( goto stop )       else set /a er=er+1
if %option%==4  ( exit )

:noOption
if %er% GEQ 3 ( 
Echo 		Da Xay Ra Loi!!!
Echo 	Vui long nhap lai dung lua chon (1, 2, 3, 4)
@pause
cls  
goto start
)

:setup
SET /p ssid=Ten Wifi: 
SET /p key=Mat khau cua Wifi ( Tren 8 ki tu): 
netsh wlan set hostednetwork mode=allow ssid="%ssid%" key="%key%" 
if %errorlevel%==0 (
ECHO THIET LAP THANH CONG!!!
)
@pause
cls  
goto start

:start1
netsh wlan start hostednetwork
@pause
cls  
goto start

:stop
netsh wlan stop hostednetwork
@pause
cls  
goto start
goto :eof
