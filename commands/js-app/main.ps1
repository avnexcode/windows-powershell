# Import Module
. ~/.windows-setup/commands/js-app/js-basic.ps1
. ~/.windows-setup/commands/js-app/js-sass.ps1
. ~/.windows-setup/commands/js-app/js-tailwind.ps1

function Create-JSProject {
    $styleOptions = @("Basic", "Sass", "Tailwind")
    $selectedStyleIndex = 0

    function Show-Menu {
        Clear-Host
        Write-Host "Choose the styling option for your Javascript project:"
        for ($i = 0; $i -lt $styleOptions.Count; $i++) {
            if ($i -eq $selectedStyleIndex) {
                Write-Host "> $($styleOptions[$i])" -ForegroundColor Cyan
            } else {
                Write-Host "  $($styleOptions[$i])"
            }
        }
    }

    Show-Menu

    while ($true) {
        $key = $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
        switch ($key.VirtualKeyCode) {
            38 { # Arrow Up
                $selectedStyleIndex = ($selectedStyleIndex - 1) % $styleOptions.Count
                if ($selectedStyleIndex -lt 0) { $selectedStyleIndex = $styleOptions.Count - 1 }
                Show-Menu
            }
            40 { # Arrow Down
                $selectedStyleIndex = ($selectedStyleIndex + 1) % $styleOptions.Count
                Show-Menu
            }
            13 { # Enter
                $style = $styleOptions[$selectedStyleIndex].ToLower()
                $projectName = Read-Host "Enter the project name"
                
                switch ($style) {
                    "basic" { JSBasic -Project_Name $projectName }
                    "sass" { JSSass -Project_Name $projectName }
                    "tailwind" { JSTailwind -Project_Name $projectName }
                }
                return
            }
        }
    }
}
Create-JSProject