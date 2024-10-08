. $HOME/windows-powershell/Modules-Import.ps1
function Show-Commands {
    $options = @(
        "1. Create Next App",
        "2. Create Vite App",
        "3. Create PHP App",
        "4. Create Js App",
        "5. Show Git Aliases",
        "6. Exit"
    )

    $selectedIndex = 0

    function Show-Menu {
        Clear-Host
        Show-Version -ToolName "Prot Prot Tool" -Version "Beta Test 1.0.0"
        Write-Host "Select an action to run (use arrow keys to navigate and Enter to select): "
        for ($i = 0; $i -lt $options.Count; $i++) {
            if ($i -eq $selectedIndex) {
                Write-Host "> $($options[$i])" -ForegroundColor Cyan
            } else {
                Write-Host "  $($options[$i])"
            }
        }
    }

    Show-Menu

    while ($true) {
        $key = $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
        switch ($key.VirtualKeyCode) {
            38 { # Arrow Up
                $selectedIndex = ($selectedIndex - 1) % $options.Count
                if ($selectedIndex -lt 0) { $selectedIndex = $options.Count - 1 }
                Show-Menu
            }
            40 { # Arrow Down
                $selectedIndex = ($selectedIndex + 1) % $options.Count
                Show-Menu
            }
            13 { # Enter
                switch ($selectedIndex) {
                    0 { Initialize-NextApp }
                    1 { Initialize-ViteApp }  
                    2 { Initialize-PHPProject }
                    3 { Initialize-JSProject }
                    4 { 
                        $gitAliasesContent = Get-Content "$HOME/windows-powershell/commands/.git-aliases.ps1"
                        $gitAliasesContent | ForEach-Object { Write-Host $_ }
                        Read-Host "Press Enter to continue"
                    }
                    5 { Write-Host "Exiting menu"; return }
                }
                Show-Menu
            }
        }
    }
}
Set-Alias discommands Show-Commands