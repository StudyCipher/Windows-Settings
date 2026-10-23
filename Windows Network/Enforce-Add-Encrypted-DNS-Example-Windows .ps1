# This will enforce encrypted DNS setting.
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows NT\" -Name DNSClient | Out-Null
New-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows NT\DNSClient\" -Name "DoHPolicy" -Value 3 -PropertyType DWord -Force | Out-Null
Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows NT\DNSClient\" -Name "DoHPolicy" -Value 3 -Type DWord -Force | Out-Null
Get-ItemProperty -Path Registry::"HKLM\SOFTWARE\Policies\Microsoft\Windows NT\DNSClient\" -Name "DoHPolicy"

# It will apply automatic setting to encrypted protocols.
# Possible options: Enabled, Disabled (no), Auto.
netsh dns add global doh=auto
netsh dns add global dot=no

# Shows DNS over HTTPS and DNS over TLS settings.
netsh dns show global


## Example 1:
# Add DNS over HTTPS to Windows sytems on PowerShell command.
# Here I am using Cloudflare DNS as example.
Add-DnsClientDohServerAddress -ServerAddress '1.1.1.3' -DohTemplate 'https://family.cloudflare-dns.com/dns-query' -AllowFallbackToUdp $False -AutoUpgrade $True
Add-DnsClientDohServerAddress -ServerAddress '1.0.0.3' -DohTemplate 'https://family.cloudflare-dns.com/dns-query' -AllowFallbackToUdp $False -AutoUpgrade $True
Add-DnsClientDohServerAddress -ServerAddress '2606:4700:4700::1113' -DohTemplate 'https://family.cloudflare-dns.com/dns-query' -AllowFallbackToUdp $False -AutoUpgrade $True
Add-DnsClientDohServerAddress -ServerAddress '2606:4700:4700::1003' -DohTemplate 'https://family.cloudflare-dns.com/dns-query' -AllowFallbackToUdp $False -AutoUpgrade $True

$i = Get-NetAdapter -Physical
$i | ForEach-Object {
    Set-DnsClientServerAddress -InterfaceAlias "$($_.InterfaceAlias)" -ServerAddresses "1.1.1.3","1.0.0.3"

    Set-DnsClientServerAddress -InterfaceAlias "$($_.InterfaceAlias)" -ServerAddresses "2606:4700:4700::1113","2606:4700:4700::1003"

    $s1 = 'HKLM:System\CurrentControlSet\Services\Dnscache\InterfaceSpecificParameters\' + $_.InterfaceGuid + '\DohInterfaceSettings\Doh\1.1.1.3'; New-Item -Path $s1 -Force | New-ItemProperty -Name "DohFlags" -Value 1 -PropertyType QWORD

    $s2 = 'HKLM:System\CurrentControlSet\Services\Dnscache\InterfaceSpecificParameters\' + $_.InterfaceGuid + '\DohInterfaceSettings\Doh\1.0.0.3'; New-Item -Path $s2 -Force  | New-ItemProperty -Name "DohFlags" -Value 1 -PropertyType QWORD

    $s3 = 'HKLM:System\CurrentControlSet\Services\Dnscache\InterfaceSpecificParameters\' + $_.InterfaceGuid + '\DohInterfaceSettings\Doh6\2606:4700:4700::1113'; New-Item -Path $s3 -Force | New-ItemProperty -Name "DohFlags" -Value 1 -PropertyType QWORD

    $s4 = 'HKLM:System\CurrentControlSet\Services\Dnscache\InterfaceSpecificParameters\' + $_.InterfaceGuid + '\DohInterfaceSettings\Doh6\2606:4700:4700::1003'; New-Item -Path $s4 -Force  | New-ItemProperty -Name "DohFlags" -Value 1 -PropertyType QWORD
}
ipconfig /flushdns
Clear-DnsClientCache

# Display all encrypted DNS templates from the sytem.
Get-DNSClientDohServerAddress | Sort-Object -Property DohTemplate


## Example 2:
# Add DNS over HTTPS to Windows sytems on PowerShell command.
# Here I am using Mullvad DNS as example.
Add-DnsClientDohServerAddress -ServerAddress '194.242.2.9' -DohTemplate 'https://family.cloudflare-dns.com/dns-query' -AllowFallbackToUdp $False -AutoUpgrade $True
Add-DnsClientDohServerAddress -ServerAddress '2a07:e340::9' -DohTemplate 'https://family.cloudflare-dns.com/dns-query' -AllowFallbackToUdp $False -AutoUpgrade $True

$i = Get-NetAdapter -Physical
$i | ForEach-Object {
    Set-DnsClientServerAddress -InterfaceAlias "$($_.InterfaceAlias)" -ServerAddresses "194.242.2.9"

    Set-DnsClientServerAddress -InterfaceAlias "$($_.InterfaceAlias)" -ServerAddresses "2a07:e340::9"

    $s1 = 'HKLM:System\CurrentControlSet\Services\Dnscache\InterfaceSpecificParameters\' + $_.InterfaceGuid + '\DohInterfaceSettings\Doh\194.242.2.9'; New-Item -Path $s1 -Force | New-ItemProperty -Name "DohFlags" -Value 1 -PropertyType QWORD

    $s2 = 'HKLM:System\CurrentControlSet\Services\Dnscache\InterfaceSpecificParameters\' + $_.InterfaceGuid + '\DohInterfaceSettings\Doh6\2a07:e340::9'; New-Item -Path $s3 -Force | New-ItemProperty -Name "DohFlags" -Value 1 -PropertyType QWORD

}
ipconfig /flushdns
Clear-DnsClientCache

# Display all encrypted DNS templates from the sytem.
Get-DNSClientDohServerAddress | Sort-Object -Property DohTemplate
