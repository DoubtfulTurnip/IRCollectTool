### All-Tools ###


function Start-All-Tools-Local {
$drive = Read-Host "Enter Drive For Kape Collection (e.g C:)..."
$results = "./Results/$env:COMPUTERNAME/"
New-Item -Path $results/ -ItemType directory -Force
New-Item -Path $results/kape-results -ItemType directory -Force
New-Item -Path $results/kansa-results -ItemType directory -Force
New-Item -Path $results/deepbluecli-results -ItemType directory -Force
New-Item -Path $results/winpmem-image -ItemType directory -Force
Write-Output ""
Write-Output "Starting Kape..."
Write-Output ""
Start-Sleep 2
Write-Output ""
.\Kape\kape.exe --tsource $drive --tdest $results/kape-results/Target/ --tflush --target !SANS_Triage --msource $drive --mdest $results/kape-results/Module/ --mflush --module Get-InjectedThread
Write-Output ""
Start-Sleep 2
Write-Output ""
Write-Output "Starting Kansa..."
Start-Sleep 2
Write-Output ""
.\Kansa\kansa.ps1 -Target $env:COMPUTERNAME -ModulePath .\Kansa\Modules -Pushbin -Rmbin -Verbose 
Move-Item .\Output* $results/kansa-results/
Write-Output ""
Write-Output "Starting DeepBlueCLI..."
Set-Location .\DeepBlueCLI\
.\DeepBlue.ps1 | ConvertTo-Csv | Out-File ../$results/deepbluecli-results/Export.csv
Set-Location ..\
Write-Output ""
Write-Output "Starting Winpmem..."
.\Winpmem\winpmemx64.exe -1 $results/winpmem-image/image.raw
}
function Start-All-Tools-Network {
Write-Output ""
Write-Output ""
$drive = Read-Host "Enter Drive For Kape Collection (e.g C:)..."
$results = Read-Host "Enter path to file share (e.g \\server\folder)"
New-PSDrive -Name "results" -PSProvider "FileSystem" -Root $results
New-Item -Path $results/$env:COMPUTERNAME/ -ItemType directory -Force
New-Item -Path $results/$env:COMPUTERNAME/kape-results -ItemType directory -Force
New-Item -Path $results/$env:COMPUTERNAME/kansa-results -ItemType directory -Force
New-Item -Path $results/$env:COMPUTERNAME/deepbluecli-results -ItemType directory -Force
New-Item -Path $results/$env:COMPUTERNAME/winpmem-image -ItemType directory -Force
Write-Output ""
Write-Output "Starting Kape..."
Write-Output ""
Start-Sleep 2
Write-Output ""
.\Kape\kape.exe --tsource $drive --tdest $results/$env:COMPUTERNAME/kape-results/Target/ --tflush --target !SANS_Triage --msource $drive --mdest $results/kape-results/Module/ --mflush --module Get-InjectedThread
Write-Output ""
Start-Sleep 2
Write-Output ""
Write-Output "Starting Kansa..."
Start-Sleep 2
Write-Output ""
.\Kansa\kansa.ps1 -Target $env:COMPUTERNAME -ModulePath .\Kansa\Modules -Pushbin -Rmbin -Verbose 
Move-Item .\Output* $results/$env:COMPUTERNAME/kansa-results/
Write-Output ""
Write-Output "Starting DeepBlueCLI..."
Set-Location .\DeepBlueCLI\
.\DeepBlue.ps1 | ConvertTo-Csv | Out-File $results/$env:COMPUTERNAME/deepbluecli-results/Export.csv
Set-Location ../
Write-Output ""
Write-Output "Starting Winpmem..."
.\Winpmem\winpmemx64.exe -1 $results/$env:COMPUTERNAME/winpmem-image/image.raw
}


function Invoke-All-Tools {
function Show-All-ToolsMenu {

    param (
        [string]$Title = "All Tools Menu"
          )
    Clear   
    Write-Host ""
    Write-Host "============ $Title ==========="
    Write-Host ""
    Write-Host "1: Press '1' Save Results Locally"
    Write-Host "2: Press '2' Save Results To Network"
    Write-Host ""
    Write-Host "============================================"
    Write-Host ""
    Write-Host "B: Press 'B' To Go To Main Menu" -Foregroundcolor Red -Backgroundcolor White
    Write-Host ""
        }
    
    do 
            {
        Show-All-ToolsMenu
        $selection = Read-Host "Please make a selection"
        switch ($selection)
        {
        
        '1' {
        Start-All-Tools-Local
        }
    
        '2' {
        Start-All-Tools-Network
        }
        'B' {
        Show-MainMenu
        }
        }
        }
    until ($selection -eq 'B')
    }

### KAPE ###


function Start-KAPE-Local {
$drive = Read-Host "Enter Drive For Kape Collection (e.g C:)..."
$results = "./Results/$env:COMPUTERNAME/"
New-Item -Path $results/ -ItemType directory -Force
New-Item -Path $results/kape-results -ItemType directory -Force
.\Kape\kape.exe --tsource $drive --tdest $results/kape-results/Target/ --tflush --target !SANS_Triage --msource $drive --mdest $results/kape-results/Module/ --mflush --module Get-InjectedThread
}
function Start-KAPE-Network {
$drive = Read-Host "Enter Drive For Kape Collection (e.g C:)..."
$results = Read-Host "Enter path to file share (e.g \\server\folder)"
New-PSDrive -Name "results" -PSProvider "FileSystem" -Root $results
New-Item -Path $results/ -ItemType directory -Force
New-Item -Path $results/kape-results -ItemType directory -Force
.\Kape\kape.exe --tsource $drive --tdest $results/$env:COMPUTERNAME/kape-results/Target/ --tflush --target !SANS_Triage --msource $drive --mdest $results/kape-results/Module/ --mflush --module Get-InjectedThread
}


function Invoke-KAPE {
function Show-KAPEMenu {

    param (
        [string]$Title = "KAPE Menu"
          )
    Clear   
    Write-Host ""
    Write-Host "============ $Title ==========="
    Write-Host ""
    Write-Host "1: Press '1' Save Results Locally"
    Write-Host "2: Press '2' Save Results To Network"
    Write-Host ""
    Write-Host "============================================"
    Write-Host ""
    Write-Host "B: Press 'B' To Go To Main Menu" -Foregroundcolor Red -Backgroundcolor White
    Write-Host ""
        }
    
    do 
            {
        Show-KAPEMenu
        $selection = Read-Host "Please make a selection"
        switch ($selection)
        {
        
        '1' {
        Start-KAPE-Local
        }
    
        '2' {
        Start-KAPE-Network
        }
        'B' {
        Show-MainMenu
        }
        }
        }
    until ($selection -eq 'B')
    }



### WinPMEM ###


function Start-WinPMEM-Local {
$drive = Read-Host "Enter Drive For Kape Collection (e.g C:)..."
$results = "./Results/$env:COMPUTERNAME/"
New-Item -Path $results/ -ItemType directory -Force
New-Item -Path $results/winpmem-image -ItemType directory -Force
.\Winpmem\winpmemx64.exe -1 $results/winpmem-image/image.raw
}
function Start-WinPMEM-Network {
$drive = Read-Host "Enter Drive For Kape Collection (e.g C:)..."
$results = Read-Host "Enter path to file share (e.g \\server\folder)"
New-PSDrive -Name "results" -PSProvider "FileSystem" -Root $results
New-Item -Path $results/ -ItemType directory -Force
New-Item -Path $results/winpmem-image -ItemType directory -Force
.\Winpmem\winpmemx64.exe -1 $results/$env:COMPUTERNAME/winpmem-image/image.raw
}


function Invoke-WinPMEM {
function Show-WinPMEMMenu {

    param (
        [string]$Title = "WinPMEM Menu"
          )
    Clear   
    Write-Host ""
    Write-Host "============ $Title ==========="
    Write-Host ""
    Write-Host "1: Press '1' Save Results Locally"
    Write-Host "2: Press '2' Save Results To Network"
    Write-Host ""
    Write-Host "============================================"
    Write-Host ""
    Write-Host "B: Press 'B' To Go To Main Menu" -Foregroundcolor Red -Backgroundcolor White
    Write-Host ""
        }
    
    do 
            {
        Show-WinPMEMMenu
        $selection = Read-Host "Please make a selection"
        switch ($selection)
        {
        
        '1' {
        Start-WinPMEM-Local
        }
    
        '2' {
        Start-WinPMEM-Network
        }
        'B' {
        Show-MainMenu
        }
        }
        }
    until ($selection -eq 'B')
    }


### DeepBlueCLI ###


function Start-DeepBlueCLI-Local {
$results = "./Results/$env:COMPUTERNAME/"
New-Item -Path $results/deepbluecli-results -ItemType directory -Force
Set-Location .\DeepBlueCLI\
.\DeepBlue.ps1 | ConvertTo-Csv | Out-File ../$results/deepbluecli-results/Export.csv
Set-Location ..\
}
function Start-DeepBlueCLI-Network {
$results = Read-Host "Enter path to file share (e.g \\server\folder)"
New-PSDrive -Name "results" -PSProvider "FileSystem" -Root $results
New-Item -Path $results/$env:COMPUTERNAME/deepbluecli-results -ItemType directory -Force
Set-Location .\DeepBlueCLI\
.\DeepBlue.ps1 | ConvertTo-Csv | Out-File $results/$env:COMPUTERNAME/deepbluecli-results/Export.csv
Set-Location ../
}


function Invoke-DeepBlueCLI {
function Show-DeepBlueCLIMenu {

    param (
        [string]$Title = "DeepBlueCLI Menu"
          )
    Clear   
    Write-Host ""
    Write-Host "============ $Title ==========="
    Write-Host ""
    Write-Host "1: Press '1' Save Results Locally"
    Write-Host "2: Press '2' Save Results To Network"
    Write-Host ""
    Write-Host "============================================"
    Write-Host ""
    Write-Host "B: Press 'B' To Go To Main Menu" -Foregroundcolor Red -Backgroundcolor White
    Write-Host ""
        }
    
    do 
            {
        Show-DeepBlueCLIMenu
        $selection = Read-Host "Please make a selection"
        switch ($selection)
        {
        
        '1' {
        Start-DeepBlueCLI-Local
        }
    
        '2' {
        Start-DeepBlueCLI-Network
        }
        'B' {
        Show-MainMenu
        }
        }
        }
    until ($selection -eq 'B')
    }

### Kansa ###


function Start-Kansa-Local {
    $results = "./Results/$env:COMPUTERNAME/"
    New-Item -Path $results/ -ItemType directory -Force
    New-Item -Path $results/kansa-results -ItemType directory -Force
    .\Kansa\kansa.ps1 -Target $env:COMPUTERNAME -ModulePath .\Kansa\Modules -Pushbin -Rmbin -Verbose 
    Move-Item -Path ./Output* $results/kansa-results/ 
}
function Start-Kansa-Network {
    $results = Read-Host "Enter path to file share (e.g \\server\folder)"
    New-PSDrive -Name "results" -PSProvider "FileSystem" -Root $results
    New-Item -Path $results/$env:COMPUTERNAME/ -ItemType directory -Force
    New-Item -Path $results/$env:COMPUTERNAME/kansa-results -ItemType directory -Force
    .\Kansa\kansa.ps1 -Target $env:COMPUTERNAME -ModulePath .\Kansa\Modules -Pushbin -Rmbin -Verbose 
    Move-Item -Path ./Output* $results/$env:COMPUTERNAME/kansa-results/ 
}



function Invoke-Kansa {
function Show-KansaMenu {

    param (
        [string]$Title = "Kansa Menu"
          )
    Clear   
    Write-Host ""
    Write-Host "============ $Title ==========="
    Write-Host ""
    Write-Host "1: Press '1' Save Results Locally"
    Write-Host "2: Press '2' Save Results To Network"
    Write-Host ""
    Write-Host "============================================"
    Write-Host ""
    Write-Host "B: Press 'B' To Go To Main Menu" -Foregroundcolor Red -Backgroundcolor White
    Write-Host ""
        }
    
    do 
            {
        Show-KansaMenu
        $selection = Read-Host "Please make a selection"
        switch ($selection)
        {
        
        '1' {
        Start-Kansa-Local
        }
    
        '2' {
        Start-Kansa-Network
        }
        'B' {
        Show-MainMenu
        }
        }
        }
    until ($selection -eq 'B')
    }


### Main Menu ###

function Show-MainMenu {

param (
    [string]$Title = "IRQuickCollect"
)
Clear
Write-Host ""
Write-Host ""
Write-Host ""
Write-Host ""
Write-Host "============ $Title ==========="
Write-Host ""
Write-Host "1: Press '1' Run Kansa"
Write-Host "2: Press '2' Run DeepBlueCLI"
Write-Host "3: Press '3' Run WinPMEM"
Write-Host "4: Press '4' Run KAPE"
Write-Host "4: Press '5' Run All Tools"
Write-Host ""
Write-Host "============================================"
Write-Host ""
Write-Host "Q: Press 'Q' to quit" -Foregroundcolor Red -Backgroundcolor White
Write-Host ""
        }

do 
        {
    Show-MainMenu
    $selection = Read-Host "Please make a selection"
    switch ($selection)
    {
    
    '1' {
    Invoke-Kansa
    }

    '2' {
    Invoke-DeepBlueCLI
    }
    
    '3' {
    Invoke-WinPMEM
    }
    
    '4' {
    Invoke-KAPE
    }

    '5' {
    Invoke-All-Tools
    }

    }
        }
until ($selection -eq 'q')



