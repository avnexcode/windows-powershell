function NextPageChakraUIJS {
    param (
        [Parameter(Mandatory = $true)]
        [string]$Project_Name
    )

    $Project_Name = $Project_Name.ToLower().Replace(" ", "-")
    pnpm create next-app@latest $Project_Name --js --eslint --tailwind --src-dir --no-app --import-alias "@/*"
    Set-Location $Project_Name
    # Style  Installer
    pnpm add @chakra-ui/react @emotion/react @emotion/styled framer-motion
    # Package Installer
    NextPackageJS

    "src/components/elements", "src/components/fragments", "src/components/layouts", "src/libs", "src/libs/axios", "src/features", "src/features/product", "src/features/user", "public/assets/images", "public/assets/videos", "public/assets/audios" | ForEach-Object { New-Item -Path $_ -ItemType Directory -Force }

    $providersContent = @"
import { ChakraProvider } from '@chakra-ui/react'
import { QueryClient, QueryClientProvider } from '@tanstack/react-query'

const queryClient = new QueryClient()

export default function Providers({ children }) {
    return (
        <QueryClientProvider client={queryClient}>
            <ChakraProvider>
                {children}
            </ChakraProvider>
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
import { Flex, Heading, Text } from "@chakra-ui/react";

export default function App() {
    return (
        <Flex justify={"center"} align={"center"} direction={"column"} color={"white"} backgroundColor={"blue"} gap={"8px"} h={"100vh"} w={"100%"} p={"5px"}>
            <Heading>Avnexcode</Heading>
            <Text><span className="uppercase">Prot Prot</span> Builder</Text>
            <Text>Next TS App Router x Chakra UI Builder</Text>
        </Flex>
    );
}
"@        
    Set-Content -Path src/pages/index.js -Value $appJsxContent

    $indexCssContent = @"
"@
    Set-Content -Path src/styles/globals.css -Value $indexCssContent

    code .
    pnpm run dev
}