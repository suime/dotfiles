#Requires AutoHotkey v2.0

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

; * 창 크기 변경
CapsLock & Left:: MoveWindow("Left")
CapsLock & Right:: MoveWindow("Right")
CapsLock & Up:: MoveWindow("Up")
CapsLock & Down:: MoveWindow("Down")

; * 활성 모니터 이동
CapsLock & 1:: MoveWindow("1")
CapsLock & 2:: MoveWindow("2")
CapsLock & 3:: MoveWindow("3")