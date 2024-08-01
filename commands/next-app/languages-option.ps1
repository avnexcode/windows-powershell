function Choose-Language {
    $languageOptions = @("TS", "JS", "Back")
    $selectedIndex = 0

    function Show-Menu {
        Clear-Host
        Write-Host "Choose the language for your Next.js app:"
        for ($i = 0; $i -lt $languageOptions.Count; $i++) {
            $displayOption = if ($languageOptions[$i] -eq "TS") { "TypeScript" } elseif ($languageOptions[$i] -eq "JS") { "JavaScript" } else { $languageOptions[$i] }
            if ($i -eq $selectedIndex) {
                Write-Host "> $displayOption" -ForegroundColor Cyan
            } else {
                Write-Host "  $displayOption"
            }
        }
    }

    Show-Menu

    while ($true) {
        $key = $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
        switch ($key.VirtualKeyCode) {
            38 { # Arrow Up
                $selectedIndex = ($selectedIndex - 1) % $languageOptions.Count
                if ($selectedIndex -lt 0) { $selectedIndex = $languageOptions.Count - 1 }
                Show-Menu
            }
            40 { # Arrow Down
                $selectedIndex = ($selectedIndex + 1) % $languageOptions.Count
                Show-Menu
            }
            13 { # Enter
                return $languageOptions[$selectedIndex]
            }
        }
    }
}