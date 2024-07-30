# Import Module
. ~/.windows-setup/commands/vite-app/react-app/react-js.ps1
. ~/.windows-setup/commands/vite-app/react-app/react-ts.ps1

function Create-ViteApp {
    $frameworkOptions = @("React", "Vue", "Svelte", "Vanilla", "Back")
    $languageOptions = @("JavaScript (JS)", "TypeScript (TS)", "Back")
    $selectedFrameworkIndex = 0
    $selectedLanguageIndex = 0
    $currentMenu = "framework"

    function Show-Menu {
        Clear-Host
        if ($currentMenu -eq "framework") {
            Write-Host "Choose the framework for your Vite app:"
            for ($i = 0; $i -lt $frameworkOptions.Count; $i++) {
                if ($i -eq $selectedFrameworkIndex) {
                    Write-Host "> $($frameworkOptions[$i])" -ForegroundColor Cyan
                } else {
                    Write-Host "  $($frameworkOptions[$i])"
                }
            }
        } elseif ($currentMenu -eq "language") {
            Write-Host "Choose the language for your Vite app:"
            for ($i = 0; $i -lt $languageOptions.Count; $i++) {
                if ($i -eq $selectedLanguageIndex) {
                    Write-Host "> $($languageOptions[$i])" -ForegroundColor Cyan
                } else {
                    Write-Host "  $($languageOptions[$i])"
                }
            }
        }
    }

    Show-Menu

    while ($true) {
        $key = $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
        switch ($key.VirtualKeyCode) {
            38 { # Arrow Up
                if ($currentMenu -eq "framework") {
                    $selectedFrameworkIndex = ($selectedFrameworkIndex - 1) % $frameworkOptions.Count
                    if ($selectedFrameworkIndex -lt 0) { $selectedFrameworkIndex = $frameworkOptions.Count - 1 }
                } elseif ($currentMenu -eq "language") {
                    $selectedLanguageIndex = ($selectedLanguageIndex - 1) % $languageOptions.Count
                    if ($selectedLanguageIndex -lt 0) { $selectedLanguageIndex = $languageOptions.Count - 1 }
                }
                Show-Menu
            }
            40 { # Arrow Down
                if ($currentMenu -eq "framework") {
                    $selectedFrameworkIndex = ($selectedFrameworkIndex + 1) % $frameworkOptions.Count
                } elseif ($currentMenu -eq "language") {
                    $selectedLanguageIndex = ($selectedLanguageIndex + 1) % $languageOptions.Count
                }
                Show-Menu
            }
            13 { # Enter
                if ($currentMenu -eq "framework") {
                    if ($selectedFrameworkIndex -eq 4) { # Back
                        return
                    }
                    $currentMenu = "language"
                    Show-Menu
                } elseif ($currentMenu -eq "language") {
                    if ($selectedLanguageIndex -eq 2) { # Back
                        $currentMenu = "framework"
                        Show-Menu
                    } else {
                        $framework = $frameworkOptions[$selectedFrameworkIndex]
                        $language = if ($selectedLanguageIndex -eq 0) { "js" } elseif ($selectedLanguageIndex -eq 1) { "ts" } else { $null }
                        $projectName = Read-Host "Enter the project name: "

                        switch ($framework) {
                            "React" {
                                switch ($language) {
                                    "js" { ReactViteJs -Project_Name $projectName }
                                    "ts" { ReactViteTs -Project_Name $projectName }
                                }
                            }
                            "Vue" {
                                Write-Host "On development"
                            }
                            "Svelte" {
                                Write-Host "On development"
                            }
                            "Vanilla" {
                                Write-Host "On development"
                            }
                        }
                        return
                    }
                }
            }
        }
    }
}

Create-ViteApp
