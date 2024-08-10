function exp {
    param ( [Parameter(Mandatory = $false)] [string]$Path )
    if ([string]::IsNullOrWhiteSpace($Path)) {
        Start-Process "explorer" 
    }
    else {
        Start-Process "explorer" $Path 
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

function pings {
    ping 8.8.8.8 -t
}

function chr {
    Start-Process "chrome"
}

function dc {
    Start-Process "C:\Users\axnve\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Discord Inc\Discord"
}

function wa {
    Start-Process "shell:AppsFolder\5319275A.WhatsAppDesktop_cv1g1gvanyjgm!App"
}   

function spt {
    Start-Process "C:\Users\axnve\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Spotify"
}

function obs {
    Start-Process "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\OBS Studio\OBS Studio (64bit)"
}

function startall {
    dc
    spt
    chr
    wa
    exp
}