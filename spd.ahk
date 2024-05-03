#SingleInstance force
#Persistent
SetTimer, CheckKeyPress, 10
fake_kill := false
count_ore := 0
count_e_press := 0

; Get the screen width and height
SysGet, screenWidth, 0
SysGet, screenHeight, 1

; Calculate the position to center the GUI
GuiWidth := 150  ; Width of the GUI
GuiHeight := 30  ; Height of the GUI
GuiX := (screenWidth - GuiWidth) // 2  ; Calculate the X position
GuiY := (30 - GuiHeight) ; Calculate the Y position

; Create the GUI
Gui +AlwaysOnTop +LastFound
Gui Color, 000000
Gui -Caption
Gui, Font, cRed
Gui, Add, Text, x10 y10 w200 h30, SPDHACK - ON | MINAT - %count_ore%
Gui, Show, x%GuiX% y%GuiY% w%GuiWidth% h%GuiHeight%, Overlay
Gui, +LastFound
WinSet, Transparent, 200

CheckKeyPress:
If (WinExist("ahk_exe FiveM_b2612_GTAProcess.exe")) {
    If GetKeyState("e", "P")
    {
		If (count_e_press = 2) {
			++count_ore
			count_e_press := 0
		}
		Gui, Font, cGreen
		Gui, Add, Text, x10 y10 w200 h30, SPEEDING... | MINAT - %count_ore%
        Run, util\start_spd.ct
        Sleep, 500
		Gui, Font, cRed
		Gui, Add, Text, x10 y10 w200 h30, SPDHACK - ON | MINAT - %count_ore%
        Run, util\stop_spd.ct
		count_e_press++
    }

    if GetKeyState("-", "P")
    {
		Gui, Font, cWhite
		Gui, Add, Text, x10 y10 w200 h30, Killing FiveM...
		fake_kill := true
        Process, Close, FiveM_b2612_GTAProcess.exe
        Sleep, 30000
		Gui, Font, cGreen
		Gui, Add, Text, x10 y10 w200 h30, Starting FiveM...
		Run, "https://cfx.re/join/a8mlb9"
		Gui, Font, cRed
		Gui, Add, Text, x10 y10 w200 h30, SPDHACK - ON | MINAT - %count_ore%
    }

    if GetKeyState("=", "P")
    {
		ExitApp
    }
} 
else { 
	If (!fake_kill) {
		MsgBox, FiveM is not running.
		ExitApp
	} else {
		;do nothing
		Gui, Font, cRed
		Gui, Add, Text, x10 y10 w200 h30, SPDHACK - ON | MINATE - %count_ore%
	}
}
GuiClose:
GuiEscape:
return