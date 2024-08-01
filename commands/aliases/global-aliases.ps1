function exp {
    param (
        [Parameter(Mandatory = $true)]
        [string]$Path
    )
    Start-Process "explorer.exe" $Path
}

function c {
    param (
        [Parameter(Mandatory = $true)]
        [string]$Path
    )
    code $Path
}