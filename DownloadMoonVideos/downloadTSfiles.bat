rem 28 April 2017
rem add wget download links in .txt after writing it
@echo off
ECHO Where you want to save files?
SET /p d=
cd /d %d%
ECHO Enter your header Website link
SET /p h=
ECHO Enter your footer Website link
SET /p fo=
ECHO Enter your first number
SET /p f=
ECHO Enter your last number
SET /p l=
ECHO Enter file name (without .txt)
SET /p fn=

echo %h%
echo %fo%
echo %f%
echo %l%
echo %fn%

mkdir %fn%
cd %fn%
FOR /L %%A IN (%f%,1,%l%) DO (
  echo %h%%%A%fo% >> %fn%.txt
  rem echo https://5364c75259b19.streamlock.net:1935/vod/_definst_/Enctyption_65654654/mp4:44231/03.Vi du 5-8.mp4/media_w645964685_%%A.ts >> test.txt
)
wget -r -nd -A %fo% -H --level=0 --user-agent="Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.9.0.3) Gecko/2008092416 Firefox/3.0.3" --no-check-certificate -i %fn%.txt
rem wget -r -nd -A .ts -H --level=0 --user-agent="Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.9.0.3) Gecko/2008092416 Firefox/3.0.3" --no-check-certificate -i F:\Downloads\Video\Moon\01_KienThucNenTang.txt
pause