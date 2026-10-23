# This is to remove all DNS servers saved on the system (Draft).
Get-DnsClientDohServerAddress |
    ForEach-Object {
        Remove-DnsClientDohServerAddress -ServerAddress $_.ServerAddress
    }

# This is to flush DNS cache.
ipconfig /flushdns

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
