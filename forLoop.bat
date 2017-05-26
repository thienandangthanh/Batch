@echo off
ver
cd /d "C:\"
FOR /L %%A IN (7,1,11) DO (
  rem add one line
  ECHO:
  ECHO %%A
)
pause