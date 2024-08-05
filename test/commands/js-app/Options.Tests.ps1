# File: Options.Tests.ps1
Describe "JS-App Options Tests" {
    It "Initialize-JSProject should execute without error" {
        { Initialize-JSProject } | Should -Not -Throw
    }

    It "Show-Menu should execute without error" {
        { Show-Menu } | Should -Not -Throw
    }
}
