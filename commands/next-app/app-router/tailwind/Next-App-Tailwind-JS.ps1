function NextAppTailwindJS {
    param (
        [Parameter(Mandatory = $true)]
        [string]$Project_Name
    )
    
    $Project_Name = $Project_Name.ToLower().Replace(" ", "-")
    pnpm create next-app@latest $Project_Name --js --eslint --tailwind --src-dir --app --import-alias "@/*"
    Set-Location $Project_Name
    # Package Installer
    NextPackageJS

    "src/components/elements", "src/components/fragments", "src/components/layouts", "src/libs", "src/libs/axios", "src/features", "src/features/product", "src/features/user", "public/assets/images", "public/assets/videos", "public/assets/audios" | ForEach-Object { New-Item -Path $_ -ItemType Directory -Force }

    $providersContent = @"
"use client"
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
import { Inter } from "next/font/google";
import "./globals.css";
import Providers from "@/components/layouts/Providers";

const inter = Inter({ subsets: ["latin"] });

export const metadata = {
  title: "Create Next App",
  description: "Generated by create next app",
};

export default function RootLayout({ children }) {
  return (
    <html lang="en">
      <body className={inter.className}>
        <Providers>{children}</Providers>
      </body>
    </html>
  );
}
"@
    Set-Content -Path src/app/layout.js -Value $appJsxLayout

    $appJsxContent = @"
export default function App() {
    return (
        <div className="bg-blue-500 text-white p-4 w-full h-screen flex justify-center items-center flex-col gap-5">
            <h1 className="text-3xl font-bold uppercase">Avnexcode</h1>
            <h1 className="text-3xl font-bold"><span className="uppercase">Prot Prot</span> Builder</h1>
            <h1 className="text-3xl font-bold">Next JS App Router x TailwindCSS Builder</h1>
        </div>
    );
}
"@        
    Set-Content -Path src/app/page.js -Value $appJsxContent
    
    $indexCssContent = @"
@tailwind base;
@tailwind components;
@tailwind utilities;
"@

    Set-Content -Path src/app/globals.css -Value $indexCssContent

    code .
    pnpm run dev
}