$connectTestResult = Test-NetConnection -ComputerName soleam.file.core.windows.net -Port 445
if ($connectTestResult.TcpTestSucceeded) {
    # Save the password so the drive will persist on reboot
    cmd.exe /C "cmdkey /add:`"soleam.file.core.windows.net`" /user:`"localhost\soleam`" /pass:`"KlmRC/5cJul8XCzJAIJLuT3LcKQYQmZIPUpgGqEOqjtVjaIRqJ52vdWVwkUIlhUGHodFbGTBqwbl+AStPzAzYQ==`""
    # Mount the drive
    New-PSDrive -Name Z -PSProvider FileSystem -Root "\\soleam.file.core.windows.net\testsoleam" -Persist
} else {
    Write-Error -Message "Unable to reach the Azure storage account via port 445. Check to make sure your organization or ISP is not blocking port 445, or use Azure P2S VPN, Azure S2S VPN, or Express Route to tunnel SMB traffic over a different port."
}