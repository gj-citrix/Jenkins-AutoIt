#Include <GuiToolBar.au3>

HotKeySet("{ESC}", "Terminate")

;Opt("TrayMenuMode", 9) ; The default tray menu items will not be shown and items are not checked when selected. These are options 1 and 2 for TrayMenuMode.


; **** Following line for for Win7, for Win10, try to replace Instance:1 with Instance:2
$hSysTray = ControlGetHandle('[Class:Shell_TrayWnd]', '', '[Class:ToolbarWindow32;Instance:1]')

Local $j = 0, $cnt = 1, $issueCnt = 3
; $issueCnt should not be the same as the array index below
Local $issues[3] = ["AutoIt", "Skype", "SQL"]
Local $issue_description[3] = ["AutoIt Issue -- ", "Skype Issue -- ", "SQL Issue -- "]

Do
	ConsoleWrite("===============  Loop # " & $j & " =============" & @CRLF)

	AutoItSetOption("MouseCoordMode", 1) ; need this to make the following For loop work

	For $i = 1 To _GUICtrlToolbar_ButtonCount($hSystray)
		$sCurrent = _GUICtrlToolbar_GetButtonText($hSystray,$i)

		If StringInStr($sCurrent, "ShareConnect") Then
			;ConsoleWrite($i & ": " & $sCurrent & @CRLF)
			_GUICtrlToolbar_ClickIndex($hSysTray, $i) ; not sure why but we need it.
			$cmdId = _GUICtrlToolbar_IndexToCommand($hSysTray, $i)

			ConsoleWrite("cmdId" & " : " & $cmdId & @CRLF)
			_GUICtrlToolbar_ClickButton($hSysTray, $cmdId)
			;Sleep(3000)
			ExitLoop
		EndIf

	Next


	; Click "Get help"
	ConsoleWrite("Click Get help" & @CRLF)
	;MouseMove(1591, 940)
	MouseMove(1794, 980)
	Sleep(5000)
	MouseClick("left")
	;MouseClick("primary", 1591, 980, 1, 0)


	AutoItSetOption("MouseCoordMode", 0)

	$hnd = WinWaitActive("ShareConnect", "", 10)

	If $hnd = 0 Then
		ConsoleWrite("ERROR -- WinWaitActive return 0! " & @CRLF)
		Terminate()
	Else
		ConsoleWrite("WinActivate return value : " & $hnd & @CRLF)
		Sleep(2000)
	EndIf

	ConsoleWrite("In Search box" & @CRLF)
	Send("{TAB}")
	Send($issues[Mod($j, $issueCnt)])
	Sleep(1000)
	MouseClick("primary", 38, 180, 2, 0)
	Sleep(1000)
	ConsoleWrite("In Description box" & @CRLF)
	Send("{TAB}")
	Send($issue_description[Mod($j, $issueCnt)] & $j)
	Sleep(2000)

	; Submit
	ConsoleWrite("Submit" & @CRLF)
	Send("{TAB}")
	Send("{TAB}")
	Send("{ENTER}")
	Sleep(2000)

	$wText = WinGetText("[ACTIVE]")
	If StringInStr($wText, "Failed to raise the Ticket") Then
		ConsoleWrite("Failed to raise a ticket! Cancel")
		Send("{TAB}")
		Send("{ENTER}")
	Else
		Sleep(1000)
		Send("{ENTER}")
	EndIf

	$j += 1

	Sleep(5000)
Until $j = $cnt

ConsoleWrite("Close DA" & @CRLF)
MouseClick("primary", 672, 6, 1, 0)

Func Terminate()
	Exit
EndFunc
