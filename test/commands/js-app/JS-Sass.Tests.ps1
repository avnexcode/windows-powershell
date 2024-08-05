# File: JS-Sass.Tests.ps1
Describe "JS-Sass Tests" {
    It "JSSass should execute without error" {
        { JSSass } | Should -Not -Throw
    }
}
