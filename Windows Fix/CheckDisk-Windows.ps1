Write-Host "This script is beginning. Disk from A to C, can prompt to schedule a restart"
chkdsk a: /f /r /x
chkdsk b: /f /r /x
chkdsk c: /f /r /x
chkdsk d: /f /r /x
chkdsk e: /f /r /x
chkdsk f: /f /r /x
chkdsk g: /f /r /x
chkdsk h: /f /r /x
chkdsk i: /f /r /x
chkdsk j: /f /r /x
chkdsk k: /f /r /x
chkdsk l: /f /r /x
chkdsk m: /f /r /x
chkdsk n: /f /r /x
chkdsk o: /f /r /x
chkdsk p: /f /r /x
chkdsk q: /f /r /x
chkdsk r: /f /r /x
chkdsk s: /f /r /x
chkdsk t: /f /r /x
chkdsk u: /f /r /x
chkdsk v: /f /r /x
chkdsk w: /f /r /x
chkdsk x: /f /r /x
chkdsk y: /f /r /x
chkdsk z: /f /r /x
Write-Host "This script finished, you need to restart device to confirm disk repair"
Write-Host "You can choose to restart the computer (Recommended)"
Restart-Computer -Confirm