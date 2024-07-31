function Choose-Router {
    $routerOptions = @("App Router", "Pages Router", "Back")
    $selectedIndex = 0

    function Show-Menu {
        Clear-Host
        Write-Host "Choose the router for your Next.js app:"
        for ($i = 0; $i -lt $routerOptions.Count; $i++) {
            if ($i -eq $selectedIndex) {
                Write-Host "> $($routerOptions[$i])" -ForegroundColor Cyan
            } else {
                Write-Host "  $($routerOptions[$i])"
            }
        }
    }

    Show-Menu

    while ($true) {
        $key = $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
        switch ($key.VirtualKeyCode) {
            38 { # Arrow Up
                $selectedIndex = ($selectedIndex - 1) % $routerOptions.Count
                if ($selectedIndex -lt 0) { $selectedIndex = $routerOptions.Count - 1 }
                Show-Menu
            }
            40 { # Arrow Down
                $selectedIndex = ($selectedIndex + 1) % $routerOptions.Count
                Show-Menu
            }
            13 { # Enter
                return $routerOptions[$selectedIndex]
            }
        }
    }
}