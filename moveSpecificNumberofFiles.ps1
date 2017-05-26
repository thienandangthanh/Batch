$filesperfolder = 500
$sourcePath = "I:\G"
$destPath = "I:\G\Sub1"
$i = 0;
$folderNum = 1;

Get-ChildItem "$sourcePath\*.*" | % {

    New-Item -Path ($destPath + "\" + $folderNum) -Type Directory -Force
    Move-Item $_ ($destPath + "\" + $folderNum);

    $i++;

    if ($i -eq $filesperfolder){
        $folderNum++;
        $i = 0 ;
    }
}