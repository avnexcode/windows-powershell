function ReactChakraUITS {
    param (
        [Parameter(Mandatory = $true)]
        [string]$Project_Name
    )

    $Project_Name = $Project_Name.ToLower().Replace(" ", "-")

    pnpm create vite $Project_Name --template react-ts
    Set-Location $Project_Name
    pnpm install
    # Style Installer
    pnpm add @chakra-ui/react @emotion/react @emotion/styled framer-motion 
    # Package Installer
    ReactPackageTS

    "src/components/elements", "src/components/fragments", "src/components/layouts", "src/libs", "src/libs/axios", "src/features", "src/features/product", "src/features/user", "src/types", "src/pages", "public/assets/images", "public/assets/videos", "public/assets/audios" | ForEach-Object { New-Item -Path $_ -ItemType Directory -Force }

    Remove-Item -Path src/App.css

    $appTsxContent = @"
import { Heading, Text, Flex } from '@chakra-ui/react';
import { ListItem, UnorderedList } from '@chakra-ui/react'
export default function App() {
    return (
        <Flex w={"100%"} h={"100vh"} justify={"center"} align={"center"} direction={"column"} gap={"10px"}>
            <Flex direction={"column"} gap={5} align={"center"}>
                <Heading color={"red"}>ReactVite TS x Chakra UI</Heading>
                <Text fontSize={"1.5rem"}>Build with 💖 by Avnexcode</Text>
            </Flex>
            <Flex>
                <Heading>Installed Dependencies:</Heading>
            </Flex>
            <Flex>
                <UnorderedList fontSize={"1.3rem"}>
                    <ListItem>Chakra UI</ListItem>
                    <ListItem>Tanstack Query, Axios, Formik</ListItem>
                    <ListItem>React Icons</ListItem>
                    <ListItem>React Router DOM</ListItem>
                </UnorderedList>
            </Flex>
        </Flex>
    );
}
"@
    Set-Content -Path src/App.tsx -Value $appTsxContent

    $providersTsxContent = @"
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
"@
    Set-Content -Path src/index.css -Value $indexCssContent

    code .
    pnpm run dev
}