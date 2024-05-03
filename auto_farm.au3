#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.16.1
 Author:         myName

 Script Function:
	Template AutoIt script.

#ce ----------------------------------------------------------------------------

ToolTip("Starting FiveM...", @DesktopWidth/2, @DesktopHeight)

; Start the executable
Run("FiveM.exe +connect 45.135.201.241:30120 " , "F:\Epic Games\")

; Wait for the executable to launch (adjust the sleep time as needed)
Sleep(5000)

; Define an array of image file paths (replace with your actual image file paths)
$imagePaths = ["images\connect.png"]

; Flag to indicate if any image is found
Local $imageFound = False

; Loop through each image path and search for the target images on the screen
For $i = 0 To UBound($imagePaths) - 1
    Local $searchResult = _ImageSearch($imagePaths[$i], 0, 0, @DesktopWidth, @DesktopHeight)

    ; Check if the image is found
    If Not @error Then
        ; If found, move the mouse to the image and click
        MouseMove($searchResult[0], $searchResult[1])
        Sleep(500) ; Add a small delay before clicking (adjust as needed)
        MouseClick("left")

        ; Set the flag to indicate that an image is found
        $imageFound = True

        ; Exit the loop if an image is found (comment this line if you want to continue searching for other images)
        ExitLoop
    EndIf
Next

; Check if any image is found
If Not $imageFound Then
    MsgBox(16, "Error", "No matching image found!")
EndIf

; Function to perform image search
Func _ImageSearch($findImage, $left, $top, $right, $bottom)
    Local $result = DllCall("AutoItX3.dll", "int", "AU3_ImageSearch", "str", $findImage, "int", $left, "int", $top, "int", $right, "int", $bottom, "int", 0)
    
    If $result[0] = 1 Then
        Return [Number($result[1]), Number($result[2])]
    Else
        Return @error
    EndIf
EndFunc

; Check for 'Esc' key to exit the script
While 1
    If _IsPressed("1B") Then ; 'Esc' key pressed
        Exit
    EndIf
    Sleep(100)
WEnd
