function NextPageTailwindJS {
    param (
        [Parameter(Mandatory = $true)]
        [string]$Project_Name
    )

    $Project_Name = $Project_Name.ToLower().Replace(" ", "-")
    pnpm create next-app@latest $Project_Name --js --eslint --tailwind --src-dir --no-app --import-alias "@/*"
    Set-Location $Project_Name
    # Package Installer
    NextPackageJS

    "src/components/elements", "src/components/fragments", "src/components/layouts", "src/libs", "src/libs/axios", "src/features", "src/features/product", "src/features/user", "public/assets/images", "public/assets/videos", "public/assets/audios" | ForEach-Object { New-Item -Path $_ -ItemType Directory -Force }

    $providersContent = @"
import { QueryClient, QueryClientProvider } from '@tanstack/react-query'

const queryClient = new QueryClient()

export default function Providers({ children }) {
    return (
        <QueryClientProvider client={queryClient}>
            {children}
        </QueryClientProvider>
    )
}
"@
    Set-Content -Path src/components/layouts/Providers.js -Value $providersContent


    $appJsxLayout = @"
import "@/styles/globals.css";
import type { AppProps } from "next/app";
import Providers from "@/components/layouts/Providers";

export default function App({ Component, pageProps }: AppProps) {
  return <Providers><Component {...pageProps} /></Providers>;
}

"@        
    Set-Content -Path src/pages/_app.js -Value $appJsxLayout

    $appJsxContent = @"
export default function App() {
    return (
        <div className="bg-blue-500 text-white p-4 w-full h-screen flex justify-center items-center flex-col gap-5">
            <h1 className="text-3xl font-bold uppercase">Avnexcode</h1>
            <h1 className="text-3xl font-bold"><span className="uppercase">Prot Prot</span> Builder</h1>
            <h1 className="text-3xl font-bold">Next JS Page Router x TailwindCSS Builder</h1>
        </div>
    );
}
"@        

    $indexCssContent = @"
@tailwind base;
@tailwind components;
@tailwind utilities;
"@
    Set-Content -Path src/pages/index.js -Value $appJsxContent
    Set-Content -Path src/styles/globals.css -Value $indexCssContent
    code .
    pnpm run dev
}