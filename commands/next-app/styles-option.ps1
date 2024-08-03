function ChooseStyle {
    $styleOptions = @("Tailwind", "Chakra-UI", "Styled-Components", "Back")
    $selectedIndex = 0

    function Show-Menu {
        Clear-Host
        Write-Host "Choose the styling solution for your Next.js app:"
        for ($i = 0; $i -lt $styleOptions.Count; $i++) {
            if ($i -eq $selectedIndex) {
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
                $selectedIndex = ($selectedIndex - 1) % $styleOptions.Count
                if ($selectedIndex -lt 0) { $selectedIndex = $styleOptions.Count - 1 }
                Show-Menu
            }
            40 { # Arrow Down
                $selectedIndex = ($selectedIndex + 1) % $styleOptions.Count
                Show-Menu
            }
            13 { # Enter
                return $styleOptions[$selectedIndex]
            }
        }
    }
}