# GTA SA Config changer #

<# Variables #>
$path10 = "F:\Speedrun\Grand Theft Auto San Andreas 1.01\back up\Game Config\1.0\gta_sa.set"
$path101 = "F:\Speedrun\Grand Theft Auto San Andreas 1.01\back up\Game Config\1.01\gta_sa.set"

<# Functions #>
Function ShowMenu {
    Cls

    Write-Host "       GTA SA Config Changer       "

    Write-Host "`n"

    Write-Host "------------------------------------"

    Write-Host "1. Install GTA SA 1.0 Configuration"
    
    Write-Host "2. Install GTA SA 1.01 Configuration"
    
    Write-Host "3. Exit"

    Write-Host "------------------------------------"
}

Function InstallConfig {
    

}

<# Main #>
do {
    ShowMenu
    
    Write-Host "`n"

    $option = Read-Host "Select an option"

    switch ($option) {
          '1' {
             Cls

             Write-Host "You chosen to Install GTA SA 1.0 Configuration"

          }
          '2' {
             Cls

             Write-Host "You chosen to Install GTA SA 1.01 Configuration"
          }
          '3' {
             Cls

             Write-host "Exiting the program!"

             Write-Host "`n"

             Read-Host "Press any key to continue..."

             exit
          }
          Default {
                 Cls
                 
                 Write-Host -ForegroundColor red -BackgroundColor white "Invalid option. Please choose another option"
          
          }
    }
} 
while ($option -eq '3')

Write-Host "`n"

Read-Host "Press any key to continue..."