@echo off
TITLE WIFI HOTSPOT CONFIGURATION - TADT

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
    :begin
@ECHO off
ECHO  ---------------------------------------------------
ECHO			TADT Production
ECHO		   Wifi Hotspot Configuration
ECHO  ---------------------------------------------------
ECHO  		Pleae select one of the options
ECHO  ---------------------------------------------------
ECHO  			1 Settings
ECHO  			2 Start
ECHO  			3 Stop
ECHO  			4 Current status
ECHO  			5 Exit
ECHO  ---------------------------------------------------
SET /p option=Please enter one of the options:

if %option%==1  ( goto setup )      else set /a er=1
if %option%==2  ( goto start )     else set /a er=er+1
if %option%==3  ( goto stop )       else set /a er=er+1
if %option%==4  ( goto status )       else set /a er=er+1
if %option%==5  ( exit)

:noOption
if %er% GEQ 3 (
Echo 			Error!
Echo 		Please enter a correct option
@pause
cls
goto begin
)

:setup
SET /p ssid=Please enter the Hotspot name:
SET /p key=Please enter the Hotspot password greater the 8 digits:
netsh wlan set hostednetwork mode=allow ssid="%ssid%" key="%key%"
if %errorlevel%==0 (
ECHO Setup complete
)
@pause
cls
goto begin

:start
netsh wlan start hostednetwork
@pause
cls
goto begin

:stop
netsh wlan stop hostednetwork
@pause
cls
goto begin

:status
netsh wlan show hostednetwork | findstr -i status
echo SSID Name
netsh wlan show hostednetwork | findstr -i " ssid "
netsh wlan show hostednetwork setting=security
echo Connected clients
rem arp -a | findstr -i 192.168.173 | findstr /V 255 | findstr /V 192.168.173.1
netsh wlan show hostednetwork | findstr -i " Number of clients "
netsh wlan show hostednetwork | findstr -i " Authenticated "
echo.

@pause
cls
goto begin
goto :eof
