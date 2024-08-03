function Initialize-NextAppCommand {
    param (
        [string]$Router,
        [string]$Style,
        [string]$Language,
        [string]$ProjectName
    )

    $functionName = "Next$Router$Style$Language"

    $function = Get-Command -Name $functionName -ErrorAction SilentlyContinue

    if ($function) {
        & $function -Project_Name $ProjectName
    } else {
        Write-Host "Function $functionName not found or not implemented yet."
    }
}