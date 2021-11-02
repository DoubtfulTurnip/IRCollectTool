Write-Host "Installing Tools..."
Sleep 1
Write-Host ""
Write-Host ""
Write-Host "Installing Kansa..."
Sleep 1
Write-Host ""
Write-Host ""
Git clone https://github.com/davehull/Kansa.git ./Kansa/
Write-Host ""
Write-Host ""

Write-Host "Installing DeepBlueCLI..."
Sleep 1
Write-Host ""
Write-Host ""
Git clone https://github.com/sans-blue-team/DeepBlueCLI.git ./DeepBluCLI/
Write-Host ""
Write-Host ""
Write-Host "Installing WinPmem..."
sleep 1
Write-Host ""
Write-Host ""
New-Item -Path ./Winpmem -ItemType directory -Force
Invoke-WebRequest https://github.com/Velocidex/WinPmem/releases/download/v4.0.rc1/winpmem_mini_x64_rc2.exe -OutFile "./Winpmem/winpmemx64.exe"
Invoke-WebRequest https://github.com/Velocidex/WinPmem/releases/download/v4.0.rc1/winpmem_mini_x86.exe -OutFile "./Winpmem/winpmemx86.exe"
Write-Host ""
Write-Host ""
Write-Host "Installation Complete"
Write-Host ""
Write-Host ""
Write-Host "In order to install KAPE you will have to download and add this manually"
Write-Host ""
Write-Host ""
Write-Host ""
Write-Host "https://www.kroll.com/en/services/cyber-risk/incident-response-litigation-support/kroll-artifact-parser-extractor-kape"
Write-Host ""
Write-Host ""
Write-Host ""
Read-Host "Press any key to exit"
