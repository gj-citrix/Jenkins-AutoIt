#Include <GuiToolBar.au3>

$hSysTray = ControlGetHandle('[Class:Shell_TrayWnd]', '', '[Class:ToolbarWindow32;Instance:1]')
MsgBox(0, "hSysTray", $hSysTray)

  For $i = 1 To _GUICtrlToolbar_ButtonCount($hSystray)
		$sCurrent = _GUICtrlToolbar_GetButtonText($hSystray,$i)
 		ConsoleWrite($i & ": " & $sCurrent & @CRLF)
;~ 		If $sCurrent = $sToolTip Then
;~ 			_GUICtrlToolbar_ClickButton($hSystray, $i, "left")
;~ 			ExitLoop
;~ 		EndIf
	Next