Write-Host "The Powershell script will create, change and check DoH is enforcing encrypted DNS."
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows NT\" -Name DNSClient | Out-Null
New-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows NT\DNSClient\" -Name "DoHPolicy" -Value 3 -PropertyType DWord -Force | Out-Null
Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows NT\DNSClient\" -Name "DoHPolicy" -Value 3 -Type DWord -Force | Out-Null
Get-ItemProperty -Path Registry::"HKLM\SOFTWARE\Policies\Microsoft\Windows NT\DNSClient\" -Name "DoHPolicy"
Write-Host "Second part is enabaling DoH and DoT in auto mode."
Write-Host "What does mean auto mode? Is about adding encrypyed DNS templates, you can just write the ip addresses in network settings and it should automatically making encrypyed DNS applies."
netsh dns add global doh=auto
netsh dns add global dot=auto
gpupdate.exe /force
netsh dns show global