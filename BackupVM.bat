rem Auto backup Vitual Machine created with VitualBox
rem https://www.virtualbox.org/manual/ch08.html#vboxmanage-startvm
rem https://www.virtualbox.org/manual/ch08.html#vboxmanage-controlvm
set %VMpath% = "D:\"
set %BUpath% = "D:\"
set %VMname% = "vm"
at 00:00 VBoxManage controlvm VMname savestate && copy VMpath BUpath\... && VBoxManage startvm VMname
