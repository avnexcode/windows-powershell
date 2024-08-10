function gs { git status }

function ga {
    param (
        [Parameter(Mandatory = $true, ValueFromRemainingArguments = $true)]
        [string[]]$Paths
    )
    git add @Paths
}

function gcam {
    param (
        [Parameter(Mandatory = $true, ValueFromRemainingArguments = $true)]
        [string[]]$Message
    )
    git commit -am @Message
}

function gco {
    param (
        [Parameter(Mandatory = $true, ValueFromRemainingArguments = $true)]
        [string[]]$Branch
    )
    git checkout @Branch
}

function gb { git branch }

function gcl {
    param (
        [Parameter(Mandatory = $true, ValueFromRemainingArguments = $true)]
        [string[]]$Repository
    )
    git clone @Repository
}

function gpl { git pull }

function gpsh { 
    param (
        [Parameter(Mandatory = $true, ValueFromRemainingArguments = $true)]
        [string[]]$Branch
    )
    git push -u origin @Branch
}

# function gd {
#     param (
#         [Parameter(ValueFromRemainingArguments = $true)]
#         [string[]]$Paths
#     )
#     git diff $Paths
# }

function glog {
    param (
        [Parameter(ValueFromRemainingArguments = $true)]
        [string[]]$Arguments
    )
    git log @Arguments
}

# # Alias untuk operasi Git yang sering digunakan
function gcb {
    param (
        [Parameter(Mandatory = $true)]
        [string]$Branch
    )
    git checkout -b $Branch
}

# function gbd {
#     param (
#         [Parameter(Mandatory = $true)]
#         [string]$Branch
#     )
#     git branch -d $Branch
# }
# function gbD {
#     param (
#         [Parameter(Mandatory = $true)]
#         [string]$Branch
#     )
#     git branch -D $Branch
# }
# function gpf { git push --force }

# # Alias untuk penggabungan (merge) dan rebasing
# function gm {
#     param (
#         [Parameter(ValueFromRemainingArguments = $true)]
#         [string[]]$Arguments
#     )
#     git merge $Arguments
# }
# function gr {
#     param (
#         [Parameter(ValueFromRemainingArguments = $true)]
#         [string[]]$Arguments
#     )
#     git rebase $Arguments
# }
# function gri { git rebase -i }
# function grc { git rebase --continue }
# function gra { git rebase --abort }

# # Alias untuk pengelolaan remote
# function grem { git remote }
# function gset {
#     param (
#         [Parameter(Mandatory = $true)]
#         [string]$RemoteName,
#         [Parameter(Mandatory = $true)]
#         [string]$URL
#     )
#     git remote set-url $RemoteName $URL
# }
# function gpr { git pull --rebase }

# # Alias untuk tindakan tambahan
# function gundo { git reset --soft HEAD^ }
# function grs { git reset --hard HEAD }
# function gcln { git clean -df }

# Alias Others
function graph {
    git log --all --oneline --decorate --graph
  }
  
function gfp () {
    param (
          [Parameter(Mandatory = $true)]
          [string]$Message
      )
    git add .
    git commit -am $Message
    git push -u origin main
  }