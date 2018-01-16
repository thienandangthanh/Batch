@echo off
cd H:\ffmpeg-3.2.4-win64-static\bin
SET "input = "H:\stock.MP4" "
ffmpeg -i %input -vcodec copy -acodec copy -ss 00:00:00 -t 00:01:40 -sn ouput1.mp4
pause