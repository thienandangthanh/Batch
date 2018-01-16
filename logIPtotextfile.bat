@ECHO off
ipconfig | find "IP Address" > \File.txt
< \File.txt SET /P first_ip=
FOR /F "delims=: tokens=2" %%I IN ("%first_ip%") DO (
  CALL :MyEcho %%I
)
:: the following command is there merely to
:: avoid running (into) the subroutine again
GOTO :EOF

:MyEcho
ECHO %1> \File.txt