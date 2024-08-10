function ReactBaseTS {
    param (
        [Parameter(Mandatory = $true)]
        [string]$Project_Name
    )

    $Project_Name = $Project_Name.ToLower().Replace(" ", "-")

    pnpm create vite $Project_Name --template react-ts
    Set-Location $Project_Name
    pnpm install
    # Package Installer
    ReactPackageTS

    "src/components/elements", "src/components/fragments", "src/components/layouts", "src/libs", "src/libs/axios", "src/features", "src/features/product", "src/features/user", "src/types", "src/pages", "public/assets/images", "public/assets/videos", "public/assets/audios" | ForEach-Object { New-Item -Path $_ -ItemType Directory -Force }

    Remove-Item -Path src/App.css

    $appTsxContent = @"
export default function App() {
    return (
        <div className="container">
            <h1 className="title">Avnexcode</h1>
            <h1 className="title"><span>Prot Prot</span> Builder</h1>
            <h1 className="title">Next JS App Router Builder</h1>
        </div>
    );
}
"@
    Set-Content -Path src/App.tsx -Value $appTsxContent

    $providersTsxContent = @"
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
    Set-Content -Path src/components/layouts/Providers.tsx -Value $providersTsxContent

    $mainTsxContent = @"
import React from 'react'
import ReactDOM from 'react-dom/client'
import App from './App.tsx'
import './index.css'
import Providers from "./components/layouts/Providers.tsx"

ReactDOM.createRoot(document.getElementById('root')!).render(
  <React.StrictMode>
    <Providers>
      <App />
    </Providers>
  </React.StrictMode>,
)
"@
    Set-Content -Path src/main.tsx -Value $mainTsxContent

    $indexCssContent = @"
* {
margin: 0;
padding: 0;
box-sizing: border-box;
}

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
    Set-Content -Path src/index.css -Value $indexCssContent
    
    code .
    pnpm run dev
}