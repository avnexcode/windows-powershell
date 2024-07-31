function Create-NextApp {
    . $HOME/.windows-setup/commands/next-app/modules-import.ps1

    $selectedRouter = Choose-Router
    if ($selectedRouter -eq "Back") { return }

    $selectedStyle = Choose-Style
    if ($selectedStyle -eq "Back") { 
        Create-NextApp
        return
    }

    $selectedLanguage = Choose-Language
    if ($selectedLanguage -eq "Back") {
        $selectedStyle = Choose-Style
        if ($selectedStyle -ne "Back") {
            $selectedLanguage = Choose-Language
        }
        return
    }

    $projectName = Read-Host "Enter the project name"

    $router = if ($selectedRouter -eq "App Router") { "app" } else { "pages" }
    $style = $selectedStyle.ToLower().Replace(" ", "-")
    $language = if ($selectedLanguage -eq "TypeScript") { "ts" } else { "js" }

    switch ($style) {
        "tailwind" { 
            switch($language) {
                "js" { Next-Page-Tailwind-JS -Project_Name $projectName }
                "ts" { Next-Page-Tailwind-TS -Project_Name $projectName }
            }
        }
        "chakra-ui" { 
            switch($language) {
                "js" {  }
                "ts" {  }
            }
        }
        "styled-components" { 
            switch($language) {
                    "js" {  }
                    "ts" {  }
            }
        }
    }
}
Create-NextApp