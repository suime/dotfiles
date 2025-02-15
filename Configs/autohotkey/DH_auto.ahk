#Requires AutoHotkey >=2.0
#SingleInstance force

SetCapsLockState "AlwaysOff"
SetNumLockState "AlwaysOn"
try {
    WinHide , "MOMENT 광고"
    try WinClose "IObit Public Program"
    try WinKill "ahk_class TFormPromote"
}

; * 프로그램 실행
init(title := "", exe := "", reset := 0) {

    ; 이미 실행 중인 창을 맨위로 띄우기,
    if (reset == 0) {

        if (WinExist(title)) {
            WinWait title
            WinActivate title
            WinMoveTop title
            WinSetAlwaysOnTop true, title
            WinSetAlwaysOnTop false, title
        } else {
            Run exe
            WinWait title
            WinActivate title
            WinMoveTop title
            WinSetAlwaysOnTop true, title
            WinSetAlwaysOnTop false, title
        }
    } else {
        if (WinExist(title)) {
            WinKill title
            Run exe
            WinWait title
            WinActivate title
            WinMoveTop title
            WinSetAlwaysOnTop true, title
            WinSetAlwaysOnTop false, title
        } else {
            Run exe
            WinWait title
            WinActivate title
            WinMoveTop title
            WinSetAlwaysOnTop true, title
            WinSetAlwaysOnTop false, title
        }
    }
}

; ! 창 이동 함수
MoveWindow(direction) {

    try {

        static toggle := 0
        title := WinGetTitle("A")

        if (WinGetMinMax(title)) {
            WinRestore title
        }

        WinGetPos &X, &Y, &Width, &Height, title

        toggle := Mod(toggle + 1, 3)

        if (direction = "Left") {
            if (toggle == 0) {
                WinMove 0, 0, (A_ScreenWidth * 0.3), (A_ScreenHeight - 48), title
            } else if (toggle == 1) {
                WinMove 0, 0, (A_ScreenWidth * 0.5), (A_ScreenHeight - 48), title
            } else {
                WinMove 0, 0, (A_ScreenWidth * 0.7), (A_ScreenHeight - 48), title
            }
        } else if (direction = "Right") {
            if (toggle == 0) {
                WinMove (A_ScreenWidth * 0.7), 0, (A_ScreenWidth * 0.3), (A_ScreenHeight - 48), title
            } else if (toggle == 1) {
                WinMove (A_ScreenWidth * 0.5), 0, (A_ScreenWidth * 0.5), (A_ScreenHeight - 48), title
            } else {
                WinMove (A_ScreenWidth * 0.3), 0, (A_ScreenWidth * 0.7), (A_ScreenHeight - 48), title
            }
        } else if (direction = "Up") {
            WinMaximize title
        } else if (direction = "Down") {
            if (toggle == 0) {
                WinMove (A_ScreenWidth * 0.22), 0, (A_ScreenWidth * 0.6), (A_ScreenHeight * 0.9),
                title
            } else if (toggle == 1) {
                WinMove (A_ScreenWidth * 0.1), 0, (A_ScreenWidth * 0.8), (A_ScreenHeight * 0.8),
                title
            } else {
                WinMove (A_ScreenWidth * 0.1), 0, (A_ScreenWidth * 0.8), (A_ScreenHeight * 1),
                title
            }
        } else if (direction = "1") {
            WinMove 0, 0, Width, Height, title
        } else if (direction = "2") {
            WinMove 0, 1441, Width, Height, title
        } else if (direction = "3") {
            WinMove -1080, 473, Width, Height, title
            WinMaximize title
        }
    }
}

MediaControl(id) {
    if (id = "prev") {
        Send "{Media_Prev}"
    } else if (id = "next") {
        Send "{Media_Next}"
    } else if (id = "play_pause") {
        Send "{Media_Play_Pause}"
    } else if (id = "stop") {
        Send "{Media_Stop}"
    } else if (id = "volume_up") {
        Send "{Volume_Up}"
    } else if (id = "volume_down") {
        Send "{Volume_Down}"
    } else if (id = "volume_mute") {
        Send "{Volume_Mute}"
    }
}

; * 창 크기 변경
CapsLock & Left:: MoveWindow("Left")
CapsLock & Right:: MoveWindow("Right")
CapsLock & Up:: MoveWindow("Up")
CapsLock & Down:: MoveWindow("Down")

; * 활성 모니터 이동
CapsLock & 1:: MoveWindow("1")
CapsLock & 2:: MoveWindow("2")
CapsLock & 3:: MoveWindow("3")

; * 미디어 컨트롤
CapsLock & Numpad4:: MediaControl("prev")
CapsLock & Numpad5:: MediaControl("play_pause")
CapsLock & Numpad6:: MediaControl("next")
CapsLock & Numpad8:: MediaControl("volume_up")
CapsLock & Numpad2:: MediaControl("volume_down")

; * 바로가기
CapsLock & b:: init("ahk_exe Battle.net.exe", "C:\Program Files (x86)\Battle.net\Battle.net.exe", 1)
CapsLock & t:: init("Steam", "C:\Program Files (x86)\Steam\steam.exe")
CapsLock & e:: init("ahk_exe Cursor.exe", "C:\Users\박대현\AppData\Local\Programs\cursor\Cursor.exe")
CapsLock & q:: init("C:\Program Files\AutoHotkey\UX\WindowSpy.ahk", "C:\Program Files\AutoHotkey\UX\WindowSpy.ahk", 1)
CapsLock & r:: init("ahk_exe WindowsTerminal.exe", "C:\Program Files\PowerShell\7\pwsh.exe")
CapsLock & f:: init("ahk_exe Everything.exe", "C:\Program Files\Everything\Everything.exe", 1)
CapsLock & g:: run "https://chatgpt.com/"
CapsLock & c:: init "ahk_class Notepad++"

CapsLock & d:: Run "onecommander.exe C:\Users\박대현\Downloads"
CapsLock & a:: Run "onecommander.exe C:\Users\박대현"
; CapsLock & p:: Run "onecommander.exe C:\Users\박대현\python"
; CapsLock & z:: Run "C:\Users\박대현\python\fire\dhcast.ahk"
CapsLock & j:: Send "{Home}"
CapsLock & k:: Send "{Down}"
CapsLock & i:: Send "{Up}"
CapsLock & l:: Send "{End}"

;& 캡스락 + 리로드
CapsLock & w:: Reload
;& 캡스락키 -> 한영키
capslock::vk15

;& 특수문자 입력
vk19 & d::○
vk19 & s::★
vk19 & a::□
vk19 & w::■
vk19 & q::❍
vk19 & [:: SendText "「"
vk19 & ]:: SendText "」"
vk19 & f:: Send "·"
vk19 & g:: Send "•"
vk19 & 1:: Send "①"
vk19 & 2:: Send "②"
vk19 & 3:: Send "③"
vk19 & 4:: Send "④"
vk19 & 5:: Send "⑤"
vk19 & 6:: Send "⑥"
vk19 & 7:: Send "⑦"
vk19 & 8:: Send "⑧"
vk19 & 9:: Send "⑨"
vk19 & v:: Send "✔"
vk19::vk19

#q:: SendText 'dhkfndlwl`!23'
^#q:: SendText 'Dhkfndlwl!23'
#F1:: SendText 'qkqxk500@naver.com'
#F2:: SendText 'qkqxk600@gmail.com'
#w:: Send "{Alt down}{F4}{Alt up}"

;----- 줄임말 ------
#k:: {
    A_Clipboard := Sort(A_Clipboard)
    MsgBox A_Clipboard
}

; ;----- 한글 단축키 ------
; #HotIf WinActive("ahk_exe Hwp.exe")

; ; 줄복사 하기
; ^+d:: {
;     temp := A_Clipboard
;     Send "{Home}{Shift down}{End}{Shift up}{Ctrl down}c{Ctrl up}{End}{Enter}{Ctrl down}v{Ctrl up}"
;     A_Clipboard := temp
; }

; ^d:: Send "{Ctrl down}y{Ctrl up}"

; ; 한글 날짜 태그 넣기
; LAlt & SC027:: Send(FormatTime(, "yyyy. MM. dd(ddd)"))

; ; 탭 관리
; ^t:: Send "{Ctrl down}{Alt down}t{Alt up}{Ctrl up}"
; ^w:: Send "{Ctrl down}{F4}{Ctrl up}"
; #HotIf

; & 히오스 매크로
#HotIf WinActive("ahk_exe HeroesOfTheStorm_x64.exe")
~XButton2::
{
    while GetKeyState("XButton2") {
        send "{z}{y}{s}"
        sleep 10
    }
}
~XButton1:: {
    while GetKeyState("XButton1") {
        send "{a}{LButton}{s}"
        sleep 100
    }
}
Numpad4:: MediaControl("prev")
Numpad5:: MediaControl("play_pause")
Numpad6:: MediaControl("next")
Numpad8:: MediaControl("volume_up")
Numpad2:: MediaControl("volume_down")
#HotIf

; ; 스타 매크로
; #HotIf WinActive("ahk_exe StarCraft.exe")
; ~XButton1:: {
;     while GetKeyState("XButton1") {
;         send "{a}{LButton}"
;         sleep 20
;     }
; }
; #HotIf

; 웨일 켜저 있을 경우
#HotIf WinActive("ahk_exe whale.exe")
^+s:: {
    send "{ctrl down}l{ctrl up}"  ; 주소창으로 이동
    send "{ctrl down}c{ctrl up}"  ; 주소 복사
    send "{esc}"
}
#HotIf