@echo off
TITLE Add a directory to PATH - TADT

SET /p addPATH=Please enter the directory you want to add:
set PATH=%PATH%;%addPATH%
if %errorlevel%==0 (
ECHO Setup complete
)
@pause