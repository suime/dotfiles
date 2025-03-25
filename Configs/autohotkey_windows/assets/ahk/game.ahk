#Requires AutoHotkey >=2.0

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
