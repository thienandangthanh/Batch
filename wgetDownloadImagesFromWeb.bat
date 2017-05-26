@echo off
TITLE Clone images on Website - TADT
CLS
ECHO Enter your Website link, ie. "http://www.luyenthithukhoa.vn/index.php"
SET /p link=
ECHO Enter your Directory to save images, ie. "C:\Users\TADT\My Documents\Downloads"
SET /p sdir=
ECHO Enter your image file types to download, ie. "jpeg,jpg,bmp,gif,png"
SET /p typ=
wget -r -A %typ% -P %sdir% "%link%"
pause
@exit