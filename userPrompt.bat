echo off
:begin
echo Select a task:
echo =============
echo -
echo 1) Option 1
echo 2) Option 2
echo 3) Option 3
echo 4) Option 4
echo -
set /p op=Type option:
if "%op%"=="1" goto op1
if "%op%"=="2" goto op2
if "%op%"=="3" goto op3
if "%op%"=="4" goto op4

echo Please Pick an option:
goto begin


:op1
echo you picked option 1
goto exit

:op2
echo you picked option 2
goto exit

:op3
echo you picked option 3
goto exit

:op4
echo you picked option 4
goto exit

:exit
@exit


rem @ECHO OFF
rem CLS
rem ECHO 1.Restart
rem ECHO 2.Shutdown
rem ECHO 3.Close all Windows
rem ECHO 4.Log off
rem ECHO 5.Switch User
rem ECHO.

rem CHOICE /C 12345 /M "Enter your choice:"

rem :: Note - list ERRORLEVELS in decreasing order
rem IF ERRORLEVEL 5 GOTO SwitchUser
rem IF ERRORLEVEL 4 GOTO Logoff
rem IF ERRORLEVEL 3 GOTO CloseAllWindows
rem IF ERRORLEVEL 2 GOTO Shutdown
rem IF ERRORLEVEL 1 GOTO Restart

rem :Restart
rem ECHO Restart (put your restart code here)
rem GOTO End

rem :Shutdown
rem ECHO Shutdown (put your shutdown code here)
rem GOTO End

rem :CloseAllWindows
rem ECHO Close All Windows (put your close all windows code here)
rem GOTO End

rem :Logoff
rem ECHO Logoff (put your log off code here)
rem GOTO End

rem :SwitchUser
rem ECHO Switch User (put your switch user code here)
rem GOTO End

rem :End