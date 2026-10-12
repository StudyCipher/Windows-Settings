# This is used to update the Windows system, if you want to reset Windows, it will do it from the most updated version.
# Example you installed 24H2, it will update the ISO sytem to 25H2 or 26H2 depending computer.
DISM /Online /Cleanup-Image /AnalyzeComponentStore
DISM /Online /Cleanup-Image /StartComponentStore
DISM /Online /Cleanup-Image /CheckHealth
DISM /Online /Cleanup-Image /ScanHealth
DISM /Online /Cleanup-Image /RestoreHealth

# Is recommended to "run sfc/scannow" after restart device.
Restart-Computer -Confirm