rem HOW TO USE:
rem HDDdataCheckCorruption.bat c:\bigfile.dat e:\bigfile.dat
rem source file should be more than 500MB
@echo off
echo checking data
echo [press ctrl+c to terminate script]
:Loop
 
copy %1 %2 >nul
fc /b %1 %2 > nul
if ERRORLEVEL 1 GOTO Fail
 
GOTO Loop
 
:Fail
echo sorry, data corrupted...