<# GTA SA Config Manager #>

<# Variables #>
$config10path = Get-Content .\Paths\path10.txt
$config101path = Get-Content .\Paths\path101.txt
$currentconfigfilepath = Get-Content .\Paths\configfilepath.txt
$gtasauserfilespath = Get-Content .\Paths\gtasauserfilespath.txt
$versionselected = ""
$isconfigfileexists = ""
$dxwndpath = Get-Content .\Paths\pathdxwnd.txt
$gta10path = Get-Content .\Paths\pathgta10.txt
$gta101path = Get-Content .\Paths\pathgta101.txt

<# Functions #>
Function ShowMenu {
   Clear-Host

    Write-Host -ForegroundColor DarkBlue -BackgroundColor Gray "       GTA SA Config File Manager       "

    Write-Host "`n"

    Write-Host -ForegroundColor Yellow -BackgroundColor Black "--------------------------------------"

    Write-Host "1. Change config file for GTA SA 1.0"
    
    Write-Host "2. Change config file for GTA SA 1.01"
    
    Write-Host "3. Exit"

    Write-Host -ForegroundColor Yellow -BackgroundColor Black "--------------------------------------"
}

Function InstallConfigFile {
   Clear-Host

   Write-Host "Checking if the GTA SA User Files folder exists...."
   
   Write-Host "`n"
   
   if ((Test-Path -Path $gtasauserfilespath) -ne "True") {
      Clear-Host
      
      Write-Host -ForegroundColor Red "GTA SA User Files folder doesn't exists. Please make sure the folder exits before installing the config file"

      Write-Host "`n"

      Read-Host "Press any key to continue..."
      
      exit
   }
   else {

      Write-Host -ForegroundColor Green "GTA SA User Files folder found"

      Write-Host "`n"

      Read-Host "Press any key to continue..."

      $isconfigfileexists = ([System.IO.File]::Exists($currentconfigfilepath))

      if ($isconfigfileexists -eq $true -or $isconfigfileexists -eq $false) {
         if ($versionselected -eq "1.0") {
            Write-Host "Proceeding to install" $versionselected "confing file into the GTA User Files folder....."

            Copy-Item -Path $config10path -Destination $currentconfigfilepath

            Write-Host "`n"

            Write-Host -ForegroundColor Green $versionselected "confing file installed successfully"

            $isconfigfileexists = ""

            Write-Host "`n"

            Read-Host "Press any key to continue..."
            
         }
         else {
            Write-Host "Proceeding to install" $versionselected "confing file into the GTA User Files folder....."

            Copy-Item -Path $config101path -Destination $currentconfigfilepath

            Write-Host "`n"

            Write-Host -ForegroundColor Green $versionselected "confing file installed successfully"

            $isconfigfileexists = ""

            Write-Host "`n"

            Read-Host "Press any key to continue..."
         }
      }
   }
}

Function OpenDxwndGTASA {
   Clear-Host

   Write-Host "Opening Dxwnd...."

   Start-Process -FilePath "dxwnd.exe" -WorkingDirectory $dxwndpath

   Write-Host "`n"

   Write-Host "Dxwnd opened successfully"

   Write-Host "`n"

   Read-Host "Press any key to continue..."

   Write-Host "Opening Grand Theft Auto San Andreas "$versionselected "...."

   if ($versionselected -eq "1.0") {
      Write-Host "`n"

      Start-Process -FilePath "gta_sa.exe" -WorkingDirectory $gta10path

      Write-Host "Grand Theft Auto San Andreas" $versionselected "opened successfully"

      $versionselected = ""

      Write-Host "`n"

      Read-Host "Press any key to continue..."
   }
   else {
      Write-Host "`n"

      Start-Process -FilePath "gta_sa.exe" -WorkingDirectory $gta101path

      Write-Host "Grand Theft Auto San Andreas" $versionselected "opened successfully"

      $versionselected = ""

      Write-Host "`n"

      Read-Host "Press any key to continue..."
   }
}

<# Main #>
do {
    ShowMenu
    
    Write-Host "`n"

    $option = Read-Host "Select an option"

    switch ($option) {
          '1' {
             Clear-Host

             Write-Host -ForegroundColor Green "You chose to Install GTA SA 1.0 Configuration"

             $versionselected = "1.0"

             Write-Host "`n"

             Write-Host "The location of your backup file for GTA SA 1.0 is: " $config10path

             Write-Host "`n"

             do { 
               $confirmation = Read-Host "Are you Sure that is the correct backup path? [y/n]" 

               if ($confirmation -eq 'n') {
                  Clear-Host
                  
                  Write-Host -ForegroundColor Yellow "Please review the path located in the text file for GTA SA 1.0 before installing the config file"

                  Write-Host "`n"

                  Read-Host "Press any key to continue..."

                  exit
               } 
            }
            while($confirmation -ne "y")

            InstallConfigFile

            OpenDxwndGTASA

          }
          '2' {
            Clear-Host

             Write-Host -ForegroundColor Green "You chose to Install GTA SA 1.01 Configuration"

             $versionselected = "1.01"

             Write-Host "`n"

             Write-Host "The location of your backup file for SA 1.01 is: " $config101path

             Write-Host "`n"

             do { 
               $confirmation = Read-Host "Are you Sure that is the correct backup path? [y/n]" 

               if ($confirmation -eq 'n') {
                  Clear-Host
                  
                  Write-Host -ForegroundColor Yellow "Please review the path located in the text file for GTA SA 1.01 before installing the config file"

                  Write-Host "`n"

                  Read-Host "Press any key to continue..."

                  exit
               } 
            }
            while($confirmation -ne "y")

            InstallConfigFile
            
            OpenDxwndGTASA
            
          }
          '3' {
            Clear-Host

             Write-host "You exit the program"

             Write-Host "`n"

             Write-host "See you next time!"

             Write-Host "`n"

             Read-Host "Press any key to continue..."

             exit
          }
          Default {
             Clear-Host
                 
             Write-Host -ForegroundColor Red "Invalid option. Please choose another option"

             Write-Host "`n"

             Read-Host "Press any key to continue..."

             ShowMenu
        }
    }
} 
until ($option -eq '3')