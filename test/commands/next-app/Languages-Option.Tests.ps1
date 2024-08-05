# File: Languages-Option.Tests.ps1
Describe "Next-App Languages Option Tests" {
    It "ChooseLanguage should execute without error" {
        { ChooseLanguage } | Should -Not -Throw
    }

    It "Show-Menu should execute without error" {
        { Show-Menu } | Should -Not -Throw
    }
}
