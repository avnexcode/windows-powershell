function React-Tailwind-JS {
    param (
        [Parameter(Mandatory = $true)]
        [string]$Project_Name
    )

    $Project_Name = $Project_Name.ToLower().Replace(" ", "_")

    pnpm create vite $Project_Name --template react
    Set-Location $Project_Name
    pnpm install
    pnpm add -D tailwindcss postcss autoprefixer
    pnpm add axios @tanstack/react-query formik react-router-dom react-icons
    npx tailwindcss init -p

    "src/components/elements", "src/components/fragments", "src/components/layouts", "src/libs", "src/libs/axios", "src/features", "src/features/product", "src/features/user", "src/pages", "public/assets/images", "public/assets/videos", "public/assets/audios" | ForEach-Object { New-Item -Path $_ -ItemType Directory -Force }

    Remove-Item -Path src\App.css
    New-Item -Path src\components\Providers.tsx

    $appJsxContent = @"
export default function App() {
    return (
        <div className="bg-blue-500 text-white p-4 w-full h-screen flex justify-center items-center flex-col gap-5">
            <h1 className="text-3xl font-bold uppercase">Avnexcode</h1>
            <h1 className="text-3xl font-bold"><span className="uppercase">Prot Prot</span> Builder</h1>
            <h1 className="text-3xl font-bold">React JS Vite x TailwindCSS Builder</h1>
        </div>
    );
}
"@

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

    $indexCssContent = @"
@tailwind base;
@tailwind components;
@tailwind utilities;
"@
    Set-Content -Path src\App.jsx -Value $appJsxContent
    Set-Content -Path tailwind.config.js -Value $tailwindConfigContent
    Set-Content -Path src\components\Providers.tsx -Value $providersJsxContent
    Set-Content -Path src\main.tsx -Value $mainJsxContent
    Set-Content -Path src\index.css -Value $indexCssContent
    code .
    pnpm run dev
}