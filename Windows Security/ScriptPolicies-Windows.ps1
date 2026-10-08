Write-Host "This is the link for help https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_execution_policies?view=powershell-7.6"
Write-Host "List Execution current Policies"
Get-ExecutionPolicy -List
Write-Host "Script Policies"
Write-Host "MachinePolicy and UserPolicy only available on Group Policy (GPO)"
Set-ExecutionPolicy -ExecutionPolicy Restricted -Scope MachinePolicy
Set-ExecutionPolicy -ExecutionPolicy Restricted -Scope UserPolicy
Set-ExecutionPolicy -ExecutionPolicy Restricted -Scope Process
Set-ExecutionPolicy -ExecutionPolicy Restricted -Scope CurrentUser
Set-ExecutionPolicy -ExecutionPolicy Restricted -Scope LocalMachine
Write-Host "List Execution current Policies"
Get-ExecutionPolicy -List
Write-Host "Script Policies finished"
Write-Host "You can choose to restart the computer (Recommended)"
Restart-Computer -Confirm