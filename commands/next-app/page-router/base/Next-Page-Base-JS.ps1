function NextPageBaseJS {
    param (
        [Parameter(Mandatory = $true)]
        [string]$Project_Name
    )
    
    $Project_Name = $Project_Name.ToLower().Replace(" ", "-")
    pnpm create next-app@latest $Project_Name --js --eslint --no-tailwind --src-dir --no-app --import-alias "@/*"
    Set-Location $Project_Name
    # Package Installer
    NextPackageJS

    "src/components/elements", "src/components/fragments", "src/components/layouts", "src/libs", "src/libs/axios", "src/features", "src/features/product", "src/features/user", "public/assets/images", "public/assets/videos", "public/assets/audios" | ForEach-Object { New-Item -Path $_ -ItemType Directory -Force }

    $providersContent = @"
import { QueryClient, QueryClientProvider } from '@tanstack/react-query'

const queryClient = new QueryClient()

export default function Providers({ children }) {
    return (
        <>
            <QueryClientProvider client={queryClient}>
                {children}
            </QueryClientProvider>
        </>
    )
}
"@
    Set-Content -Path src/components/Providers.js -Value $providersContent

    $appJsxLayout = @"
import "@/styles/globals.css";
import type { AppProps } from "next/app";
import Providers from "@/components/Providers";

export default function App({ Component, pageProps }: AppProps) {
  return <Providers><Component {...pageProps} /></Providers>;
}

"@        
    Set-Content -Path src/pages/_app.js -Value $appJsxLayout

    $appJsxContent = @"
export default function App() {
    return (
        <div className="container">
            <h1 className="title">Avnexcode</h1>
            <h1 className="title"><span>Prot Prot</span> Builder</h1>
            <h1 className="title">Next JS Page Router x TailwindCSS Builder</h1>
        </div>
    );
}
"@
    Set-Content -Path src/pages/index.js -Value $appJsxContent

    $indexCssContent = @"
.container {
    background-color: #3b82f6; /* bg-blue-500 */
    color: white; /* text-white */
    padding: 1rem; /* p-4 */
    width: 100%; /* w-full */
    height: 100vh; /* h-screen */
    display: flex;
    justify-content: center;
    align-items: center;
    flex-direction: column;
    gap: 1.25rem; /* gap-5 */
}

.title {
    font-size: 1.875rem; /* text-3xl */
    font-weight: bold; /* font-bold */
    text-transform: uppercase; /* uppercase */
}

.title span {
    text-transform: uppercase; /* uppercase */
}
"@
    Set-Content -Path src/styles/globals.css -Value $indexCssContent

    code .
    pnpm run dev

}