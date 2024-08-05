# File: JS-Base.Tests.ps1
Describe "JS-Base Tests" {
    It "JSBase should execute without error" {
        { JSBase() } | Should -Not -Throw
    }
}
