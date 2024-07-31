# Next Page Typescript Function Builder
function Next-Page-Chakra-TS {
    param (
        [Parameter(Mandatory = $true)]
        [string]$Project_Name
    )

    $Project_Name = $Project_Name.ToLower().Replace(" ", "_")

    pnpm create next-app@latest $Project_Name --ts --eslint --tailwind --src-dir --no-app --import-alias "@/*"

    Set-Location $Project_Name
    pnpm add axios @tanstack/react-query formik react-router-dom react-icons

    "src/components/elements", "src/components/fragments", "src/components/layouts", "src/libs", "src/libs/axios", "src/features", "src/features/product", "src/features/user", "src/types", "public/assets/images", "public/assets/videos", "public/assets/audios" | ForEach-Object { New-Item -Path $_ -ItemType Directory -Force }

    $appJsxContent = @"
export default function App() {
    return (
<div className="bg-blue-500 text-white p-4 w-full h-screen flex justify-center items-center flex-col gap-5">
    <h1 className="text-3xl font-bold uppercase">Avnexcode</h1>
    <h1 className="text-3xl font-bold"><span className="uppercase">Prot Prot</span> Builder</h1>
    <h1 className="text-3xl font-bold">Next TS Page Router x TailwindCSS Builder</h1>
</div>
    );
}
"@        
    Set-Content -Path src\pages\index.tsx -Value $appJsxContent

    $indexCssContent = @"
@tailwind base;
@tailwind components;
@tailwind utilities;
"@
    Set-Content -Path src\styles\globals.css -Value $indexCssContent
    code .
    Start-Process "http://localhost:3000"
    pnpm run dev
}