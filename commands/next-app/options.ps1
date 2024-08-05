function Initialize-NextApp {
    . $HOME/.windows-setup/commands/next-app/Modules-Import.ps1
    
    while ($true) {
        $selectedRouter = ChooseRouter
        if ($selectedRouter -eq "Back") { return }

        while ($true) {
            $selectedStyle = ChooseStyle
            if ($selectedStyle -eq "Back") { break }

            while ($true) {
                $selectedLanguage = ChooseLanguage
                if ($selectedLanguage -eq "Back") { break }

                $projectName = Read-Host "Enter the project name"
                
                $router = if ($selectedRouter -eq "App Router") { "App" } else { "Page" }
                $style = $selectedStyle.Replace(" ", "")
                $language = $selectedLanguage
                
                Initialize-NextAppCommand -Router $router -Style $style -Language $language -ProjectName $projectName
                return
            }
        }
    }
}