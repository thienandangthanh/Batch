echo %PROCESSOR_ARCHITECTURE%

@echo off
Set RegQry=HKLM\Hardware\Description\System\CentralProcessor\0
REG.exe Query %RegQry% > checkOS.txt
Find /i "x86" < CheckOS.txt > StringCheck.txt
If %ERRORLEVEL% == 0 (
    Echo "This is 32 Bit Operating system"
) ELSE (
    Echo "This is 64 Bit Operating System"
)