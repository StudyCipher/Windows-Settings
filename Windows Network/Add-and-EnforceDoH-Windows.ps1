New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows NT\" -Name DNSClient | Out-Null
New-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows NT\DNSClient\" -Name "DoHPolicy" -Value 3 -PropertyType DWord -Force | Out-Null
Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows NT\DNSClient\" -Name "DoHPolicy" -Value 3 -Type DWord -Force | Out-Null
Get-ItemProperty -Path Registry::"HKLM\SOFTWARE\Policies\Microsoft\Windows NT\DNSClient\" -Name "DoHPolicy"
netsh dns add global doh=auto
netsh dns add global dot=auto
gpupdate.exe /force
netsh dns show global