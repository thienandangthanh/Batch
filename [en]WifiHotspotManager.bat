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
    :start
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
ECHO  			4 Exit
ECHO  ---------------------------------------------------
SET /p option=Please enter one of the options:

if %option%==1  ( goto setup )      else set /a er=1
if %option%==2  ( goto start1 )     else set /a er=er+1
if %option%==3  ( goto stop )       else set /a er=er+1
if %option%==4  ( exit)

:noOption
if %er% GEQ 3 ( 
Echo 			Error!
Echo 		Please enter a correct option
@pause
cls  
goto start
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