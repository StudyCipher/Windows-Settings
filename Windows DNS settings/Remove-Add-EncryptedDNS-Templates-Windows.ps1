Write-Host "This delete all your DNS then adds well know encrypted DNS to your Windows system."

# Google DNS (US, available in most countries):
Add-DnsClientDohServerAddress -ServerAddress "8.8.8.8" -DohTemplate "https://dns.google/dns-query" -AutoUpgrade $true -AllowFallbackToUdp $false
Add-DnsClientDohServerAddress -ServerAddress "8.8.4.4" -DohTemplate "https://dns.google/dns-query" -AutoUpgrade $true -AllowFallbackToUdp $false
Add-DnsClientDohServerAddress -ServerAddress "2001:4860:4860::88881" -DohTemplate "https://dns.google/dns-query" -AutoUpgrade $true -AllowFallbackToUdp $false
Add-DnsClientDohServerAddress -ServerAddress "2001:4860:4860::8844" -DohTemplate "https://dns.google/dns-query" -AutoUpgrade $true -AllowFallbackToUdp $false

# Cloudflare DNS (US, available in most countries):
Add-DnsClientDohServerAddress -ServerAddress "1.1.1.1" -DohTemplate "https://cloudflare-dns.com/dns-query" -AutoUpgrade $true -AllowFallbackToUdp $false
Add-DnsClientDohServerAddress -ServerAddress "1.0.0.1" -DohTemplate "https://cloudflare-dns.com/dns-query" -AutoUpgrade $true -AllowFallbackToUdp $false
Add-DnsClientDohServerAddress -ServerAddress "2606:4700:4700::1111" -DohTemplate "https://cloudflare-dns.com/dns-query" -AutoUpgrade $true -AllowFallbackToUdp $false
Add-DnsClientDohServerAddress -ServerAddress "2606:4700:4700::1001" -DohTemplate "https://cloudflare-dns.com/dns-query" -AutoUpgrade $true -AllowFallbackToUdp $false

Add-DnsClientDohServerAddress -ServerAddress "1.1.1.2" -DohTemplate "https://security.cloudflare-dns.com/dns-query" -AutoUpgrade $true -AllowFallbackToUdp $false
Add-DnsClientDohServerAddress -ServerAddress "1.0.0.2" -DohTemplate "https://security.cloudflare-dns.com/dns-query" -AutoUpgrade $true -AllowFallbackToUdp $false
Add-DnsClientDohServerAddress -ServerAddress "2606:4700:4700::1112" -DohTemplate "https://security.cloudflare-dns.com/dns-query" -AutoUpgrade $true -AllowFallbackToUdp $false
Add-DnsClientDohServerAddress -ServerAddress "2606:4700:4700::1002" -DohTemplate "https://security.cloudflare-dns.com/dns-query" -AutoUpgrade $true -AllowFallbackToUdp $false

Add-DnsClientDohServerAddress -ServerAddress "1.1.1.3" -DohTemplate "https://family.cloudflare-dns.com/dns-query" -AutoUpgrade $true -AllowFallbackToUdp $false
Add-DnsClientDohServerAddress -ServerAddress "1.0.0.3" -DohTemplate "https://family.cloudflare-dns.com/dns-query" -AutoUpgrade $true -AllowFallbackToUdp $false
Add-DnsClientDohServerAddress -ServerAddress "2606:4700:4700::1113" -DohTemplate "https://family.cloudflare-dns.com/dns-query" -AutoUpgrade $true -AllowFallbackToUdp $false
Add-DnsClientDohServerAddress -ServerAddress "2606:4700:4700::1003" -DohTemplate "https://family.cloudflare-dns.com/dns-query" -AutoUpgrade $true -AllowFallbackToUdp $false

# Quad9 DNS (Swiss made by London Metropolitan Police, available in most countries):
Add-DnsClientDohServerAddress -ServerAddress "9.9.9.9" -DohTemplate "https://dns.quad9.net/dns-query" -AutoUpgrade $true -AllowFallbackToUdp $false
Add-DnsClientDohServerAddress -ServerAddress "149.112.112.112" -DohTemplate "https://dns.quad9.net/dns-query" -AutoUpgrade $true -AllowFallbackToUdp $false
Add-DnsClientDohServerAddress -ServerAddress "2620:fe::fe" -DohTemplate "https://dns.quad9.net/dns-query" -AutoUpgrade $true -AllowFallbackToUdp $false
Add-DnsClientDohServerAddress -ServerAddress "2620:fe::9" -DohTemplate "https://dns.quad9.net/dns-query" -AutoUpgrade $true -AllowFallbackToUdp $false

Add-DnsClientDohServerAddress -ServerAddress "9.9.9.11" -DohTemplate "https://dns11.quad9.net/dns-query" -AutoUpgrade $true -AllowFallbackToUdp $false
Add-DnsClientDohServerAddress -ServerAddress "149.112.112.11" -DohTemplate "https://dns11.quad9.net/dns-query" -AutoUpgrade $true -AllowFallbackToUdp $false
Add-DnsClientDohServerAddress -ServerAddress "2620:fe::11" -DohTemplate "https://dns11.quad9.net/dns-query" -AutoUpgrade $true -AllowFallbackToUdp $false
Add-DnsClientDohServerAddress -ServerAddress "2620:fe::fe:11" -DohTemplate "https://dns11.quad9.net/dns-query" -AutoUpgrade $true -AllowFallbackToUdp $false

# ControlD DNS (Canadian, available in most countries):
Add-DnsClientDohServerAddress -ServerAddress "76.76.2.2" -DohTemplate "https://freedns.controld.com/p2" -AutoUpgrade $true -AllowFallbackToUdp $false
Add-DnsClientDohServerAddress -ServerAddress "76.76.10.2" -DohTemplate "https://freedns.controld.com/p2" -AutoUpgrade $true -AllowFallbackToUdp $false
Add-DnsClientDohServerAddress -ServerAddress "2606:1a40::2" -DohTemplate "https://freedns.controld.com/p2" -AutoUpgrade $true -AllowFallbackToUdp $false
Add-DnsClientDohServerAddress -ServerAddress "2606:1a40:1::2" -DohTemplate "https://freedns.controld.com/p2" -AutoUpgrade $true -AllowFallbackToUdp $false

Add-DnsClientDohServerAddress -ServerAddress "76.76.2.4" -DohTemplate "https://freedns.controld.com/family" -AutoUpgrade $true -AllowFallbackToUdp $false
Add-DnsClientDohServerAddress -ServerAddress "76.76.10.4" -DohTemplate "https://freedns.controld.com/family" -AutoUpgrade $true -AllowFallbackToUdp $false
Add-DnsClientDohServerAddress -ServerAddress "2606:1a40::4" -DohTemplate "https://freedns.controld.com/family" -AutoUpgrade $true -AllowFallbackToUdp $false
Add-DnsClientDohServerAddress -ServerAddress "2606:1a40:1::4" -DohTemplate "https://freedns.controld.com/family" -AutoUpgrade $true -AllowFallbackToUdp $false

# dns.forge.de DNS (Servers only in Germany):
Add-DnsClientDohServerAddress -ServerAddress "49.12.67.122" -DohTemplate "https://dnsforge.de/dns-query" -AutoUpgrade $true -AllowFallbackToUdp $false
Add-DnsClientDohServerAddress -ServerAddress "91.99.154.175" -DohTemplate "https://dnsforge.de/dns-query" -AutoUpgrade $true -AllowFallbackToUdp $false
Add-DnsClientDohServerAddress -ServerAddress "176.9.93.198" -DohTemplate "https://dnsforge.de/dns-query" -AutoUpgrade $true -AllowFallbackToUdp $false
Add-DnsClientDohServerAddress -ServerAddress "176.9.1.117" -DohTemplate "https://dnsforge.de/dns-query" -AutoUpgrade $true -AllowFallbackToUdp $false
Add-DnsClientDohServerAddress -ServerAddress "2a01:4f8:c013:29d::122" -DohTemplate "https://dnsforge.de/dns-query" -AutoUpgrade $true -AllowFallbackToUdp $false
Add-DnsClientDohServerAddress -ServerAddress "2a01:4f8:c010:8c35::175" -DohTemplate "https://dnsforge.de/dns-query" -AutoUpgrade $true -AllowFallbackToUdp $false
Add-DnsClientDohServerAddress -ServerAddress "2a01:4f8:151:34aa::198" -DohTemplate "https://dnsforge.de/dns-query" -AutoUpgrade $true -AllowFallbackToUdp $false
Add-DnsClientDohServerAddress -ServerAddress "2a01:4f8:141:316d::117" -DohTemplate "https://dnsforge.de/dns-query" -AutoUpgrade $true -AllowFallbackToUdp $false

Add-DnsClientDohServerAddress -ServerAddress "49.12.223.2" -DohTemplate "https://clean.dnsforge.de/dns-query" -AutoUpgrade $true -AllowFallbackToUdp $false
Add-DnsClientDohServerAddress -ServerAddress "49.12.43.208" -DohTemplate "https://clean.dnsforge.de/dns-query" -AutoUpgrade $true -AllowFallbackToUdp $false
Add-DnsClientDohServerAddress -ServerAddress "2a01:4f8:c17:4fbc::2" -DohTemplate "https://clean.dnsforge.de/dns-query" -AutoUpgrade $true -AllowFallbackToUdp $false
Add-DnsClientDohServerAddress -ServerAddress "2a01:4f8:c012:ed89::208" -DohTemplate "https://clean.dnsforge.de/dns-query" -AutoUpgrade $true -AllowFallbackToUdp $false

Add-DnsClientDohServerAddress -ServerAddress "49.12.222.213" -DohTemplate "https://hard.dnsforge.de/dns-query" -AutoUpgrade $true -AllowFallbackToUdp $false
Add-DnsClientDohServerAddress -ServerAddress "88.198.122.154" -DohTemplate "https://hard.dnsforge.de/dns-query" -AutoUpgrade $true -AllowFallbackToUdp $false
Add-DnsClientDohServerAddress -ServerAddress "2a01:4f8:c17:2c61::213" -DohTemplate "https://hard.dnsforge.de/dns-query" -AutoUpgrade $true -AllowFallbackToUdp $false
Add-DnsClientDohServerAddress -ServerAddress "2a01:4f8:c013:5ec0::154" -DohTemplate "https://hard.dnsforge.de/dns-query" -AutoUpgrade $true -AllowFallbackToUdp $false

# Xdp.es DNS (Servers only in Spain):
Add-DnsClientDohServerAddress -ServerAddress "85.208.114.51" -DohTemplate "https://dns.xdp.es/dns-query" -AutoUpgrade $true -AllowFallbackToUdp $false
Add-DnsClientDohServerAddress -ServerAddress "51.170.52.10" -DohTemplate "https://dns.xdp.es/dns-query" -AutoUpgrade $true -AllowFallbackToUdp $false
Add-DnsClientDohServerAddress -ServerAddress "2a0e:97c0:c40::51" -DohTemplate "https://dns.xdp.es/dns-query" -AutoUpgrade $true -AllowFallbackToUdp $false
Add-DnsClientDohServerAddress -ServerAddress "2603:c027:8703:d400::10" -DohTemplate "https://dns.xdp.es/dns-query" -AutoUpgrade $true -AllowFallbackToUdp $false

Add-DnsClientDohServerAddress -ServerAddress "85.208.114.52" -DohTemplate "https://lite.xdp.es/dns-query" -AutoUpgrade $true -AllowFallbackToUdp $false
Add-DnsClientDohServerAddress -ServerAddress "51.170.54.40" -DohTemplate "https://lite.xdp.es/dns-query" -AutoUpgrade $true -AllowFallbackToUdp $false
Add-DnsClientDohServerAddress -ServerAddress "2a0e:97c0:c40::52" -DohTemplate "https://lite.xdp.es/dns-query" -AutoUpgrade $true -AllowFallbackToUdp $false
Add-DnsClientDohServerAddress -ServerAddress "2603:c027:8703:d400::40" -DohTemplate "https://lite.xdp.es/dns-query" -AutoUpgrade $true -AllowFallbackToUdp $false
gpupdate.exe /force