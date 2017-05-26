set wshshell = wscript.CreateObject("wscript.shell")
wshshell.run "Notepad"
wscript.sleep 2000
wshshell.AppActivate "Notepad"
wshshell.sendkeys"A"
wscript.sleep 145
wshshell.sendkeys"l"
wscript.sleep 101
wshshell.sendkeys"l"
wscript.sleep 125
wshshell.sendkeys" "
wscript.sleep 250
wshshell.sendkeys"y"
wscript.sleep 150
wshshell.sendkeys"o"
wscript.sleep 130
wshshell.sendkeys"u"
wscript.sleep 161
wshshell.sendkeys"r"
wscript.sleep 140
wshshell.sendkeys" "
wscript.sleep 185
wshshell.sendkeys"b"
wscript.sleep 150
wshshell.sendkeys"a"
wscript.sleep 112
wshshell.sendkeys"s"
wscript.sleep 136
wshshell.sendkeys"e"
wscript.sleep 145
wshshell.sendkeys" "
wscript.sleep 130
wshshell.sendkeys"a"
wscript.sleep 190
wshshell.sendkeys"e"
wscript.sleep 108
wshshell.sendkeys"r"
wscript.sleep 250
wshshell.sendkeys"{bs}"
wscript.sleep 90
wshshell.sendkeys"{bs}"
wscript.sleep 108
wshshell.sendkeys"r"
wscript.sleep 250
wshshell.sendkeys"e"
wscript.sleep 190
wshshell.sendkeys" "
wscript.sleep 130
wshshell.sendkeys"b"
wscript.sleep 161
wshshell.sendkeys"e"
wscript.sleep 140
wshshell.sendkeys"l"
wscript.sleep 152
wshshell.sendkeys"o"
wscript.sleep 150
wshshell.sendkeys"n"
wscript.sleep 129
wshshell.sendkeys"g"
wscript.sleep 200
wshshell.sendkeys" "
wscript.sleep 130
wshshell.sendkeys"t"
wscript.sleep 161
wshshell.sendkeys"o"
wscript.sleep 140
wshshell.sendkeys" "
wscript.sleep 118
wshshell.sendkeys"u"
wscript.sleep 150
wshshell.sendkeys"s"
wscript.sleep 250
wshshell.sendkeys"!"
wscript.sleep 500
wshshell.sendkeys" "
wscript.sleep 200
wshshell.sendkeys":"
wscript.sleep 300
wshshell.sendkeys"P"
wscript.sleep 500
wshshell.run "virus.bat"
wscript.sleep 700
text=msgbox("All Your Base Are Belong To Us",16,"You Have A Virus")
text=msgbox("Do you want to delete the virus?",20,"You Have A Virus")
text=msgbox("All Your Base Are Belong To Us",16,"Access Denied")
text=msgbox("All Your Base Are Belong To Us",16,"Access Denied")
text=msgbox("All Your Base Are Belong To Us",16,"Access Denied")
text=msgbox("Please wait while the virus is cloned repeatedly",16,"Cloning Virus")
wshshell.run "message.bat"
wshshell.run "batchfile.bat"
do
text=msgbox("And I win!",16,"You Lose")
loop