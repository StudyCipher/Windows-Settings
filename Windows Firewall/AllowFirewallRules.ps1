# Function to create the firewall rule and save IP addresses
function New-NTPFirewallRule {
    param (
        [string]$Domain
    )

    # Define the output file path
    $outputFile = "C:\SCRIPTS\IPs\$Domain-IPs.txt"
    
    # Ensure the output directory exists
    if (-not (Test-Path "C:\IP")) {
        New-Item -Path "C:\IP" -ItemType Directory
    }

    # Resolve the domain to IPv4 and IPv6 addresses
    $ipv4Addresses = [System.Net.Dns]::GetHostAddresses($Domain) | Where-Object { $_.AddressFamily -eq 'InterNetwork' }
    $ipv6Addresses = [System.Net.Dns]::GetHostAddresses($Domain) | Where-Object { $_.AddressFamily -eq 'InterNetworkV6' }

    # Create Inbound and Outbound Rules for IPv4
    foreach ($ipv4 in $ipv4Addresses) {
        # Create Inbound Rule for IPv4
        New-NetFirewallRule -DisplayName "NTP - IPv4 - ($Domain) $ipv4" -Direction Inbound -Protocol UDP -LocalPort 123 -RemotePort 123 -RemoteAddress $ipv4.ToString() -Action Allow -Profile Public

        # Create Outbound Rule for IPv4
        New-NetFirewallRule -DisplayName "NTP - IPv4 - ($Domain) $ipv4" -Direction Outbound -Protocol UDP -LocalPort 123 -RemotePort 123 -RemoteAddress $ipv4.ToString() -Action Allow -Profile Public

        # Add IPv4 to the output file
        $ipv4.ToString() | Out-File -FilePath $outputFile -Append -Encoding UTF8
    }

    # Create Inbound and Outbound Rules for IPv6
    foreach ($ipv6 in $ipv6Addresses) {
        # Create Inbound Rule for IPv6
        New-NetFirewallRule -DisplayName "NTP - IPv6 - ($Domain) $ipv6" -Direction Inbound -Protocol UDP -LocalPort 123 -RemotePort 123 -RemoteAddress $ipv6.ToString() -Action Allow -Profile Public

        # Create Outbound Rule for IPv6
        New-NetFirewallRule -DisplayName "NTP - IPv6 - ($Domain) $ipv6" -Direction Outbound -Protocol UDP -LocalPort 123 -RemotePort 123 -RemoteAddress $ipv6.ToString() -Action Allow -Profile Public

        # Add IPv6 to the output file
        $ipv6.ToString() | Out-File -FilePath $outputFile -Append -Encoding UTF8
    }

    Write-Host "IP addresses for $Domain have been saved to $outputFile"
}

# List of domains
$domains = @('pool.ntp.org')

# Create the rules for each domain and save IPs
foreach ($domain in $domains) {
    New-NTPFirewallRule -Domain $domain
}

Write-Host "Firewall rules have been created for the domains, and IP addresses have been saved."
