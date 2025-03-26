# choco 설치 
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

# scoop 설치 (관리자 모드 해제)
irm get.scoop.sh | iex

# choco 패키지 설치 
choco install -y yazi ffmpeg 7zip jq poppler fd ripgrep fzf zoxide imagemagick bat d2codingfont rust-ms cursoride onecommander

# scoop 패키지 설치 
scoop install eza

