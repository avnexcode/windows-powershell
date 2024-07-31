. ~/.windows-setup/commands/php-app/directory.ps1
function PHPBasic() {
    param (
        [Parameter(Mandatory = $true)]
        [string]$Project_Name
    )

    $Project_Name = $Project_Name.ToLower().Replace(" ", "_")
    
    mkdir $Project_Name
    Set-Location $Project_Name

    New-Item index.php
    New-Item README.MD

    Write-Output "# Project Name" >> README.md
    Write-Output "This is a project structure by MFNA." >> README.md
    
    $dirs | ForEach-Object { New-Item -Path $_ -ItemType Directory -Force }
    mkdir ./src/sass
    
    $files | ForEach-Object { New-Item -Path $_ -ItemType File -Force }
    New-Item ./src/sass/main.scss
}