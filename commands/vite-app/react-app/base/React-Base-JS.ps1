function ReactBaseJS {
    param (
        [Parameter(Mandatory = $true)]
        [string]$Project_Name
    )

    $Project_Name = $Project_Name.ToLower().Replace(" ", "-")

    pnpm create vite $Project_Name --template react
    Set-Location $Project_Name
    pnpm install
    # Package Installer
    ReactPackageJS

    "src/components/elements", "src/components/fragments", "src/components/layouts", "src/libs", "src/libs/axios", "src/features", "src/features/product", "src/features/user", "src/pages", "public/assets/images", "public/assets/videos", "public/assets/audios" | ForEach-Object { New-Item -Path $_ -ItemType Directory -Force }

    Remove-Item -Path src\App.css

    $appJsxContent = @"
export default function App() {
    return (
        <div class="container">
            <h1 class="title">Avnexcode</h1>
            <h1 class="title"><span>Prot Prot</span> Builder</h1>
            <h1 class="title">Next JS App Router Builder</h1>
        </div>
    );
}
"@
    Set-Content -Path src\App.jsx -Value $appJsxContent

    $providersJsxContent = @"
/* eslint-disable react/prop-types */
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
    Set-Content -Path src\components\Providers.jsx -Value $providersJsxContent

    $mainJsxContent = @"
import React from 'react'
import ReactDOM from 'react-dom/client'
import App from './App.jsx'
import './index.css'
import Providers from "./components/Providers.jsx"

ReactDOM.createRoot(document.getElementById('root')).render(
  <React.StrictMode>
    <Providers>
      <App />
    </Providers>
  </React.StrictMode>,
)
"@
    Set-Content -Path src\main.jsx -Value $mainJsxContent

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
    Set-Content -Path src\index.css -Value $indexCssContent

    code .
    pnpm run dev
}