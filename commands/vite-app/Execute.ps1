function Execute-ViteAppCommand {
    param (
        [string]$Framework,
        [string]$Style,
        [string]$Language,
        [string]$ProjectName
    )

    $functionName = "$Framework-$Style-$Language"

    $function = Get-Command -Name $functionName -ErrorAction SilentlyContinue

    if ($function) {
        & $function -Project_Name $ProjectName
    } else {
        Write-Host "Function $functionName not found or not implemented yet."
    }
}