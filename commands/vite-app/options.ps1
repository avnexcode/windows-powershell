function Create-ViteApp {
    . $HOME/.windows-setup/commands/vite-app/Modules-Import.ps1
    
    while ($true) {
        $selectedFramework = Choose-Framework
        if ($selectedFramework -eq "Back") { return }

        while ($true) {
            $selectedStyle = Choose-Style -Framework $selectedFramework
            if ($selectedStyle -eq "Back") { break }

            while ($true) {
                $selectedLanguage = Choose-Language -Framework $selectedFramework
                if ($selectedLanguage -eq "Back") { break }

                $projectName = Read-Host "Enter the project name"
                
                Execute-ViteAppCommand -Framework $selectedFramework -Style $selectedStyle -Language $selectedLanguage -ProjectName $projectName
                return
            }
        }
    }
}
