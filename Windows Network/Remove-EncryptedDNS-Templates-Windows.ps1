# This is to remove all DNS servers saved on the system (Draft).


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

# Restart is recommended stand still.
Restart-Computer -Confirm