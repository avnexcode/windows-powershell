# File: Execute.Tests.ps1
Describe "Next-App Execute Tests" {
    It "Initialize-NextAppCommand should execute without error" {
        { Initialize-NextAppCommand } | Should -Not -Throw
    }
}
