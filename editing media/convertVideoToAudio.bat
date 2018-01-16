@echo off
TITLE Convert Video to Audio - TADT
CLS
ECHO Which file you wanna convert? ie. "C:\Users\TADT\My Documents\Downloads\video.mp4"
SET /p file=
ECHO Convert to which file type? ie. "mp3", "flac" or "wav"
SET /p type=
ECHO New name for audio? ie. "Shape of you", "Hello" or "Paradise"
SET /p name=
ffmpeg -i "%file%" -vn "%name%.%type%"
pause