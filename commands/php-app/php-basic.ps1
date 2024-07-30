function PHPBasic() {
    param (
        [Parameter(Mandatory = $true)]
        [string]$Project_Name
    )
    mkdir $Project_Name
    Set-Location $Project_Name

    New-Item index.php
    New-Item README.MD

    Write-Output "# Project Name" >> README.md
    Write-Output "This is a project structure by MFNA." >> README.md
}