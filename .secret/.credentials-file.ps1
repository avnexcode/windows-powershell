
function Credentials {
    param (
        [SecureString]$username,
        [SecureString]$password,
        [SecureString]$location,
        [SecureString]$count
    )

    $plainPassword = [Runtime.InteropServices.Marshal]::PtrToStringAuto([Runtime.InteropServices.Marshal]::SecureStringToBSTR($password))
    $plainUsername = [Runtime.InteropServices.Marshal]::PtrToStringAuto([Runtime.InteropServices.Marshal]::SecureStringToBSTR($username))
    $plainLocation = [Runtime.InteropServices.Marshal]::PtrToStringAuto([Runtime.InteropServices.Marshal]::SecureStringToBSTR($location))
    $plainCount = [Runtime.InteropServices.Marshal]::PtrToStringAuto([Runtime.InteropServices.Marshal]::SecureStringToBSTR($count))

    if ($plainUsername -eq "axnvee" -and $plainPassword -eq "188216") {
        if ($plainLocation -eq "secret") {
            Write-Host "Access granted" -ForegroundColor Green
            for ($i = 1; $i -le $plainCount; $i++) {
                Start-Process "explorer.exe" "E:\Axnvee\Pictures\Screenshots\Something You Can't Open It\code-avnexeed\02"
            }
        }
        elseif ($plainLocation -eq "movie") {
            Write-Host "Access granted" -ForegroundColor Green
            for ($i = 1; $i -le $plainCount; $i++) {
                Start-Process "explorer.exe" "E:\Axnvee\Movies"
            }
        }
        elseif ($plainLocation -eq "code") {
            Write-Host "Access granted" -ForegroundColor Green
            for ($i = 1; $i -le $plainCount; $i++) {
                Start-Process "explorer.exe" "D:\Code"
            }
        }
        else {
            Write-Host "Invalid location. Access denied." -ForegroundColor Red
        }
    }
    else {
        Write-Host "Access denied" -ForegroundColor Red
    }
}

function located {
    $username = Read-Host "username" -AsSecureString
    $password = Read-Host "password" -AsSecureString
    $location = Read-Host "location" -AsSecureString
    $count = Read-Host "count" -AsSecureString

    Credentials -username $username -password $password -location $location -count $count
}