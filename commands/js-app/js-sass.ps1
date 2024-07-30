function JSSass () {
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