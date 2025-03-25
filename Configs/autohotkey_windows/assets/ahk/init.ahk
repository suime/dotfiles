#Requires AutoHotkey v2.0

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

; * 바로가기
CapsLock & b:: init("ahk_exe Battle.net.exe", "C:\Program Files (x86)\Battle.net\Battle.net.exe", 1)
CapsLock & t:: init("Steam", "C:\Program Files (x86)\Steam\steam.exe")
CapsLock & e:: init("ahk_exe Cursor.exe", "C:\Users\박대현\AppData\Local\Programs\cursor\Cursor.exe")
CapsLock & q:: init("C:\Program Files\AutoHotkey\UX\WindowSpy.ahk", "C:\Program Files\AutoHotkey\UX\WindowSpy.ahk", 1)
CapsLock & r:: init("ahk_exe WindowsTerminal.exe", "wt")
CapsLock & f:: init("ahk_exe Everything.exe", "C:\Program Files\Everything\Everything.exe", 1)
CapsLock & y:: init("ahk_exe youtube-music-desktop-app.exe",
    "C:\Users\dbro\AppData\Local\youtube_music_desktop_app\youtube-music-desktop-app.exe")
CapsLock & c:: init "ahk_class Notepad++"

CapsLock & d:: Run "onecommander.exe C:\다운로드"
CapsLock & a:: Run "onecommander.exe C:\Users\박대현"