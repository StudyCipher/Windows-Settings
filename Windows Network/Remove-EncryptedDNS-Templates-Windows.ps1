# Removes DoH servers with ip addresses from Windows.
# Here I am using Cloudfalre DNS as exmaple.
Remove-DnsClientDohServerAddress -ServerAddress
1.1.1.1,1.0.0.1,2606:4700:4700::1111,2606:4700:4700::1001

# This is to flush DNS cache.
ipconfig /flushdns

# This is going to apply system policies without need to restart.
gpupdate.exe /force


## This is to remove all DNS servers saved on the system (Draft).
Get-DnsClientDohServerAddress |
    ForEach-Object {
        Remove-DnsClientDohServerAddress -ServerAddress $_.ServerAddress
    }

# This is to flush DNS cache.
ipconfig /flushdns

# This is going to apply system policies without need to restart.
gpupdate.exe /force


## This remove all LAN and VLAN profiles (Fully check this before changing anything).
# Link: https://www.trishtech.com/2020/12/how-to-remove-all-network-profiles-from-windows-10/.
netsh lan delete profile name=*
netsh wlan delete profile name=*

# This is going to apply system policies without need to restart.
gpupdate.exe /force

# This is to flush DNS cache.
ipconfig /flushdns

# This shows if any encrypted DNS template still there.
Get-DNSClientDohServerAddress | Sort-Object -Property DohTemplate

# Restart is recommended stand still.
Restart-Computer -Confirm
