# File: Microsoft.PowerShell_profile.Tests.ps1
Describe "Microsoft.PowerShell_profile Tests" {
    # Test for Show-Commands function
    It "Show-Commands should execute without error" {
        { Show-Commands } | Should -Not -Throw
    }

    # Test for Show-Menu function
    It "Show-Menu should execute without error" {
        { Show-Menu } | Should -Not -Throw
    }

    # Test for calling functions from other scripts
    It "Should call functions from other scripts without error" {
        # Example: Call a function from Git-Aliases.ps1
        { gs } | Should -Not -Throw
        { ga } | Should -Not -Throw
        { gc } | Should -Not -Throw
        # Add more calls as necessary for other functions
    }
}
