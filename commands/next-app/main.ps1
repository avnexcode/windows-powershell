# Import Module
. ~/.windows-setup/commands/next-app/app-router/next-js.ps1
. ~/.windows-setup/commands/next-app/app-router/next-ts.ps1
. ~/.windows-setup/commands/next-app/app-page/next-js.ps1
. ~/.windows-setup/commands/next-app/app-page/next-ts.ps1

function Create-NextApp {
    $routerOptions = @("App Router", "Pages Router", "Back")
    $languageOptions = @("JavaScript (JS)", "TypeScript (TS)", "Back")
    $selectedRouterIndex = 0
    $selectedLanguageIndex = 0
    $currentMenu = "router"

    function Show-Menu {
        Clear-Host
        if ($currentMenu -eq "router") {
            Write-Host "Choose the router for your Next.js app:"
            for ($i = 0; $i -lt $routerOptions.Count; $i++) {
                if ($i -eq $selectedRouterIndex) {
                    Write-Host "> $($routerOptions[$i])" -ForegroundColor Cyan
                } else {
                    Write-Host "  $($routerOptions[$i])"
                }
            }
        } elseif ($currentMenu -eq "language") {
            Write-Host "Choose the language for your Next.js app:"
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
                if ($currentMenu -eq "router") {
                    $selectedRouterIndex = ($selectedRouterIndex - 1) % $routerOptions.Count
                    if ($selectedRouterIndex -lt 0) { $selectedRouterIndex = $routerOptions.Count - 1 }
                } elseif ($currentMenu -eq "language") {
                    $selectedLanguageIndex = ($selectedLanguageIndex - 1) % $languageOptions.Count
                    if ($selectedLanguageIndex -lt 0) { $selectedLanguageIndex = $languageOptions.Count - 1 }
                }
                Show-Menu
            }
            40 { # Arrow Down
                if ($currentMenu -eq "router") {
                    $selectedRouterIndex = ($selectedRouterIndex + 1) % $routerOptions.Count
                } elseif ($currentMenu -eq "language") {
                    $selectedLanguageIndex = ($selectedLanguageIndex + 1) % $languageOptions.Count
                }
                Show-Menu
            }
            13 { # Enter
                if ($currentMenu -eq "router") {
                    if ($selectedRouterIndex -eq 2) { # Back
                        return
                    }
                    $currentMenu = "language"
                    Show-Menu
                } elseif ($currentMenu -eq "language") {
                    if ($selectedLanguageIndex -eq 2) { # Back
                        $currentMenu = "router"
                        Show-Menu
                    } else {
                        $router = if ($selectedRouterIndex -eq 0) { "app" } elseif ($selectedRouterIndex -eq 1) { "pages" } else { $null }
                        $language = if ($selectedLanguageIndex -eq 0) { "js" } elseif ($selectedLanguageIndex -eq 1) { "ts" } else { $null }
                        
                        if ($router -ne $null -and $language -ne $null) {
                            $projectName = Read-Host "Enter the project name: "

                            switch ($router) {
                                "app" {
                                    switch ($language) {
                                        "js" { NextAppJs -Project_Name $projectName }
                                        "ts" { NextAppTs -Project_Name $projectName }
                                    }
                                }
                                "pages" {
                                    switch ($language) {
                                        "js" { NextPageJs -Project_Name $projectName }
                                        "ts" { NextPageTs -Project_Name $projectName }
                                    }
                                }
                            }
                            return
                        }
                    }
                }
            }
        }
    }
}

Create-NextApp
