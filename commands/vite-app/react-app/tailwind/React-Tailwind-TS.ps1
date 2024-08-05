function ReactTailwindTS {
    param (
        [Parameter(Mandatory = $true)]
        [string]$Project_Name
    )

    $Project_Name = $Project_Name.ToLower().Replace(" ", "-")

    pnpm create vite $Project_Name --template react-ts
    Set-Location $Project_Name
    pnpm install
    # Style Installer
    pnpm add -D tailwindcss postcss autoprefixer
    # Package Installer
    ReactPackageTS
    npx tailwindcss init -p

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
    
    $tailwindConfigContent = @"
/** @type {import('tailwindcss').Config} */
export default {
  content: [
    './index.html',
    './src/**/*.{js,ts,jsx,tsx}',
  ],
  theme: {
    extend: {},
  },
  plugins: [],
}
"@
    Set-Content -Path tailwind.config.js -Value $tailwindConfigContent

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
    Set-Content -Path src\components\Providers.tsx -Value $providersTsxContent
    
    $mainTsxContent = @"
import React from 'react'
import ReactDOM from 'react-dom/client'
import App from './App.tsx'
import './index.css'
import Providers from "./components/Providers.tsx"

ReactDOM.createRoot(document.getElementById('root')!).render(
  <React.StrictMode>
    <Providers>
      <App />
    </Providers>
  </React.StrictMode>,
)
"@
    Set-Content -Path src\main.tsx -Value $mainTsxContent

    $indexCssContent = @"
@tailwind base;
@tailwind components;
@tailwind utilities;
"@
    Set-Content -Path src\index.css -Value $indexCssContent

    code .
    pnpm run dev
}