set wshshell = wscript.CreateObject("wscript.shell")
echo off
title Greetings, Victim
color 04
do
echo You Have A Virus
ping localhost -n .5 >nul
loop
pause