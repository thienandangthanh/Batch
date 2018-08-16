@ECHO off
TITLE Add/remove "Open with Sublime Text context" - TADT

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
ECHO Add "Open with Sublime Text 3" to menu context
ECHO or
ECHO Remove "Open with Sublime Text 3" to menu context
SET /p prompt=Enter your choice [A/R]:
IF %prompt% EQU r GOTO Remove
IF %prompt% EQU R GOTO Remove
IF %prompt% EQU a GOTO Add
IF %prompt% EQU A GOTO Add

:Add
:: set file path of your Sublime text
SET st3Path=C:\Program Files\Sublime Text 3\sublime_text.exe
ECHO Enter your "sublime_text.exe" path, ie. "C:\Program Files\Sublime Text 3\sublime_text.exe"
SET /p st3Path=

:: add it for all file types
@reg add "HKEY_CLASSES_ROOT\*\shell\Open with Sublime Text"         /t REG_SZ /v "" /d "Open with Sublime Text"   /f
@reg add "HKEY_CLASSES_ROOT\*\shell\Open with Sublime Text"         /t REG_EXPAND_SZ /v "Icon" /d "%st3Path%,0" /f
@reg add "HKEY_CLASSES_ROOT\*\shell\Open with Sublime Text\command" /t REG_SZ /v "" /d "%st3Path% \"%%1\"" /f
:: add it for folders
@reg add "HKEY_CLASSES_ROOT\Folder\shell\Open with Sublime Text"         /t REG_SZ /v "" /d "Open with Sublime Text"   /f
@reg add "HKEY_CLASSES_ROOT\Folder\shell\Open with Sublime Text"         /t REG_EXPAND_SZ /v "Icon" /d "%st3Path%,0" /f
@reg add "HKEY_CLASSES_ROOT\Folder\shell\Open with Sublime Text\command" /t REG_SZ /v "" /d "%st3Path% \"%%1\"" /f
GOTO exit

:Remove
@reg delete "HKEY_CLASSES_ROOT\*\shell\Open with Sublime Text"
@reg delete "HKEY_CLASSES_ROOT\Folder\shell\Open with Sublime Text"
GOTO exit

:exit
PAUSE
@exit
