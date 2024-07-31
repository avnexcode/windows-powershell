function React-TS {
    param (
        [Parameter(Mandatory = $true)]
        [string]$Project_Name
    )

    $Project_Name = $Project_Name.ToLower().Replace(" ", "_")

    pnpm create vite $Project_Name --template react-ts
    Set-Location $Project_Name
    pnpm install
    pnpm add axios @tanstack/react-query formik react-router-dom @types/react-router-dom react-icons

    "src/components/elements", "src/components/fragments", "src/components/layouts", "src/libs", "src/libs/axios", "src/features", "src/features/product", "src/features/user", "src/types", "src/pages", "public/assets/images", "public/assets/videos", "public/assets/audios" | ForEach-Object { New-Item -Path $_ -ItemType Directory -Force }

    Remove-Item -Path src\App.css

    $appTsxContent = @"
export default function App() {
    return (
        <div className="bg-blue-500 text-white p-4 w-full h-screen flex justify-center items-center flex-col gap-5">
            <h1 className="text-3xl font-bold uppercase">Avnexcode</h1>
            <h1 className="text-3xl font-bold"><span className="uppercase">Prot Prot</span> Builder</h1>
            <h1 className="text-3xl font-bold">React TS Vite x TailwindCSS Builder</h1>
        </div>
    );
}
"@
    Set-Content -Path src\App.tsx -Value $appTsxContent

    $indexCssContent = @"
"@
    Set-Content -Path src\index.css -Value $indexCssContent
    code .
    pnpm run dev
}