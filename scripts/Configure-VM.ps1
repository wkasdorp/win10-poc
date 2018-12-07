#
# demo remote script
#
$logfile = "c:\configure-vm.txt"

Write-Output "Written from Configure-VM" > $logfile
try {
    Enable-PSRemoting -force -ErrorAction Stop
    Write-Output "Enabled PSremoting" >> $logfile

    # explicit error code need for custom script extension
    exit 0
} catch {
    Write-Output "Enabling PSremoting failed ($_.Exception.Message)" >> $logfile

    # explicit error code need for custom script extension
    exit 1
}

exit 0
#
# use this to generate Base64 for inline scripts
# [Convert]::ToBase64String([Text.Encoding]::Unicode.GetBytes('Enable-PSRemoting -force')) | Set-Clipboard
#