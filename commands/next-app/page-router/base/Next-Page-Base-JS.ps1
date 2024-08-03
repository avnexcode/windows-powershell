function NextPageBaseJS {
    param (
        [Parameter(Mandatory = $true)]
        [string]$Project_Name
    )
    
    $Project_Name = $Project_Name.ToLower().Replace(" ", "_")
    pnpm create next-app@latest $Project_Name --js --eslint --no-tailwind --src-dir --no-app --import-alias "@/*"

}