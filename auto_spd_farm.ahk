#Persistent ; Keeps the script running
SetTimer, CheckKeyPress, 100 ; Checks keypress every 100 milliseconds

CheckKeyPress:
If (ProcessExist("FiveM_b2612_GTAProcess.exe")) {
    If GetKeyState("e", "P") ; Checks if the "e" key is pressed
    {
	Sleep, 100
        Run, util\start_spd.ct
        Sleep, 1000 ; Sleep for 1 second
        Run, util\stop_spd.ct
    }
	
    if GetKeyState("=", "P") ; Checks if the "=" key is pressed
    {
        ExitApp ; Exits the script if "=" key is pressed
    }
} else {
    MsgBox, FiveM is not running.
}
return