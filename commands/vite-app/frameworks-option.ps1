function Choose-Framework {
    
    $frameworkOptions = @("React", "Vue", "Svelte", "Vanilla", "Back")
    $selectedIndex = 0

    function Show-Menu {
        Clear-Host
        Write-Host "Choose the framework for your Vite app:"
        for ($i = 0; $i -lt $frameworkOptions.Count; $i++) {
            if ($i -eq $selectedIndex) {
                Write-Host "> $($frameworkOptions[$i])" -ForegroundColor Cyan
            } else {
                Write-Host "  $($frameworkOptions[$i])"
            }
        }
    }

    Show-Menu

    while ($true) {
        $key = $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
        switch ($key.VirtualKeyCode) {
            38 { # Arrow Up
                $selectedIndex = ($selectedIndex - 1) % $frameworkOptions.Count
                if ($selectedIndex -lt 0) { $selectedIndex = $frameworkOptions.Count - 1 }
                Show-Menu
            }
            40 { # Arrow Down
                $selectedIndex = ($selectedIndex + 1) % $frameworkOptions.Count
                Show-Menu
            }
            13 { # Enter
                return $frameworkOptions[$selectedIndex]
            }
        }
    }
}