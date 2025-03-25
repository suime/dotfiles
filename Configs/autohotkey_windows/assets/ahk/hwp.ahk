#Requires AutoHotkey v2.0

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
