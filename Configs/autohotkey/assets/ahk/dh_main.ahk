#Requires AutoHotkey >=2.0
#SingleInstance force

#Include init.ahk
#Include window.ahk
#Include media.ahk
#Include game.ahk
#Include hwp.ahk
#Include id.ahk

SetCapsLockState "AlwaysOff"
SetNumLockState "AlwaysOn"

#w:: Send "{Alt down}{F4}{Alt up}"
;& 캡스락 + 리로드
CapsLock & w:: try {
    Reload
    WinHide , "MOMENT 광고"
    try WinClose "IObit Public Program"
    try WinKill "ahk_class TFormPromote"
}

;& 캡스락키 -> 한영키
capslock::vk15

CapsLock & j:: Send "{Home}"
CapsLock & k:: Send "{Down}"
CapsLock & i:: Send "{Up}"
CapsLock & l:: Send "{End}"

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

; 웨일 켜저 있을 경우
#HotIf WinActive("ahk_exe whale.exe")
^+s:: {
    send "{ctrl down}l{ctrl up}"  ; 주소창으로 이동
    send "{ctrl down}c{ctrl up}"  ; 주소 복사
    send "{esc}"
}
#HotIf