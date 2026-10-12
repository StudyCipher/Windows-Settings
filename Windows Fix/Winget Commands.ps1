# List Winget programs:
winget list

# Update all Winget programs:
winget upgrade --all

# Update all Winget programs (Some dependencies too):
winget upgrade --all --include-unknown

# Update & Remove some Winget programs (Draft):
#winget upgrade --uninstall-previous

# Remove some Winget programs:
winget --uninstall-previous

# Examples to remove, add programs by name, ID, versions:
# Remove from Winget the XBOX Game app: 
winget uninstall "Game Speech Window"

# Remove from Winget the Microsoft VC from 2010:
winget install --id Microsoft.VCRedist.2010.x86

# Remove some Winget Microsoft Visual C++ Redistributable from 2010 (Draft):
#winget upgrade --id  Microsoft.VCRedist.2010.x64 --uninstall-previous

# Update from Winget the PowerToys app to certain version:
winget upgrade powertoys --version 0.15.2

# Update from Winget the Microsoft Visual C++ Redistributable from 2010 to certain version:
winget upgrade --id Microsoft.VCRedist.2010.x86 --version 10.0.40219

# Update from Winget the Discord app:
winget upgrade --id Discord.Discord

# Remove from Winget the Microsoft Edge and Teams dependency (May not work):
winget uninstall --id  Microsoft.EdgeWebView2Runtime

# Remove from Winget the Microsoft Visual C++ Redistributable from 2010 certain version:
winget uninstall Microsoft Visual C++ 2010  x64 Redistributable --version 10.0.30319