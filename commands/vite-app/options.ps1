function Create-ViteApp {
    . $HOME/.windows-setup/commands/vite-app/modules-import.ps1

    $selectedFramework = Choose-Framework
    if ($selectedFramework -eq "Back") { return }

    $selectedStyle = Choose-Style -Framework $selectedFramework
    if ($selectedStyle -eq "Back") { 
        Create-ViteApp
        return
    }

    $selectedLanguage = Choose-Language -Framework $selectedFramework
    if ($selectedLanguage -eq "Back") {
        $selectedStyle = Choose-Style -Framework $selectedFramework
        if ($selectedStyle -ne "Back") {
            $selectedLanguage = Choose-Language -Framework $selectedFramework
        }
        return
    }

    $projectName = Read-Host "Enter the project name"

    $framework = $selectedFramework.ToLower()
    $style = $selectedStyle.ToLower().Replace(" ", "-")
    $language = if ($selectedLanguage -eq "TypeScript") { "ts" } else { "js" }

    switch ($framework) {
        "react" { 
            switch ($style) {
                "tailwind" { 
                    switch ($language) {
                    "ts" { React-Tailwind-TS -Project_Name $projectName }
                    "js" { React-Tailwind-JS -Project_Name $projectName }
                }
                }
                "chakra-ui" { 
                    switch ($language) {
                    "ts" {  }
                    "js" {  }
                }
                }
                "styled-components" { 
                    switch ($language) {
                    "ts" {  }
                    "js" {  }
                }
                }
            }
        }
        "vue" { 
            switch ($style) {
                "tailwind" { 
                    switch ($language) {
                    "ts" {  }
                    "js" {  }
                }
                }
                "chakra-ui" { 
                    switch ($language) {
                    "ts" {  }
                    "js" {  }
                }
                }
                "styled-components" { 
                    switch ($language) {
                    "ts" {  }
                    "js" {  }
                }
                }
            }
        }
        "svelte" { 
            switch ($style) {
                "tailwind" { 
                    switch ($language) {
                    "ts" {  }
                    "js" {  }
                }
                }
                "chakra-ui" { 
                    switch ($language) {
                    "ts" {  }
                    "js" {  }
                }
                }
                "styled-components" { 
                    switch ($language) {
                    "ts" {  }
                    "js" {  }
                }
                }
            }
        }
        "vanilla" { 
            switch ($style) {
                "tailwind" { 
                    switch ($language) {
                    "ts" {  }
                    "js" {  }
                }
                }
                "chakra-ui" { 
                   switch ($language) {
                    "ts" {  }
                    "js" {  }
                }
                }
                "styled-components" { 
                    switch ($language) {
                    "ts" {  }
                    "js" {  }
                }
                }
            }
        }
    }
}
Create-ViteApp