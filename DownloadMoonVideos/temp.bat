@echo off

ECHO Enter your first number
SET /p f=
ECHO Enter your last number
SET /p l=
ECHO Enter output file name (without .mp4)
SET /p fn=

echo # %fn%>> %fn%_list.txt
echo|set /p="^"concat:">> %fn%_list.txt
rem FOR %%A in (*.ts) do (
	FOR /L %%A IN (%f%,1,%l%) DO (
echo|set /p="%%A.ts^|">> %fn%_list.txt
rem echo file '%%A.ts' >> %fn%_list.txt
)
echo|set /p="^"">> %fn%_list.txt
ffmpeg -i %fn%_list.txt -vcodec copy -acodec copy -y -bsf:a aac_adtstoasc %fn%.mp4
pause

rem ffmpeg -i 123_list.txt -f concat -c copy 123.mp4
rem ffmpeg -i 123_list.txt -f concat -safe 0  -c copy 123.mp4
rem ffmpeg -i "concat:intermediate1.ts|intermediate2.ts" -c copy -bsf:a aac_adtstoasc output.mp4
rem ffmpeg -i %fn%_list.txt -vcodec copy -acodec copy -y -bsf:a aac_adtstoasc "H:\final.mp4"
rem ffmpeg -i "concat:11.ts|12.ts|13.ts|14.ts|15.ts|16.ts|17.ts|18.ts|19.ts|20.ts|21.ts|22.ts|23.ts|24.ts|25.ts|26.ts|27.ts|28.ts|29.ts|30.ts|31.ts|32.ts|33.ts|34.ts|35.ts|36.ts|37.ts|38.ts|39.ts|40.ts|41.ts|42.ts|43.ts|44.ts|45.ts|46.ts|47.ts|48.ts|49.ts|50.ts|51.ts|52.ts|53.ts|54.ts|55.ts|56.ts|57.ts|58.ts|59.ts|60.ts|61.ts|62.ts|63.ts|64.ts|65.ts|66.ts|67.ts|68.ts|69.ts|70.ts|71.ts|72.ts|73.ts|74.ts|75.ts|76.ts|77.ts|78.ts|79.ts|80.ts|81.ts|82.ts|83.ts|84.ts|85.ts|86.ts|87.ts|88.ts|89.ts|90.ts|91.ts|92.ts|93.ts|94.ts|95.ts|96.ts|97.ts|98.ts|99.ts|100.ts|101.ts|102.ts|103.ts|104.ts|105.ts|106.ts|107.ts|108.ts|109.ts|110.ts|111.ts|112.ts|113.ts|114.ts|115.ts|116.ts|117.ts|118.ts|119.ts|120.ts|121.ts|122.ts|123.ts|124.ts|125.ts|126.ts|127.ts|128.ts|129.ts|130.ts|131.ts|132.ts|133.ts|134.ts|135.ts|136.ts|137.ts|138.ts|139.ts|140.ts|141.ts|" -vcodec copy -acodec copy -y -bsf:a aac_adtstoasc 123.mp4
rem ffmpeg -i "concat:0.ts|1.ts|2.ts|3.ts|4.ts|5.ts|6.ts|7.ts|8.ts|9.ts|10.ts|11.ts|12.ts|13.ts|14.ts|15.ts|16.ts|17.ts|18.ts|19.ts|20.ts|21.ts|22.ts|23.ts|24.ts|25.ts|26.ts|27.ts|28.ts|29.ts|30.ts|31.ts|32.ts|33.ts|34.ts|35.ts|36.ts|37.ts|38.ts|39.ts|40.ts|41.ts|42.ts|43.ts|44.ts|45.ts|46.ts|47.ts|48.ts|49.ts|50.ts|51.ts|52.ts|53.ts|54.ts|55.ts|56.ts|57.ts|58.ts|59.ts|60.ts|61.ts|62.ts|63.ts|64.ts|65.ts|66.ts|67.ts|68.ts|69.ts|70.ts|71.ts|72.ts|73.ts|74.ts|75.ts" -c copy -bsf:a aac_adtstoasc 04_vd9-11.mp4
rem ffmpeg -i "concat:0.ts|1.ts|2.ts|3.ts|4.ts|5.ts|6.ts|7.ts|8.ts|9.ts|10.ts|11.ts|12.ts|13.ts|14.ts|15.ts|16.ts|17.ts|18.ts|19.ts|20.ts|21.ts|22.ts|23.ts|24.ts|25.ts|26.ts|27.ts|28.ts|29.ts|30.ts|31.ts|32.ts|33.ts|34.ts|35.ts|36.ts|37.ts|38.ts|39.ts|40.ts|41.ts|42.ts|43.ts|44.ts|45.ts|46.ts|47.ts|48.ts|49.ts|50.ts|51.ts|52.ts|53.ts|54.ts|55.ts|56.ts|57.ts|58.ts|59.ts|60.ts|61.ts|62.ts|63.ts|64.ts|65.ts|66.ts|67.ts|68.ts|69.ts|70.ts|71.ts|72.ts|73.ts|74.ts|75.ts|76.ts|77.ts|78.ts|79.ts|80.ts|81.ts|82.ts|83.ts|84.ts|85.ts|86.ts|87.ts|88.ts|89.ts|90.ts|91.ts|92.ts|93.ts|94.ts|95.ts|96.ts|97.ts|98.ts|99.ts|100.ts|101.ts|102.ts|103.ts|104.ts|105.ts|106.ts|107.ts|108.ts|109.ts|110.ts|111.ts|112.ts|113.ts|114.ts|115.ts|116.ts|117.ts|118.ts|119.ts|120.ts|121.ts|122.ts|123.ts|124.ts|125.ts|126.ts|127.ts|128.ts|129.ts|130.ts|131.ts|132.ts|133.ts|134.ts|135.ts|136.ts|137.ts|138.ts|139.ts|140.ts" -c copy -bsf:a aac_adtstoasc 01_KienThucNenTang.mp4
rem ffmpeg -i "concat:0.ts|1.ts|2.ts|3.ts|4.ts|5.ts|6.ts|7.ts|8.ts|9.ts|10.ts|11.ts|12.ts|13.ts|14.ts|15.ts|16.ts|17.ts|18.ts|19.ts|20.ts|21.ts|22.ts|23.ts|24.ts|25.ts|26.ts|27.ts|28.ts|29.ts|30.ts|31.ts|32.ts|33.ts|34.ts|35.ts|36.ts|37.ts|38.ts|39.ts|40.ts|41.ts|42.ts|43.ts|44.ts|45.ts|46.ts|47.ts|48.ts|49.ts|50.ts|51.ts|52.ts|53.ts|54.ts|55.ts|56.ts|57.ts|58.ts|59.ts|60.ts|61.ts|62.ts|63.ts|64.ts|65.ts|66.ts|67.ts|68.ts|69.ts|70.ts|71.ts|72.ts|73.ts|74.ts|75.ts|76.ts|77.ts|78.ts|79.ts|80.ts|81.ts|82.ts|83.ts|84.ts|85.ts|86.ts|87.ts|88.ts|89.ts|90.ts|91.ts|92.ts|93.ts|94.ts|95.ts|96.ts|97.ts|98.ts|99.ts|100.ts|101.ts|102.ts|103.ts|104.ts|105.ts|106.ts|107.ts|108.ts|109.ts|110.ts|111.ts|112.ts|113.ts|114.ts|115.ts|116.ts|117.ts|118.ts|119.ts|120.ts|121.ts|122.ts|123.ts|124.ts|125.ts|126.ts|127.ts|128.ts|129.ts|130.ts|131.ts|132.ts|133.ts|134.ts|135.ts|136.ts|137.ts|138.ts|139.ts|140.ts" -vcodec copy -acodec copy -y -bsf:a aac_adtstoasc 02_vd1-4.mp4"
rem ffmpeg -i "concat:0.ts|1.ts|2.ts|3.ts|4.ts|5.ts|6.ts|7.ts|8.ts|9.ts|10.ts|11.ts|12.ts|13.ts|14.ts|15.ts|16.ts|17.ts|18.ts|19.ts|20.ts|21.ts|22.ts|23.ts|24.ts|25.ts|26.ts|27.ts|28.ts|29.ts|30.ts|31.ts|32.ts|33.ts|34.ts|35.ts|36.ts|37.ts|38.ts|39.ts|40.ts|41.ts|42.ts|43.ts|44.ts|45.ts|46.ts|47.ts|48.ts|49.ts|50.ts|51.ts|52.ts|53.ts|54.ts|55.ts|56.ts|57.ts|58.ts|59.ts|60.ts|61.ts|62.ts|63.ts|64.ts|65.ts|66.ts|67.ts|68.ts|69.ts|70.ts|71.ts|72.ts|73.ts|74.ts|75.ts|76.ts|77.ts|78.ts|79.ts|80.ts|81.ts|82.ts|83.ts|84.ts|85.ts|86.ts|87.ts|88.ts|89.ts|90.ts|91.ts|92.ts|93.ts|94.ts|95.ts|96.ts|97.ts|98.ts|99.ts|100.ts|101.ts|102.ts|103.ts|104.ts|105.ts|106.ts|107.ts|108.ts|109.ts|110.ts|111.ts|112.ts|113.ts|114.ts|115.ts|116.ts|117.ts|118.ts|119.ts|120.ts|121.ts|122.ts|123.ts|124.ts|125.ts|126.ts|127.ts|128.ts|129.ts|130.ts|131.ts|132.ts|133.ts|134.ts|135.ts|136.ts|137.ts|138.ts|139.ts|140.ts|141.ts" -vcodec copy -acodec copy -y -bsf:a aac_adtstoasc 03_vd5-8.mp4"