rem RemoveOneDriveWin10
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

rem REG ADD [ROOT\]RegKey /v ValueName [/t DataType] [/S Separator] [/d Data] [/f]
systeminfo
REG ADD HKLM\Software\Policies\Microsoft\Windows\OneDrive /v DisableFileSyncNGSC [/t REG_DWORD] [/d 1] [/f]
taskkill /f /im OneDrive.exe

echo %PROCESSOR_ARCHITECTURE%
IF %PROCESSOR_ARCHITECTURE% == AMD64 (
rem x64
%SystemRoot%\SysWOW64\OneDriveSetup.exe /uninstall
) ELSE (
rem x86
%SystemRoot%\System32\OneDriveSetup.exe /uninstall
)

rem Cleaning and Removing OneDrive Remnants
rd "%UserProfile%\OneDrive" /Q /S
rd "%LocalAppData%\Microsoft\OneDrive" /Q /S
rd "%ProgramData%\Microsoft OneDrive" /Q /S
rd "C:\OneDriveTemp" /Q /S

rem Delete and Remove OneDrive in File Explorer Folder Tree Registry Key
REG Delete "HKEY_CLASSES_ROOT\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}" /f
REG Delete "HKEY_CLASSES_ROOT\Wow6432Node\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}" /f
