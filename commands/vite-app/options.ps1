function Create-ViteApp {
    . $HOME/.windows-setup/commands/vite-app/react-app/tailwind/react-js.ps1
    . $HOME/.windows-setup/commands/vite-app/react-app/tailwind/react-ts.ps1
    . $HOME/.windows-setup/commands/vite-app/vue-app/tailwind/vue-js.ps1
    . $HOME/.windows-setup/commands/vite-app/vue-app/tailwind/vue-ts.ps1
    . $HOME/.windows-setup/commands/vite-app/svelte-app/tailwind/svelte-js.ps1
    . $HOME/.windows-setup/commands/vite-app/svelte-app/tailwind/svelte-ts.ps1
    . $HOME/.windows-setup/commands/vite-app/vanilla-app/tailwind/vanilla-js.ps1
    . $HOME/.windows-setup/commands/vite-app/vanilla-app/tailwind/vanilla-ts.ps1

    $frameworkOptions = @("React", "Vue", "Svelte", "Vanilla", "Back")
    $styleOptions = @("Tailwind", "Chakra UI", "Styled Components", "Back")
    $languageOptions = @("TypeScript", "JavaScript", "Back")
    $selectedFrameworkIndex = 0
    $selectedStyleIndex = 0
    $selectedLanguageIndex = 0
    $currentMenu = "framework"

    function Show-Menu {
        Clear-Host
        switch ($currentMenu) {
            "framework" {
                Write-Host "Choose the framework for your Vite app:"
                for ($i = 0; $i -lt $frameworkOptions.Count; $i++) {
                    if ($i -eq $selectedFrameworkIndex) {
                        Write-Host "> $($frameworkOptions[$i])" -ForegroundColor Cyan
                    } else {
                        Write-Host "  $($frameworkOptions[$i])"
                    }
                }
            }
            "style" {
                Write-Host "Choose the styling solution for your Vite app:"
                for ($i = 0; $i -lt $styleOptions.Count; $i++) {
                    if ($i -eq $selectedStyleIndex) {
                        Write-Host "> $($styleOptions[$i])" -ForegroundColor Cyan
                    } else {
                        Write-Host "  $($styleOptions[$i])"
                    }
                }
            }
            "language" {
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
    }

    Show-Menu

    while ($true) {
        $key = $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
        switch ($key.VirtualKeyCode) {
            38 { # Arrow Up
                switch ($currentMenu) {
                    "framework" { 
                        $selectedFrameworkIndex = ($selectedFrameworkIndex - 1) % $frameworkOptions.Count
                        if ($selectedFrameworkIndex -lt 0) { $selectedFrameworkIndex = $frameworkOptions.Count - 1 }
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
                    "framework" { $selectedFrameworkIndex = ($selectedFrameworkIndex + 1) % $frameworkOptions.Count }
                    "style" { $selectedStyleIndex = ($selectedStyleIndex + 1) % $styleOptions.Count }
                    "language" { $selectedLanguageIndex = ($selectedLanguageIndex + 1) % $languageOptions.Count }
                }
                Show-Menu
            }
            13 { # Enter
                switch ($currentMenu) {
                    "framework" {
                        if ($selectedFrameworkIndex -eq 4) { # Back
                            return
                        }
                        $framework = $frameworkOptions[$selectedFrameworkIndex].ToLower()
                        $currentMenu = "style"
                        Show-Menu
                    }
                    "style" {
                        if ($selectedStyleIndex -eq 3) { # Back
                            $currentMenu = "framework"
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
                            $style = $styleOptions[$selectedStyleIndex].ToLower().Replace(" ", "-")
                            $language = if ($selectedLanguageIndex -eq 0) { "ts" } else { "js" }
                            $projectName = Read-Host "Enter the project name"

                            switch ($framework) {
                                "react" { 
                                    switch ($style) {
                                        "tailwind" { 
                                            if ($language -eq "ts") { React-Tailwind-TS -Project_Name $projectName }
                                            else { React-Tailwind-JS -Project_Name $projectName }
                                        }
                                        "chakra-ui" { 
                                            & $HOME/.windows-setup/commands/vite-app/react-app/chakra/$framework-$language.ps1 -Project_Name $projectName
                                        }
                                        "styled-components" { 
                                            & $HOME/.windows-setup/commands/vite-app/react-app/styled-components/$framework-$language.ps1 -Project_Name $projectName
                                        }
                                    }
                                }
                                "vue" { 
                                    switch ($style) {
                                        "tailwind" { 
                                            if ($language -eq "ts") { Vue-Tailwind-TS -Project_Name $projectName }
                                            else { Vue-Tailwind-JS -Project_Name $projectName }
                                        }
                                        "chakra-ui" { 
                                            & $HOME/.windows-setup/commands/vite-app/vue-app/chakra/$framework-$language.ps1 -Project_Name $projectName
                                        }
                                        "styled-components" { 
                                            & $HOME/.windows-setup/commands/vite-app/vue-app/styled-components/$framework-$language.ps1 -Project_Name $projectName
                                        }
                                    }
                                }
                                "svelte" { 
                                    switch ($style) {
                                        "tailwind" { 
                                            if ($language -eq "ts") { Svelte-Tailwind-TS -Project_Name $projectName }
                                            else { Svelte-Tailwind-JS -Project_Name $projectName }
                                        }
                                        "chakra-ui" { 
                                            & $HOME/.windows-setup/commands/vite-app/svelte-app/chakra/$framework-$language.ps1 -Project_Name $projectName
                                        }
                                        "styled-components" { 
                                            & $HOME/.windows-setup/commands/vite-app/svelte-app/styled-components/$framework-$language.ps1 -Project_Name $projectName
                                        }
                                    }
                                }
                                "vanilla" { 
                                    switch ($style) {
                                        "tailwind" { 
                                            if ($language -eq "ts") { Vanilla-Tailwind-TS -Project_Name $projectName }
                                            else { Vanilla-Tailwind-JS -Project_Name $projectName }
                                        }
                                        "chakra-ui" { 
                                            & $HOME/.windows-setup/commands/vite-app/vanilla-app/chakra/$framework-$language.ps1 -Project_Name $projectName
                                        }
                                        "styled-components" { 
                                            & $HOME/.windows-setup/commands/vite-app/vanilla-app/styled-components/$framework-$language.ps1 -Project_Name $projectName
                                        }
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

Create-ViteApp