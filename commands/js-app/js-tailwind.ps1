function JSTailwind() {
  param (
    [Parameter(Mandatory = $true)]
    [string]$Project_Name
)

$Project_Name = $Project_Name.ToLower().Replace(" ", "_")

mkdir $Project_Name
Set-Location $Project_Name

    New-Item index.html
    New-Item README.MD

    Write-Output "# Project Name" >> README.md
    Write-Output "This is a project structure by MFNA." >> README.md

    mkdir ./public/assets/image
    mkdir ./public/assets/video
    mkdir ./public/assets/audio

    mkdir ./template
    mkdir ./src/css
    mkdir ./src/js
    mkdir ./src/pages

    New-Item ./src/css/main.css
    New-Item ./src/css/input.css
    New-Item ./src/js/app.js

    pnpm init -p
    pnpm install -D tailwindcss
    npx tailwindcss init

    # set index.html
    $htmlContent = @"
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <!-- Font Awesome Cdn -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
        integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    <!-- CSS -->
    <link rel="stylesheet" href="./src/css/main.css" />
    <!-- JS -->
    <script src="./src/js/app.js" defer></script>
    <title>Disorganized</title>
</head>

<body>
    <div id="root" class="flex justify-center items-center flex-col h-screen">
        <div class="flex">
            <h1 class="text-[10rem] font-caveat">PROT PROT</h1>
            <span class="text-3xl mt-[160px] font-caveat">By Avnexeed</span>
        </div>
        <div
            class="clock bg-[#131419] h-32 flex items-center justify-center px-8 shadow-[10px_10px_0px_0px_rgba(109,40,217)]">
            <div class="display text-cyan-500 text-5xl font-medium tracking-wider"></div>
        </div>
    </div>
</body>

</html>
"@
    $htmlContent | Add-Content -Path index.html
    # set main.scss
    $inputCssContent = @"
@tailwind base;
@tailwind components;
@tailwind utilities;

@import url("https://fonts.googleapis.com/css2?family=Caveat&family=Onest:wght@500&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap");
"@
    $inputCssContent | Add-Content -Path ./src/css/input.css

    # set js
    $jsContent = @"
const root = document.getElementById("root")
setInterval(function(){
    const clock = document.querySelector(".display");
    let time = new Date();
    let sec = time.getSeconds();
    let min = time.getMinutes();
    let hr = time.getHours();
    let day = 'AM';
    if(hr > 12){
      day = 'PM';
      hr = hr - 12;
    }
    if(hr == 0){
      hr = 12;
    }
    if(sec < 10){
      sec = '0' + sec;
    }
    if(min < 10){
      min = '0' + min;
    }
    if(hr < 10){
      hr = '0' + hr;
    }
    clock.textContent = hr + ':' + min + ':' + sec + " " + day;
  });
"@
    $jsContent | Add-Content -Path ./src/js/app.js

    $configContent = @"
/** @type {import('tailwindcss').Config} */
module.exports = {
  content: ["index.html", "./src/pages/**/*.{html}"],
  theme: {
    extend: {
      fontFamily: {
        poppins: ["Poppins", "sans-serif"],
        onest: ["Onest", "sans-serif"],
        caveat: ["Caveat", "cursive"],
      },
    },
  },
  plugins: [],
};

"@

    $configContent | Set-Content -Path tailwind.config.js

    # del test
    $packageJsonPath = "package.json"
    $packageJsonContent = Get-Content -Raw $packageJsonPath | ConvertFrom-Json
    $null = $packageJsonContent.PSObject.Properties.Remove( '"test": "echo \"Error: no test specified\" && exit 1",')
    # set dev
    $packageJsonContent.scripts | Add-Member -MemberType NoteProperty -Name "dev" -Value "npx tailwindcss -i ./src/css/input.css -o ./src/css/main.css --watch"
    # rewrite json
    $packageJsonContent | ConvertTo-Json | Set-Content -Path $packageJsonPath -Force
    code .
    ./index.html
   Start-Process "powershell" -ArgumentList "pnpm dev"
    Start-Process "http://127.0.0.1:5500/"
}