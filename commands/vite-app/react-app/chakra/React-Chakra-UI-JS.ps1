function React-Chakra-UI-JS {
    param (
        [Parameter(Mandatory = $true)]
        [string]$Project_Name
    )

    $Project_Name = $Project_Name.ToLower().Replace(" ", "_")

    pnpm create vite $Project_Name --template react
    Set-Location $Project_Name
    pnpm install
    pnpm add @chakra-ui/react @emotion/react @emotion/styled framer-motion axios @tanstack/react-query formik react-router-dom react-icons

    "src/components/elements", "src/components/fragments", "src/components/layouts", "src/libs", "src/libs/axios", "src/features", "src/features/product", "src/features/user", "src/pages", "public/assets/images", "public/assets/videos", "public/assets/audios" | ForEach-Object { New-Item -Path $_ -ItemType Directory -Force }

    Remove-Item -Path src\App.css
    New-Item -Path src\components\Providers.jsx

    $appJsxContent = @"
import { Heading, Text, Flex } from '@chakra-ui/react';
import { ListItem, UnorderedList } from '@chakra-ui/react'
export default function App() {
    return (
        <Flex w={"100%"} h={"100vh"} justify={"center"} align={"center"} direction={"column"} gap={"10px"}>
            <Flex direction={"column"} gap={5} align={"center"}>
                <Heading color={"red"}>ReactVite JS x Chakra</Heading>
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

    $providersJsxContent = @"
/* eslint-disable react/prop-types */
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
"@
    Set-Content -Path src\App.jsx -Value $appJsxContent
    Set-Content -Path src\components\Providers.jsx -Value $providersJsxContent
    Set-Content -Path src\main.jsx -Value $mainJsxContent
    Set-Content -Path src\index.css -Value $indexCssContent

    code .
    pnpm run dev
}