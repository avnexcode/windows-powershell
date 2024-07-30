# Zoxide Initialization
Invoke-Expression (& { (zoxide init powershell | Out-String) })

# Zoxide Query Theme
$env:FZF_DEFAULT_OPTS = "--color=fg:#f8f8f2,bg:#282a36,hl:#bd93f9 --color=fg+:#f8f8f2,bg+:#44475a,hl+:#bd93f9 --color=info:#ffb86c,prompt:#50fa7b,pointer:#ff79c6 --color=marker:#ff79c6,spinner:#ffb86c"

# Zoxide Query
function zox {
    $selected = & zoxide query -l | fzf --height 70% --border
    if ($selected) {
        Set-Location $selected
    }
}