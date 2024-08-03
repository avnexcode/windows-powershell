function Initialize-ViteApp {
    . $HOME/.windows-setup/commands/vite-app/Modules-Import.ps1
    
    while ($true) {
        $selectedFramework = ChooseFramework
        if ($selectedFramework -eq "Back") { return }

        while ($true) {
            $selectedStyle = ChooseStyle -Framework $selectedFramework
            if ($selectedStyle -eq "Back") { break }

            while ($true) {
                $selectedLanguage = ChooseLanguage -Framework $selectedFramework
                if ($selectedLanguage -eq "Back") { break }

                $projectName = Read-Host "Enter the project name"
                
                Initialize-ViteAppCommand -Framework $selectedFramework -Style $selectedStyle -Language $selectedLanguage -ProjectName $projectName
                return
            }
        }
    }
}
