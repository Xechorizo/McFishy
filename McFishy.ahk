#SingleInstance, Force
#KeyHistory, 0
SetBatchLines, -1
SendMode Input ; Forces Send and SendRaw to use SendInput buffering for speed.
SetWorkingDir, %A_ScriptDir%
#MaxThreadsPerHotkey, 1 ; No re-entrant hotkey handling
SetWinDelay, -1 ; Remove short delay done automatically after every windowing command except IfWinActive and IfWinExist
SetKeyDelay, -1, -1 ; Remove short delay done automatically after every keystroke sent by Send or ControlSend
SetMouseDelay, -1 ; Remove short delay done automatically after Click and MouseMove/Click/Drag

; Make sure Accessibility Subtitles are ON!
; Make sure your Minecraft window is the active window BEFORE hitting ALT SHIFT F!
; Make sure your line is cast BEFORE holding Left Mouse Button!
; Make sure a fish bites BEFORE letting go of Left Mouse Button!

; Make sure to set these paths to the Capture2Text 3.9 files - Later versions are not supported!
FullC2TPath := "C:\Games\Capture2Text\Capture2Text.exe"
FullOCRPath := "C:\Games\Capture2Text\Output\ocr.txt"

SoundPlay, %A_WinDir%\Media\Windows Message Nudge.wav

; Hotkey ALT SHIFT F to begin
+!f::
	Quit := 0
	Process, Priority, AutoHotKey.exe, High
	WinGet, MCWin, ID, A
	getSelectionCoords(x_start, x_end, y_start, y_end)
	SoundPlay, %A_WinDir%\Media\Windows Hardware Insert.wav
	Loop 
	{
		RunWait, %FullC2TPath% %x_start% %y_start% %x_end% %y_end%
		FileRead, Capture, %FullOCRPath%
		If (RegExMatch(Capture, "Fish"))
		{
			ControlClick, x%x_start% y%y_start%, ahk_id %MCwin%,,R,, NA
			Sleep, 500
			ControlClick, x%x_start% y%y_start%, ahk_id %MCwin%,,R,, NA
			Sleep, 3500
		}
		Else If (Quit)
		{
			SoundPlay, %A_WinDir%\Media\Windows Hardware Remove.wav
			Return
		}
	}
Return

; Hotkey ALT SHIFT Q to stop loop
+!q::
Quit++
Return

; Hotkey ALT SHIFT X to exit script
+!x::
SoundPlay, %A_WinDir%\Media\tada.wav
Sleep, 1200
ExitApp

; Create an overlay and allow lasso OCR
getSelectionCoords(ByRef x_start, ByRef x_end, ByRef y_start, ByRef y_end) {

	; Overlay the screen
	Gui, Color, FFFFFF
	Gui +LastFound
	WinSet, Transparent, 50
	Gui, -Caption 
	Gui, +AlwaysOnTop
	Gui, Show, x0 y0 h%A_ScreenHeight% w%A_ScreenWidth%,"AutoHotkeySnapshotApp"     

	; Lasso the OCR area
	CoordMode, Mouse, Screen
	CoordMode, Tooltip, Screen
	WinGet, hw_frame_m,ID,"AutoHotkeySnapshotApp"
	hdc_frame_m := DllCall( "GetDC", "uint", hw_frame_m)
	KeyWait, LButton, D 
	MouseGetPos, scan_x_start, scan_y_start 
	Loop
	{
		Sleep, 10   
		KeyIsDown := GetKeyState("LButton")
		If (KeyIsDown = 1)
		{
			MouseGetPos, scan_x, scan_y 
			DllCall( "gdi32.dll\Rectangle", "uint", hdc_frame_m, "int", 0,"int",0,"int", A_ScreenWidth,"int",A_ScreenWidth)
			DllCall( "gdi32.dll\Rectangle", "uint", hdc_frame_m, "int", scan_x_start,"int",scan_y_start,"int", scan_x,"int",scan_y)
		} 
		Else
		{
			Break
		}
	}

	; Define the lasso area
	MouseGetPos, scan_x_end, scan_y_end
	Gui Destroy
	
	if (scan_x_start < scan_x_end)
	{
		x_start := scan_x_start
		x_end := scan_x_end
	} else {
		x_start := scan_x_end
		x_end := scan_x_start
	}
	
	if (scan_y_start < scan_y_end)
	{
		y_start := scan_y_start
		y_end := scan_y_end
	} else {
		y_start := scan_y_end
		y_end := scan_y_start
	}
}