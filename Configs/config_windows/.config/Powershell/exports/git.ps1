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

function mp4split {
    param (
        [string]$inputFolder  # MP4 파일이 있는 폴더 경로
    )

    # FFmpeg 실행 파일 확인
    $ffmpegPath = "ffmpeg"  # 환경변수에 등록된 경우
    if (-not (Get-Command $ffmpegPath -ErrorAction SilentlyContinue)) {
        Write-Host "FFmpeg 실행 파일을 찾을 수 없습니다. 설치 후 환경변수에 추가하세요."
        return
    }

    # 입력 폴더 존재 확인
    if (-not (Test-Path $inputFolder -PathType Container)) {
        Write-Host "지정된 폴더가 존재하지 않습니다: $inputFolder"
        return
    }

    # MP4 파일 찾기
    $mp4Files = Get-ChildItem -Path $inputFolder -Filter "*.mp4"
    if ($mp4Files.Count -eq 0) {
        Write-Host "MP4 파일이 없습니다: $inputFolder"
        return
    }

    foreach ($file in $mp4Files) {
        # 파일명 및 출력 폴더 설정
        $fileName = [System.IO.Path]::GetFileNameWithoutExtension($file.Name)
        $outputFolder = Join-Path -Path $inputFolder -ChildPath $fileName

        # 출력 폴더 생성
        if (-not (Test-Path $outputFolder)) {
            New-Item -ItemType Directory -Path $outputFolder | Out-Null
        }

        # FFmpeg 명령 실행
        $outputPattern = Join-Path -Path $outputFolder -ChildPath "frame_%04d.png"
        $ffmpegCmd = "$ffmpegPath -i `"$($file.FullName)`" `"$outputPattern`""
        
        Write-Host "처리 중: $($file.Name) → $outputFolder"
        Invoke-Expression $ffmpegCmd
    }

    Write-Host "모든 MP4 파일이 프레임으로 변환되었습니다."
}


function Remove-EvenNumberedFrames {
    param (
        [string]$folderPath  # 이미지 파일이 있는 폴더 경로
    )

    # 입력 폴더 존재 확인
    if (-not (Test-Path $folderPath -PathType Container)) {
        Write-Host "지정된 폴더가 존재하지 않습니다: $folderPath"
        return
    }

    # 정규식을 사용하여 짝수 번호로 끝나는 파일 찾기
    $filesToDelete = Get-ChildItem -Path $folderPath -Filter "frame_*.png" | Where-Object { $_.Name -match "frame_\d*[02468]\.png$" }

    if ($filesToDelete.Count -eq 0) {
        Write-Host "삭제할 짝수 프레임 파일이 없습니다."
        return
    }

    # 파일 삭제 실행
    foreach ($file in $filesToDelete) {
        Write-Host "삭제 중: $($file.FullName)"
        Remove-Item -Path $file.FullName -Force
    }

    Write-Host "짝수 프레임 파일 삭제 완료."
}
