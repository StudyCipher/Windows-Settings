Write-Host "This script is beginning. This update the sytem ISO and Windows Store components"
DISM /Online /Cleanup-Image /AnalyzeComponentStore
DISM /Online /Cleanup-Image /StartComponentStore
DISM /Online /Cleanup-Image /CheckHealth
DISM /Online /Cleanup-Image /ScanHealth
DISM /Online /Cleanup-Image /RestoreHealth
Write-Host "This script finished, you need to restart device then run sfc scannow"
Write-Host "You can choose to restart the computer (Recommended)"
Restart-Computer -Confirm