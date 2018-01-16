@echo off
cd H:\ffmpeg-3.2.4-win64-static\bin
rem output1.mp4
rem 00:01:40
ffmpeg -i "H:\stock.MP4" -ss 00:00:00 -t 00:01:41 -vcodec copy -acodec copy  -y -sn "H:\ouput1.mp4"
rem output2.mp4
rem 00:04:20 to 00:04:56
rem 00:00:33
ffmpeg -i "H:\stock.MP4" -ss 00:04:20 -t 00:00:33.500 -vcodec copy -acodec copy -y  -sn "H:\ouput2.mp4"
rem output3.mp4
rem 00:01:08
ffmpeg -i "H:\stock.MP4" -ss 00:07:19 -t 00:01:08.800 -vcodec copy -acodec copy -y  -sn "H:\ouput3.mp4"
cd H:\
rem ffmpeg -i "H:\stock.MP4" -vcodec copy -acodec copy -ss 00:00:00 -t 00:01:40 -sn "H:\ouput1.mp4"
rem ffmpeg -i "H:\stock.MP4" -vcodec copy -acodec copy -ss 00:04:20 -t 00:04:53 -sn "H:\ouput2.mp4"
rem ffmpeg -i "H:\stock.MP4" -vcodec copy -acodec copy -ss 00:07:19 -t 00:08:27 -sn "H:\ouput3.mp4"
pause