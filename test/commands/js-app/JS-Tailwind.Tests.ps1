# File: JS-Tailwind.Tests.ps1
Describe "JS-Tailwind Tests" {
    It "JSTailwind should execute without error" {
        { JSTailwind() } | Should -Not -Throw
    }
}
