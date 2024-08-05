# File: Options.Tests.ps1
Describe "Next-App Options Tests" {
    It "Initialize-NextApp should execute without error" {
        { Initialize-NextApp } | Should -Not -Throw
    }
}
