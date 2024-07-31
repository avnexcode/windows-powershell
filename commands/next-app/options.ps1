function Create-NextApp {
    . $HOME/.windows-setup/commands/next-app/page-router/tailwind/next-js.ps1
    . $HOME/.windows-setup/commands/next-app/page-router/tailwind/next-ts.ps1
    . $HOME/.windows-setup/commands/next-app/app-router/tailwind/next-ts.ps1
    . $HOME/.windows-setup/commands/next-app/app-router/tailwind/next-ts.ps1
    . $HOME/.windows-setup/commands/next-app/page-router/chakra/next-js.ps1
    . $HOME/.windows-setup/commands/next-app/page-router/chakra/next-ts.ps1
    . $HOME/.windows-setup/commands/next-app/app-router/chakra/next-ts.ps1
    . $HOME/.windows-setup/commands/next-app/app-router/chakra/next-ts.ps1

    $routerOptions = @("App Router", "Pages Router", "Back")
    $styleOptions = @("Tailwind", "Chakra UI", "Styled Components", "Back")
    $languageOptions = @("TypeScript", "JavaScript", "Back")
    $selectedRouterIndex = 0
    $selectedStyleIndex = 0
    $selectedLanguageIndex = 0
    $currentMenu = "router"

    function Show-Menu {
        Clear-Host
        switch ($currentMenu) {
            "router" {
                Write-Host "Choose the router for your Next.js app:"
                for ($i = 0; $i -lt $routerOptions.Count; $i++) {
                    if ($i -eq $selectedRouterIndex) {
                        Write-Host "> $($routerOptions[$i])" -ForegroundColor Cyan
                    } else {
                        Write-Host "  $($routerOptions[$i])"
                    }
                }
            }
            "style" {
                Write-Host "Choose the styling solution for your Next.js app:"
                for ($i = 0; $i -lt $styleOptions.Count; $i++) {
                    if ($i -eq $selectedStyleIndex) {
                        Write-Host "> $($styleOptions[$i])" -ForegroundColor Cyan
                    } else {
                        Write-Host "  $($styleOptions[$i])"
                    }
                }
            }
            "language" {
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
    }

    Show-Menu

    while ($true) {
        $key = $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
        switch ($key.VirtualKeyCode) {
            38 { # Arrow Up
                switch ($currentMenu) {
                    "router" { 
                        $selectedRouterIndex = ($selectedRouterIndex - 1) % $routerOptions.Count
                        if ($selectedRouterIndex -lt 0) { $selectedRouterIndex = $routerOptions.Count - 1 }
                    }
                    "style" { 
                        $selectedStyleIndex = ($selectedStyleIndex - 1) % $styleOptions.Count
                        if ($selectedStyleIndex -lt 0) { $selectedStyleIndex = $styleOptions.Count - 1 }
                    }
                    "language" { 
                        $selectedLanguageIndex = ($selectedLanguageIndex - 1) % $languageOptions.Count
                        if ($selectedLanguageIndex -lt 0) { $selectedLanguageIndex = $languageOptions.Count - 1 }
                    }
                }
                Show-Menu
            }
            40 { # Arrow Down
                switch ($currentMenu) {
                    "router" { $selectedRouterIndex = ($selectedRouterIndex + 1) % $routerOptions.Count }
                    "style" { $selectedStyleIndex = ($selectedStyleIndex + 1) % $styleOptions.Count }
                    "language" { $selectedLanguageIndex = ($selectedLanguageIndex + 1) % $languageOptions.Count }
                }
                Show-Menu
            }
            13 { # Enter
                switch ($currentMenu) {
                    "router" {
                        if ($selectedRouterIndex -eq 2) { # Back
                            return
                        }
                        $currentMenu = "style"
                        Show-Menu
                    }
                    "style" {
                        if ($selectedStyleIndex -eq 3) { # Back
                            $currentMenu = "router"
                            Show-Menu
                        } else {
                            $currentMenu = "language"
                            Show-Menu
                        }
                    }
                    "language" {
                        if ($selectedLanguageIndex -eq 2) { # Back
                            $currentMenu = "style"
                            Show-Menu
                        } else {
                            $router = if ($selectedRouterIndex -eq 0) { "app" } else { "pages" }
                            $style = $styleOptions[$selectedStyleIndex].ToLower().Replace(" ", "-")
                            $language = if ($selectedLanguageIndex -eq 0) { "ts" } else { "js" }
                            $projectName = Read-Host "Enter the project name"

                            switch ($style) {
                                "tailwind" { 
                                    switch($language) {
                                        "js" { Next-Page-Tailwind-JS -Project_Name $projectName }
                                        "ts" { Next-Page-Tailwind-TS -Project_Name $projectName }
                                    }
                                }
                                "chakra-ui" { 
                                    switch($language) {
                                        "js" { & $HOME/.windows-setup/commands/next-app/$router-router/chakra/next-js.ps1 -Project_Name $projectName }
                                        "ts" { & $HOME/.windows-setup/commands/next-app/$router-router/chakra/next-ts.ps1 -Project_Name $projectName }
                                    }
                                }
                                "styled-components" { 
                                    switch($language) {
                                        "js" { & $HOME/.windows-setup/commands/next-app/$router-router/styled-components/next-js.ps1 -Project_Name $projectName }
                                        "ts" { & $HOME/.windows-setup/commands/next-app/$router-router/styled-components/next-ts.ps1 -Project_Name $projectName }
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