# Option 1:
# Basic one:
ipconfig /flushdns

net stop w32time & net start w32time
w32tm /config /manualpeerlist:"timekeeper.webwiz.net,0x9 tick.espanix.net,0x9 tock.espanix.net,0x9 ntp.time.nl,0x9 ntp.netnod.se,0x9 ptbtime1.ptb.de,0x9 ptbtime2.ptb.de,0x9 ptbtime3.ptb.de,0x9" /syncfromflags:manual /reliable:no /update

net stop w32time & net start w32time

w32tm /resync /force
w32tm /query /status
w32tm /query /peers

ipconfig /flushdns

# Option 2:
# Advanced one:
ipconfig /flushdns

w32tm /config /manualpeerlist:"time1.google.com,0x9 time2.google.com,0x9 time3.google.com,0x9 time4.google.com,0x9 uklon5-ntp-001.aaplimg.com,0x9 uklon5-ntp-002.aaplimg.com,0x9 ntp1.time.nl,0x9 ntp2.time.nl,0x9 gbg1.ntp.netnod.se,0x9 gbg2.ntp.netnod.se,0x9 lul1.ntp.netnod.se,0x9 lul2.ntp.netnod.se,0x9 mmo1.ntp.netnod.se,0x9 mmo2.ntp.netnod.se,0x9 sth1.ntp.netnod.se,0x9 sth2.ntp.netnod.se,0x9 sth3.ntp.netnod.se,0x9 sth4.ntp.netnod.se,0x9 svl1.ntp.netnod.se,0x9 svl2.ntp.netnod.se,0x9 ptbtime1.ptb.de,0x9 ptbtime2.ptb.de,0x9 ptbtime3.ptb.de,0x9" /syncfromflags:manual /reliable:no /update

net stop w32time & net start w32time

w32tm /resync /force
w32tm /query /status
w32tm /query /peers

ipconfig /flushdns