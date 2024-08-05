function NextAppTailwindTS {
    param (
        [Parameter(Mandatory = $true)]
        [string]$Project_Name
    )

    $Project_Name = $Project_Name.ToLower().Replace(" ", "-")
    pnpm create next-app@latest $Project_Name --ts --eslint --tailwind --src-dir --app --import-alias "@/*"
    Set-Location $Project_Name
    # Package Installer
    NextPackageTS

    "src/components/elements", "src/components/fragments", "src/components/layouts", "src/libs", "src/libs/axios", "src/features", "src/features/product", "src/features/user", "src/types", "public/assets/images", "public/assets/videos", "public/assets/audios" | ForEach-Object { New-Item -Path $_ -ItemType Directory -Force }

    $providersContent = @"
"use client"
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
    Set-Content -Path src/app/Providers.tsx -Value $providersContent

    $apptsxLayout = @"
import type { Metadata } from "next";
import { Inter } from "next/font/google";
import "./globals.css";
import Providers from "./Providers";

const inter = Inter({ subsets: ["latin"] });

export const metadata: Metadata = {
  title: "Create Next App",
  description: "Generated by create next app",
};

export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return (
    <html lang="en">
      <body className={inter.className}>
        <Providers>{children}</Providers>
      </body>
    </html>
  );
}
"@
    Set-Content -Path src/app/layout.tsx -Value $appTsxLayout

    $appTsxContent = @"
export default function App() {
    return (
<div className="bg-blue-500 text-white p-4 w-full h-screen flex justify-center items-center flex-col gap-5">
    <h1 className="text-3xl font-bold uppercase">Avnexcode</h1>
    <h1 className="text-3xl font-bold"><span className="uppercase">Prot Prot</span> Builder</h1>
    <h1 className="text-3xl font-bold">Next TS App Router x TailwindCSS Builder</h1>
</div>
    );
}
"@    
    Set-Content -Path src/app/page.tsx -Value $appTsxContent    

    $indexCssContent = @"
@tailwind base;
@tailwind components;
@tailwind utilities;
"@
    Set-Content -Path src/app/globals.css -Value $indexCssContent

    code .
    pnpm run dev
}