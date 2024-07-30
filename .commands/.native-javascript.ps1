function basicProject() {
  param (
    [Parameter(Mandatory = $true)]
    [string]$Project_Name
)
mkdir $Project_Name
Set-Location $Project_Name

    New-Item index.html
    New-Item main.css
    New-Item app.js

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
    <link rel="stylesheet" href="main.css" />
    <!-- JS -->
    <script src="app.js" defer></script>
    <title>Disorganized</title>
</head>

<body>
    <div id="root">
        <div class="intro">
            <h1>Crot</h1>
            <span>By Avnexeed</span>
        </div>
        <div class="clock">
            <div class="center-nut"></div>
            <div class="center-nut2"></div>
            <div class="indicators">
                <div></div>
                <div></div>
                <div></div>
                <div></div>
                <div></div>
                <div></div>
                <div></div>
                <div></div>
                <div></div>
                <div></div>
                <div></div>
                <div></div>
            </div>
            <div class="sec-hand">
                <div class="sec"></div>
            </div>
            <div class="min-hand">
                <div class="min"></div>
            </div>
            <div class="hr-hand">
                <div class="hr"></div>
            </div>
        </div>
    </div>
</body>

</html>
"@
    $htmlContent | Add-Content -Path index.html
    $cssContent = @"
@import url("https://fonts.googleapis.com/css2?family=Caveat&family=Onest:wght@500&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap");

* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}

:root {
  /* Responsive Breakpoint */
  --media-sm: 640px;
  --media-md: 768px;
  --media-lg: 1024px;
  --media-xl: 1280px;

  /* Font Variable */
  --font-caveat: "Caveat", cursive;
  --font-poppins: "Poppins", sans-serif;
  --font-onest: "Onest", sans-serif;
}

/* Contoh penggunaan variabel */
@media screen and (min-width: var(--media-sm)) {
  /* Styles untuk layar dengan lebar setidaknya media-sm */
}

@media screen and (min-width: var(--media-md)) {
  /* Styles untuk layar dengan lebar setidaknya media-md */
}

@media screen and (min-width: var(--media-lg)) {
  /* Styles untuk layar dengan lebar setidaknya media-lg */
}

@media screen and (min-width: var(--media-xl)) {
  /* Styles untuk layar dengan lebar setidaknya media-xl */
}

body {
  font-family: var(--font-poppins); /* Contoh penggunaan variabel font */
  animation: rainbow 10s ease alternate infinite forwards;
}
div#root {
  width: 100%;
  height: 100vh;
  display: flex;
  justify-content: center;
  align-items: center;
  flex-direction: column;
}

div.intro {
  display: flex;
}
div.intro h1 {
  font-size: 10rem;
}

div.intro span {
  font-size: 2rem;
  margin-top: 140px;
}

.clock {
  position: relative;
  display: flex;
  align-items: center;
  justify-content: center;
  background: #dde1e7;
  height: 250px;
  width: 250px;
  border-radius: 50%;
  box-shadow: -3px -3px 7px #ffffff73, 3px 3px 5px rgba(94, 104, 121, 0.288);
}
.clock:before {
  position: absolute;
  content: "";
  height: 220px;
  width: 220px;
  background: #dde1e7;
  border-radius: 50%;
  box-shadow: inset -3px -3px 7px #ffffff73,
    inset 3px 3px 5px rgba(94, 104, 121, 0.288);
}
.clock:after {
  position: absolute;
  content: "";
  height: 120px;
  width: 120px;
  background: #dde1e7;
  border-radius: 50%;
  box-shadow: -1px -1px 5px #ffffff73, 1px 1px 3px rgba(94, 104, 121, 0.288);
}
.clock .center-nut {
  height: 15px;
  width: 15px;
  background: #404040;
  border-radius: 50%;
  z-index: 2;
  position: absolute;
}
.clock .center-nut2 {
  height: 9px;
  width: 9px;
  background: #3498db;
  border-radius: 50%;
  z-index: 15;
  position: absolute;
}
.indicators div {
  position: absolute;
  width: 2px;
  height: 5px;
  background: #404040;
}
.indicators div:nth-child(1) {
  transform: rotate(30deg) translateY(-100px);
}
.indicators div:nth-child(2) {
  transform: rotate(60deg) translateY(-100px);
}
.indicators div:nth-child(3) {
  background: #3498db;
  transform: rotate(90deg) translateY(-100px);
}
.indicators div:nth-child(4) {
  transform: rotate(120deg) translateY(-100px);
}
.indicators div:nth-child(5) {
  transform: rotate(150deg) translateY(-100px);
}
.indicators div:nth-child(6) {
  background: #3498db;
  transform: rotate(180deg) translateY(-100px);
}
.indicators div:nth-child(7) {
  transform: rotate(210deg) translateY(-100px);
}
.indicators div:nth-child(8) {
  transform: rotate(240deg) translateY(-100px);
}
.indicators div:nth-child(9) {
  background: #3498db;
  transform: rotate(270deg) translateY(-100px);
}
.indicators div:nth-child(10) {
  transform: rotate(300deg) translateY(-100px);
}
.indicators div:nth-child(11) {
  transform: rotate(330deg) translateY(-100px);
}
.indicators div:nth-child(12) {
  background: #3498db;
  transform: rotate(360deg) translateY(-100px);
}
.sec-hand,
.min-hand,
.hr-hand {
  position: absolute;
}
.sec-hand,
.sec {
  height: 180px;
  width: 180px;
  z-index: 6;
}
.min-hand,
.min {
  height: 140px;
  width: 140px;
  z-index: 5;
}
.hr-hand,
.hr {
  height: 110px;
  width: 110px;
  z-index: 4;
}
.sec,
.min,
.hr {
  display: flex;
  justify-content: center;
  position: absolute;
}
.sec:before {
  position: absolute;
  content: "";
  height: 110px;
  width: 3px;
  background: #3498db;
}
.sec:after {
  position: absolute;
  content: "";
  height: 35px;
  width: 7px;
  background: #3498db;
  top: 105px;
  border-radius: 5px;
}
.min:before {
  position: absolute;
  content: "";
  width: 1px;
  top: -15px;
  border-left: 3px solid transparent;
  border-right: 3px solid transparent;
  border-bottom: 60px solid #e95949;
}
.min:after {
  position: absolute;
  content: "";
  width: 3px;
  top: 40px;
  border-left: 2px solid transparent;
  border-right: 2px solid transparent;
  border-top: 30px solid #e95949;
}
.hr:before {
  position: absolute;
  content: "";
  width: 1px;
  border-left: 3px solid transparent;
  border-right: 3px solid transparent;
  border-bottom: 35px solid #303030;
}
.hr:after {
  position: absolute;
  content: "";
  width: 3px;
  top: 34px;
  border-left: 2px solid transparent;
  border-right: 2px solid transparent;
  border-top: 25px solid #303030;
}

@keyframes rainbow {
  5% {
    background: red;
  }
  10% {
    background: orange;
  }
  15% {
    background: yellow;
  }
  20% {
    background: green;
  }
  25% {
    background: blue;
  }
  30% {
    background: indigo;
  }
  35% {
    background: violet;
  }
  40% {
    background: white;
  }
  45% {
    background: salmon;
  }
  50% {
    background: gray;
  }
  55% {
    background: pink;
  }
  60% {
    background: cyan;
  }
  65% {
    background: brown;
  }
  70% {
    background: purple;
  }
  75% {
    background: olive;
  }
  80% {
    background: coral;
  }
  85% {
    background: gold;
  }
  90% {
    background: aqua;
  }
  95% {
    background: silver;
  }
  100% {
    background: red;
  }
}

"@
    $cssContent | Add-Content -Path main.css
    $jsContent = @"
const root = document.getElementById("root");
const sec = document.querySelector(".sec");
const min = document.querySelector(".min");
const hr = document.querySelector(".hr");
setInterval(function () {
  let time = new Date();
  let secs = time.getSeconds() * 6;
  let mins = time.getMinutes() * 6;
  let hrs = time.getHours() * 30;
  sec.style.transform = 'rotateZ(' + secs + 'deg)';
  min.style.transform = 'rotateZ(' + mins + 'deg)';
  hr.style.transform = 'rotateZ(' + (hrs + mins / 12) + 'deg)';
});


"@

$jsContent | Set-Content -Path "app.js" -Encoding UTF8

    code .
    ./index.html
}


function sassProject () {
  param (
    [Parameter(Mandatory = $true)]
    [string]$Project_Name
)
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
    mkdir ./src/sass
    mkdir ./src/css
    mkdir ./src/js
    mkdir ./src/pages

    New-Item ./src/sass/main.scss
    New-Item ./src/css/main.css
    New-Item ./src/js/app.js
    pnpm init -p

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
    <div id="root">
        <div class="intro">
            <h1>Crot</h1>
            <span>By Avnexeed</span>
        </div>
        <div class="wrapper">
            <div class="display">
                <div id="time"></div>
            </div>
            <span></span>
            <span></span>
        </div>
    </div>
</body>

</html>
"@
    $htmlContent | Add-Content -Path index.html
    # set main.scss
    $scssContent = @"
@import url("https://fonts.googleapis.com/css2?family=Caveat&family=Onest:wght@500&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap");

* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

// Rubah ^^ dengan $

// Responsive Breakpoint
^^media-sm: 640px;
^^media-md: 768px;
^^media-lg: 1024px;
^^media-xl: 1280px;

// Font Variable
^^caveat: "Caveat", cursive;
^^poppins: "Poppins", sans-serif;
^^onest: "Onest", sans-serif;

html,
body {
    font-family: ^^poppins;
    animation: rainbow 10s ease alternate infinite forwards;
}

button {
    cursor: pointer;
}

div#root {
    width: 100%;
    height: 100vh;
    display: flex;
    justify-content: center;
    align-items: center;
    flex-direction: column;
    div.intro {
        display: flex;
        h1 {
            font-size: 10rem;
        }
        span {
            font-size: 2rem;
            margin-top: 140px;
        }
    }
    div.wrapper {
        height: 100px;
        width: 360px;
        position: relative;
        background: linear-gradient(135deg, #14ffe9, #ffeb3b, #ff00e0);
        border-radius: 10px;
        cursor: default;
        animation: animate 1.5s linear infinite;

        .display,
        span {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
        }

        .display {
            z-index: 999;
            height: 85px;
            width: 345px;
            background: #1b1b1b;
            border-radius: 6px;
            text-align: center;

            #time {
                line-height: 85px;
                color: #fff;
                font-size: 50px;
                font-weight: 600;
                letter-spacing: 1px;
                background: linear-gradient(135deg, #14ffe9, #ffeb3b, #ff00e0);
                -webkit-background-clip: text;
                -webkit-text-fill-color: transparent;
                animation: animate 1.5s linear infinite;
            }
        }

        @keyframes animate {
            100% {
                filter: hue-rotate(360deg);
            }
        }

        span {
            height: 100%;
            width: 100%;
            border-radius: 10px;
            background: inherit;
        }

        span:first-child {
            filter: blur(7px);
        }

        span:last-child {
            filter: blur(20px);
        }
    }
}

@keyframes rainbow {
    5% {
        background: red;
    }
    10% {
        background: orange;
    }
    15% {
        background: yellow;
    }
    20% {
        background: green;
    }
    25% {
        background: blue;
    }
    30% {
        background: indigo;
    }
    35% {
        background: violet;
    }
    40% {
        background: white;
    }
    45% {
        background: salmon;
    }
    50% {
        background: gray;
    }
    55% {
        background: pink;
    }
    60% {
        background: cyan;
    }
    65% {
        background: brown;
    }
    70% {
        background: purple;
    }
    75% {
        background: olive;
    }
    80% {
        background: coral;
    }
    85% {
        background: gold;
    }
    90% {
        background: aqua;
    }
    95% {
        background: silver;
    }
    100% {
        background: red;
    }
}

"@
    $scssContent | Add-Content -Path ./src/sass/main.scss

    # set js
    $jsContent = @"
const root = document.getElementById("root")
setInterval(() => {
    const time = document.querySelector(".display #time");
    let date = new Date();
    let hours = date.getHours();
    let minutes = date.getMinutes();
    let seconds = date.getSeconds();
    let day_night = "AM";
    if (hours > 12) {
        day_night = "PM";
        hours = hours - 12;
    }
    if (seconds < 10) {
        seconds = "0" + seconds;
    }
    if (minutes < 10) {
        minutes = "0" + minutes;
    }
    if (hours < 10) {
        hours = "0" + hours;
    }
    time.textContent = hours + ":" + minutes + ":" + seconds + " " + day_night;
});
"@
    $jsContent | Add-Content -Path ./src/js/app.js

    # del test
    $packageJsonPath = "package.json"
    $packageJsonContent = Get-Content -Raw $packageJsonPath | ConvertFrom-Json
    $null = $packageJsonContent.PSObject.Properties.Remove("test")
    # set dev
    $packageJsonContent.scripts | Add-Member -MemberType NoteProperty -Name "dev" -Value "sass ./src/sass/main.scss ./src/css/main.css --watch"
    # rewrite json
    $packageJsonContent | ConvertTo-Json | Set-Content -Path $packageJsonPath -Force
    code .
    ./index.html
    pnpm dev
}

function tailwindProject() {
  param (
    [Parameter(Mandatory = $true)]
    [string]$Project_Name
)
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
            <h1 class="text-[10rem] font-caveat">Crot</h1>
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
    pnpm dev
}

