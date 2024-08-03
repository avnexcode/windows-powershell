function NextAppBaseJS {
    param (
        [Parameter(Mandatory = $true)]
        [string]$Project_Name
    )
    
    $Project_Name = $Project_Name.ToLower().Replace(" ", "_")
    pnpm create next-app@latest $Project_Name --js --eslint --no-tailwind --src-dir --app --import-alias "@/*"
}