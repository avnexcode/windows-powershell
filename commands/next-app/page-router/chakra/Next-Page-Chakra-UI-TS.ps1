function NextPageChakraUITS {
    param (
        [Parameter(Mandatory = $true)]
        [string]$Project_Name
    )

    $Project_Name = $Project_Name.ToLower().Replace(" ", "-")
    pnpm create next-app@latest $Project_Name --ts --eslint --tailwind --src-dir --no-app --import-alias "@/*"
    Set-Location $Project_Name
    # Style  Installer
    pnpm add @chakra-ui/react @emotion/react @emotion/styled framer-motion
    # Package Installer
    NextPackageTS

    "src/components/elements", "src/components/fragments", "src/components/layouts", "src/libs", "src/libs/axios", "src/features", "src/features/product", "src/features/user", "src/types", "public/assets/images", "public/assets/videos", "public/assets/audios" | ForEach-Object { New-Item -Path $_ -ItemType Directory -Force }

    $providersContent = @"
import { ChakraProvider } from '@chakra-ui/react'
import { QueryClient, QueryClientProvider } from '@tanstack/react-query'

const queryClient = new QueryClient()

type ProvidersProps = {
    children: React.ReactNode
}

export default function Providers({ children }: ProvidersProps) {
    return (
        <QueryClientProvider client={queryClient}>
            <ChakraProvider>
                {children}
            </ChakraProvider>
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
    Set-Content -Path src/pages/index.tsx -Value $appTsxContent

    $indexCssContent = @"
"@
    Set-Content -Path src/styles/globals.css -Value $indexCssContent
    code .
    pnpm run dev
}