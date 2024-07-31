function Create-JSProject {
    . $HOME/.windows-setup/commands/js-app/modules-import.ps1
    $styleOptions = @("Basic", "Sass", "Tailwind", "Back")
    $selectedStyleIndex = 0
    $currentMenu = "style"

    function Show-Menu {
        Clear-Host
        if ($currentMenu -eq "style") {
            Write-Host "Choose the styling option for your JavaScript project:"
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
                if ($currentMenu -eq "style") {
                    if ($selectedStyleIndex -eq 3) { # Back
                        return
                    }
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
}

Create-JSProject