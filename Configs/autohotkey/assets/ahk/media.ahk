#Requires AutoHotkey v2.0

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

; * 미디어 컨트롤
CapsLock & Numpad4:: MediaControl("prev")
CapsLock & Numpad5:: MediaControl("play_pause")
CapsLock & Numpad6:: MediaControl("next")
CapsLock & Numpad8:: MediaControl("volume_up")
CapsLock & Numpad2:: MediaControl("volume_down")