Get-DnsClientDohServerAddress |
    ForEach-Object {
        Remove-DnsClientDohServerAddress -ServerAddress $_.ServerAddress
    }
