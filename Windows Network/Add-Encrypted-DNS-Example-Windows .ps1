# Add DNS over HTTPS to Windows sytems on PowerShell command.
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

# Remove DNS over HTTPS to Windows sytems on PowerShell command.
netsh winsock reset

netsh int ip reset

ipconfig /release

ipconfig /renew

ipconfig /flushdns


Get-DnsClientDohServerAddress |
    ForEach-Object {
        Remove-DnsClientDohServerAddress -ServerAddress $_.ServerAddress
    }
