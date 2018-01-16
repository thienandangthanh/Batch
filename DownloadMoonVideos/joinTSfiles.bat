rem /**
rem  * still have bug on line 24
rem  * for /f "delims=^" %i in (^"%lfn%^") DO MyVar=%i
rem  */
@echo on

ECHO Enter your prefix of files
SET /p px=
ECHO Enter your extension of files
SET /p ex=
ECHO Enter your first number
SET /p f=
ECHO Enter your last number
SET /p l=
ECHO Enter output file name (without .mp4)
SET /p fn=

echo|set /p=^""concat:^">> %fn%_list.txt
rem echo|set /p="^"concat:">> %fn%_list.txt
FOR /L %%A IN (%f%,1,%l%) DO (
echo|set /p="%%A.ts|">> %fn%_list.txt
)
echo|set /p=^""^">> "%fn%_list.txt"
set lfn="%fn%_list.txt"
for /f "delims=^" %i in (^"%lfn%^") DO MyVar=%i
ffmpeg -i %i -vcodec copy -acodec copy -y -bsf:a aac_adtstoasc %fn%.mp4
pause