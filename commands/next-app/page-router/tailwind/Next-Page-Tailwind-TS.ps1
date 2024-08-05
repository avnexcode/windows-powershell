function NextPageTailwindTS {
    param (
        [Parameter(Mandatory = $true)]
        [string]$Project_Name
    )

    $Project_Name = $Project_Name.ToLower().Replace(" ", "-")
    pnpm create next-app@latest $Project_Name --ts --eslint --tailwind --src-dir --no-app --import-alias "@/*"
    Set-Location $Project_Name
    # Package Installer
    NextPackageTS

    "src/components/elements", "src/components/fragments", "src/components/layouts", "src/libs", "src/libs/axios", "src/features", "src/features/product", "src/features/user", "src/types", "public/assets/images", "public/assets/videos", "public/assets/audios" | ForEach-Object { New-Item -Path $_ -ItemType Directory -Force }

    $providersContent = @"
import { QueryClient, QueryClientProvider } from '@tanstack/react-query'

const queryClient = new QueryClient()

type ProvidersProps = {
    children: React.ReactNode
}

export default function Providers({ children }: ProvidersProps) {
    return (
        <QueryClientProvider client={queryClient}>
            {children}
        </QueryClientProvider>
    )
}
"@
    Set-Content -Path src/components/Providers.tsx -Value $providersContent

    $appTsxLayout = @"
import "@/styles/globals.css";
import type { AppProps } from "next/app";
import Providers from "@/components/Providers";

export default function App({ Component, pageProps }: AppProps) {
  return <Providers><Component {...pageProps} /></Providers>;
}

"@        
    Set-Content -Path src/pages/_app.tsx -Value $appTsxContent

    $appTsxContent = @"
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

    $indexCssContent = @"
@tailwind base;
@tailwind components;
@tailwind utilities;
"@
    Set-Content -Path src/pages/index.tsx -Value $appTsxContent
    Set-Content -Path src/styles/globals.css -Value $indexCssContent
    code .
    pnpm run dev
}