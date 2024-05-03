#Persistent ; Keeps the script running

Loop {
    Run, gta.ct
    Sleep, 10500
}

; Hotkey to stop the script and execute gta_stop.ct
-::
    Run, gta_stop.ct ; Execute the gta_stop.ct script
    ExitApp ; Exit the script
    return