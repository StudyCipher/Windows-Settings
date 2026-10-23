# This will enforce encrypted DNS setting.
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows NT\" -Name DNSClient | Out-Null
New-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows NT\DNSClient\" -Name "DoHPolicy" -Value 3 -PropertyType DWord -Force | Out-Null
Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows NT\DNSClient\" -Name "DoHPolicy" -Value 3 -Type DWord -Force | Out-Null
Get-ItemProperty -Path Registry::"HKLM\SOFTWARE\Policies\Microsoft\Windows NT\DNSClient\" -Name "DoHPolicy"

# It will apply automatic setting to encrypted protocols.
# Possible options: Enabled, Disabled (no), Auto.
netsh dns add global doh=auto
netsh dns add global dot=no

# This is going to apply system policies without need to restart.
gpupdate.exe /force

# This will display current DoH and DoT settings.
netsh dns show global

# Restart is recommended stand still.
Restart-Computer -Confirm
