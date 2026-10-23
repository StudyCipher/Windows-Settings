## Link: https://learn.microsoft.com/en-us/windows-server/networking/windows-time-service/windows-time-service-tools-and-settings?tabs=config
# I discorage to use "w32tm /unregister" & "w32tm /register" may reset your settings in Windows regestry.

## This script is to set up NTP servers databse for Windows.
## Default server in Windows are "time.windows.com" & "time.nist.gov".
## In Windows you can use a pool of servers like "ntp.pool.org", individual servers and ip (Like local NTP server).

## Link: https://github.com/EvotecIT/PSSharedGoods/issues/23
# These are most values that have Windows NTP service:
#'0x01' = 'SpecialInterval'
#'0x02' = 'UseAsFallbackOnly'
#'0x03' = 'SpecialInterval+UseAsFallbackOnly'
#'0x04' = 'SymmetricActive'
#'0x05' = 'SpecialInterval+SymmetricActive'
#'0x06' = 'UseAsFallbackOnly+SymmetricActive'
#'0x07' = 'SpecialInterval+UseAsFallbackOnly+SymmetricActive'
#'0x08' = 'Client'
#'0x09' = 'SpecialInterval+Client'
#'0x0A' = 'UseAsFallbackOnly+Client'
#'0x0B' = 'SpecialInterval+UseAsFallbackOnly+Client'
#'0x0C' = 'SymmetricActive+Client'
#'0x0D' = 'SpecialInterval+SymmetricActive+Client'
#'0x0E' = 'UseAsFallbackOnly+SymmetricActive+Client'
#'0x0F' = 'SpecialInterval+UseAsFallbackOnly+SymmetricActive+Client' 

## Example 1:
# This will flush your DNS cache, if you used IP addresses not fully needed.
ipconfig /flushdns

# This will stop and start Windows Time service.
net stop w32time & net start w32time

# This is going to set up list of NTP servers (In domains).
# LIMIT is 6 servers at the same time.
# This means w32tm /config /manualpeerlist is your NTP servers.
# This means /syncfromflags:manual is for says you made it, not the computer itself.
# This means /reliable:no is related to servers, if you want to set up your own NTP server you should say "yes", otherwise "no".
w32tm /config /manualpeerlist:"timekeeper.webwiz.net,0x9 tick.espanix.net,0x9 tock.espanix.net,0x9 ntp.time.nl,0x9 ntp.netnod.se,0x9 ptbtime1.ptb.de,0x9 ptbtime2.ptb.de,0x9 ptbtime3.ptb.de,0x9" /syncfromflags:manual /reliable:no /update

# This will stop and start Windows Time service.
net stop w32time & net start w32time
# This will sync to your set configuration.
w32tm /resync /force
# It will display Windows Time query (NTP server) status. 
w32tm /query /status
# It will display all Windows Time queries (NTP servers) status. 
w32tm /query /peers

# This updates your settings.
gpupdate.exe /force

# This will flush your DNS cache, if you used IP addresses not fully needed.
ipconfig /flushdns


## Example 2:
# This will flush your DNS cache, if you used IP addresses not fully needed.
ipconfig /flushdns

# This will stop and start Windows Time service.
net stop w32time & net start w32time

# This is going to set up list of NTP servers (In domains).
# LIMIT is 6 servers at the same time.
# This means w32tm /config /manualpeerlist is your NTP servers.
# This means /syncfromflags:manual is for says you made it, not the computer itself.
# This means /reliable:no is related to servers, if you want to set up your own NTP server you should say "yes", otherwise "no".
w32tm /config /manualpeerlist:"time1.google.com,0x9 time2.google.com,0x9 time3.google.com,0x9 time4.google.com,0x9 uklon5-ntp-001.aaplimg.com,0x9 uklon5-ntp-002.aaplimg.com,0x9 ntp1.time.nl,0x9 ntp2.time.nl,0x9 gbg1.ntp.netnod.se,0x9 gbg2.ntp.netnod.se,0x9 lul1.ntp.netnod.se,0x9 lul2.ntp.netnod.se,0x9 mmo1.ntp.netnod.se,0x9 mmo2.ntp.netnod.se,0x9 sth1.ntp.netnod.se,0x9 sth2.ntp.netnod.se,0x9 sth3.ntp.netnod.se,0x9 sth4.ntp.netnod.se,0x9 svl1.ntp.netnod.se,0x9 svl2.ntp.netnod.se,0x9 ptbtime1.ptb.de,0x9 ptbtime2.ptb.de,0x9 ptbtime3.ptb.de,0x9" /syncfromflags:manual /reliable:no /update

# This will stop and start Windows Time service.
net stop w32time & net start w32time
# This will sync to your set configuration.
# To sync Windows Time service:
w32tm /resync
w32tm /resync /rediscover
# To force sync Windows Time service
w32tm /resync /force
# It will display Windows Time query (NTP server) status. 
w32tm /query /status
# It will display all Windows Time queries (NTP servers) status. 
w32tm /query /peers

# This updates your settings.
gpupdate.exe /force

# This will flush your DNS cache, if you used IP addresses not fully needed.
ipconfig /flushdns


## Example 3 (THIS ONE IS RECOMMENED IF YOU DO NOT WNAT TO USE DNS TO FIND THE IP ADDREESS) / (Here I added NTP list servers in ip addresses format):
# This will flush your DNS cache, if you used IP addresses not fully needed.
ipconfig /flushdns

# This will stop and start Windows Time service.
net stop w32time & net start w32time

# This is going to set up list of NTP servers (In ip addreses).
# LIMIT is 6 servers at the same time.
# THESE ARE GOOGLE NTP in IPv4 and IPv6 address do DNS lookup for "time.google.com".
# This means w32tm /config /manualpeerlist is your NTP servers.
# This means /syncfromflags:manual is for says you made it, not the computer itself.
# This means /reliable:no is related to servers, if you want to set up your own NTP server you should say "yes", otherwise "no".
w32tm /config /manualpeerlist:"216.239.35.0,0x9 2001:4860:4806::0,0x9 216.239.35.4,0x9 2001:4860:4806:4::0,0x9 216.239.35.8,0x9 2001:4860:4806:8::0,0x9 216.239.35.12,0x9 2001:4860:4806:c::0,0x9" /syncfromflags:manual /reliable:no /update

# This will stop and start Windows Time service.
net stop w32time & net start w32time
# This will sync to your set configuration.
w32tm /resync /force
# It will display Windows Time query (NTP server) status. 
w32tm /query /status
# It will display all Windows Time queries (NTP servers) status. 
w32tm /query /peers

# This updates your settings.
gpupdate.exe /force

# This will flush your DNS cache, if you used IP addresses not fully needed.
ipconfig /flushdns
