# Import Module
. ~/.windows-setup/commands/php-app/php-basic.ps1
. ~/.windows-setup/commands/php-app/php-sass.ps1
. ~/.windows-setup/commands/php-app/php-tailwind.ps1

function Create-PHPProject {
    $styleOptions = @("Basic", "Sass", "Tailwind", "Back")
    $selectedStyleIndex = 0
    $currentMenu = "style"

    function Show-Menu {
        Clear-Host
        if ($currentMenu -eq "style") {
            Write-Host "Choose the styling option for your PHP project:"
            for ($i = 0; $i -lt $styleOptions.Count; $i++) {
                if ($i -eq $selectedStyleIndex) {
                    Write-Host "> $($styleOptions[$i])" -ForegroundColor Cyan
                } else {
                    Write-Host "  $($styleOptions[$i])"
                }
            }
        }
    }

    Show-Menu

    while ($true) {
        $key = $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
        switch ($key.VirtualKeyCode) {
            38 { # Arrow Up
                if ($currentMenu -eq "style") {
                    $selectedStyleIndex = ($selectedStyleIndex - 1) % $styleOptions.Count
                    if ($selectedStyleIndex -lt 0) { $selectedStyleIndex = $styleOptions.Count - 1 }
                }
                Show-Menu
            }
            40 { # Arrow Down
                if ($currentMenu -eq "style") {
                    $selectedStyleIndex = ($selectedStyleIndex + 1) % $styleOptions.Count
                }
                Show-Menu
            }
            13 { # Enter
                $style = $styleOptions[$selectedStyleIndex].ToLower()
                if ($style -eq "back") {
                    discommands
                    return
                }
                $projectName = Read-Host "Enter the project name"
                
                switch ($style) {
                    "basic" { PHPBasic -Project_Name $projectName }
                    "sass" { PHPSass -Project_Name $projectName }
                    "tailwind" { PHPTailwind -Project_Name $projectName }
                }
                return
            }
        }
    }
}

Create-PHPProject
