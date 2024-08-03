function exp {
    param ( [Parameter(Mandatory = $false)] [string]$Path )
    if ([string]::IsNullOrWhiteSpace($Path)) {
        Start-Process "explorer.exe" 
    }
    else {
        Start-Process "explorer.exe" $Path 
    }
}

function c {
    param ( [Parameter(Mandatory = $false)] [string]$Path )
    if ([string]::IsNullOrWhiteSpace($Path)) {
        code 
    }
    else {
        code $Path 
    }
}

function p {
    param (
        [Parameter(Mandatory = $false, ValueFromRemainingArguments = $true)]
        [string[]]$Command
    )

    if ($null -eq $Command -or $Command.Count -eq 0) {
        pnpm --help
    }
    else {
        pnpm @Command
    }
}

function g {
    param (
        [Parameter(Mandatory = $false, ValueFromRemainingArguments = $true)]
        [string[]]$Command
    )

    if ($null -eq $Command -or $Command.Count -eq 0) {
        git --help
    }
    else {
        git @Command
    }
}

function dup {
    param (
        [Parameter(Mandatory = $false, ValueFromRemainingArguments = $true)]
        [string[]]$Command
    )

    if ($null -eq $Command -or $Command.Count -eq 0) {
        docker-compose up
    } else {
        docker-compose up @Command
    }
}

function ddown {
    param (
        [Parameter(Mandatory = $false, ValueFromRemainingArguments = $true)]
        [string[]]$Command
    )

    if ($null -eq $Command -or $Command.Count -eq 0) {
        docker-compose down
    } else {
        docker-compose down @Command
    }
}

function pingg {
    ping 8.8.8.8 -t
}
