# File: Routers-Option.Tests.ps1
Describe "Next-App Routers Option Tests" {
    It "ChooseRouter should execute without error" {
        { ChooseRouter } | Should -Not -Throw
    }

    It "Show-Menu should execute without error" {
        { Show-Menu } | Should -Not -Throw
    }
}
