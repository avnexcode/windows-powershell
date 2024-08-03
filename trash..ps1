function Convert-SecureStringToPlainText {
    param ([SecureString]$SecureString)
    return [Runtime.InteropServices.Marshal]::PtrToStringAuto([Runtime.InteropServices.Marshal]::SecureStringToBSTR($SecureString))
}

function Open-Location {
    param ([string]$Location, [int]$Count)
    $paths = @{
        "secret" = "E:\Axnvee\Pictures\Screenshots\Something You Can't Open It\code-avnexeed\02"
        "movie" = "E:\Axnvee\Movies"
        "code" = "D:\Code"
    }
    
    if ($paths.ContainsKey($Location)) {
        for ($i = 1; $i -le $Count; $i++) {
            Start-Process "explorer.exe" $paths[$Location]
        }
        return $true
    }
    return $false
}

function Validate-Credentials {
    param (
        [SecureString]$Username,
        [SecureString]$Password,
        [SecureString]$Location,
        [SecureString]$Count
    )

    $plainUsername = Convert-SecureStringToPlainText $Username
    $plainPassword = Convert-SecureStringToPlainText $Password
    $plainLocation = Convert-SecureStringToPlainText $Location
    $plainCount = Convert-SecureStringToPlainText $Count

    if ($plainUsername -ne "axnvee" -or $plainPassword -ne "188216") {
        Write-Host "Access denied" -ForegroundColor Red
        return
    }

    if (-not [int]::TryParse($plainCount, [ref]$null)) {
        Write-Host "Invalid count. Please enter a number." -ForegroundColor Red
        return
    }

    $countInt = [int]$plainCount
    if (Open-Location -Location $plainLocation -Count $countInt) {
        Write-Host "Access granted" -ForegroundColor Green
    } else {
        Write-Host "Invalid location. Access denied." -ForegroundColor Red
    }
}

function Request-Credentials {
    $username = Read-Host "Username" -AsSecureString
    $password = Read-Host "Password" -AsSecureString
    $location = Read-Host "Location" -AsSecureString
    $count = Read-Host "Count" -AsSecureString

    Validate-Credentials -Username $username -Password $password -Location $location -Count $count
}