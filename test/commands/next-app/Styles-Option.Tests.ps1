# File: Styles-Option.Tests.ps1
Describe "Next-App Styles Option Tests" {
    It "ChooseStyle should execute without error" {
        { ChooseStyle } | Should -Not -Throw
    }

    It "Show-Menu should execute without error" {
        { Show-Menu } | Should -Not -Throw
    }
}
