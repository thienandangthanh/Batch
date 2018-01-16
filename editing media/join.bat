@echo off
TITLE Join .ts parts - TADT
CLS
cd H:\ffmpeg-3.2.4-win64-static\bin
ffmpeg -i "H:\ouput1.mp4" -vcodec copy -acodec copy -bsf:v h264_mp4toannexb -y -f mpegts intermediate1.ts
ffmpeg -i "H:\ouput2.mp4" -vcodec copy -acodec copy -bsf:v h264_mp4toannexb -y -f mpegts intermediate2.ts
ffmpeg -i "H:\ouput3.mp4" -vcodec copy -acodec copy -bsf:v h264_mp4toannexb -y -f mpegts intermediate3.ts
ffmpeg -i "concat:intermediate1.ts|intermediate2.ts|intermediate3.ts" -vcodec copy -acodec copy -y -bsf:a aac_adtstoasc "H:\final.mp4"
cd H:\
pause