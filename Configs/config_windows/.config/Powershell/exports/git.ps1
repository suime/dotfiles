# Git Shortcuts
function gs { git status }

function ga { git add . }

function gc { param($m) git commit -m "$m" }

function gpus { git push }

function g { z Github }

function gcom {
    git add .
    git commit -m "$args"
}
function lazyg {
    git add .
    git commit -m "$args"
    git push
}

# multimedia 
function yt ($url) {
	yt-dlp --compat-options no-certifi -f "bv+ba/b" -S "ext"  $url
}

function Extract-Frames {
    param (
        [string]$inputFile,  # 입력 영상 파일
        [string]$startTime,  # 시작 시간 (예: "00:01:30")
        [int]$duration,      # 추출할 시간(초)
        [string]$outputPrefix = "output"  # 출력 파일 접두사
    )

    # 출력 파일 이름 형식
    $outputPattern = "${outputPrefix}_%04d.png"

    # ffmpeg 명령 실행
    $ffmpegCmd = "ffmpeg -i `"$inputFile`" -ss $startTime -t $duration -q:v 2 `"$outputPattern`""
    Invoke-Expression $ffmpegCmd
}