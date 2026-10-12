# This will display current Execution policies.
# This is the link for help https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_execution_policies?view=powershell-7.6
Get-ExecutionPolicy -List

# This is going to apply "Restricted" to these policies.
Set-ExecutionPolicy -ExecutionPolicy Restricted -Scope MachinePolicy
Set-ExecutionPolicy -ExecutionPolicy Restricted -Scope UserPolicy
Set-ExecutionPolicy -ExecutionPolicy Restricted -Scope Process
Set-ExecutionPolicy -ExecutionPolicy Restricted -Scope CurrentUser
Set-ExecutionPolicy -ExecutionPolicy Restricted -Scope LocalMachine

# This will display current Execution policies.
Get-ExecutionPolicy -List

# This will apply settings without need to restart.
gpupdate.exe /force

# Restart is recommended stand still.
Restart-Computer -Confirm