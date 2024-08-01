function Create-NextApp {
    . $HOME/.windows-setup/commands/next-app/Modules-Import.ps1
    
    while ($true) {
        $selectedRouter = Choose-Router
        if ($selectedRouter -eq "Back") { return }

        while ($true) {
            $selectedStyle = Choose-Style
            if ($selectedStyle -eq "Back") { break }

            while ($true) {
                $selectedLanguage = Choose-Language
                if ($selectedLanguage -eq "Back") { break }

                $projectName = Read-Host "Enter the project name"
                
                $router = if ($selectedRouter -eq "App Router") { "App" } else { "Page" }
                $style = $selectedStyle.ToLower().Replace(" ", "-")
                $language = $selectedLanguage
                
                Execute-NextAppCommand -Router $router -Style $style -Language $language -ProjectName $projectName
                return
            }
        }
    }
}