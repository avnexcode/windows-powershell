# File: Global-Aliases.Tests.ps1
Describe "Global-Aliases Tests" {
    It "exp should execute without error" {
        { exp } | Should -Not -Throw
    }

    It "c should execute without error" {
        { c } | Should -Not -Throw
    }

    It "p should execute without error" {
        { p } | Should -Not -Throw
    }

    It "g should execute without error" {
        { g } | Should -Not -Throw
    }

    It "pingg should execute without error" {
        { pingg } | Should -Not -Throw
    }
}
