#
# demo remote script
#
$logfile = "c:\configure-vm.txt"

Write-Output "Written from Configure-VM" > $logfile
try {
    Enable-PSRemoting -force -ErrorAction Stop
    Write-Output "Enabled PSremoting" >> $logfile
} catch {
    Write-Output "Enabling PSremoting failed ($_.Exception.Message)" >> $logfile
}


#
# use this to generate Base64 for inline scripts
# [Convert]::ToBase64String([Text.Encoding]::Unicode.GetBytes('Enable-PSRemoting -force')) | Set-Clipboard
#