#RequireAdmin

HotKeySet("{ESC}", "Terminate")

Local $user_name = "gjwin10rel@grr.la"
Local $win_usr = 'Tester'
Local $win_pwd = 'Test1234'

ConsoleWrite("Launching... " & @CRLF)
Run("C:\Users\gwojiehw\AppData\Local\Citrix\ShareConnectDesktopApp\" & "ShareConnect.Client.WindowsDesktop.exe")
AutoItSetOption("MouseCoordMode", 0)

$hnd = WinWaitActive("ShareConnect", "", 10)

If $hnd = 0 Then
	ConsoleWrite("WinWaitActive return 0! " & @CRLF)
	Terminate()
Else
	ConsoleWrite("WinActivate return value : " & $hnd & @CRLF)
	Sleep(2000)
EndIf

Send("{TAB}")
Send("{TAB}")
Send("{TAB}") ; move to user name
Send($user_name)
Send("{TAB}") ; move to pwd
Send("Test1234")
Send("{ENTER}") ; move to Sign In
Sleep(10000) ; wait to sign in

ConsoleWrite("Click Computer" & @CRLF)
MouseClick("primary", 68, 230, 1, 0)
Sleep(10000)

Send($win_usr)
Send("{TAB}") ; move to pwd
Send($win_pwd)
Send("{ENTER}") ; move to Sign In
Sleep(15000)

;~ If WinExists($hnd) Then
;~ 	MsgBox(0, "", "Yes")
;~ Else
;~ 	MsgBox(0, "", "No")
;~ EndIf

MouseClick("primary") ; odd... need to to "trigger" the windows on screen

$hnd = WinWaitActive("ShareConnect", "", 5)
If $hnd = 0 Then
	ConsoleWrite("WinWaitActive return 0! " & @CRLF)
	Terminate()
Else
	ConsoleWrite("WinActivate return value : " & $hnd & @CRLF)
EndIf

ConsoleWrite("Click CTRL-ALT-SEL" & @CRLF)
MouseClick("primary", 1575, 91, 1, 0)
Sleep(2000)

ConsoleWrite("Click Cancel" & @CRLF)
MouseClick("primary", 840, 685, 1, 0)
;~ Send("{TAB}")
;~ Send("{TAB}")
;~ Send("{TAB}")
;~ Send("{TAB}")
;~ Send("{TAB}")
;~ Send("{ENTER}")
Sleep(3000)

ConsoleWrite("Back to Home page" & @CRLF)
MouseClick("primary", 42, 87, 1, 0)
Sleep(5000)

ConsoleWrite("Disconnect from computer" & @CRLF)
MouseClick("primary", 240, 222, 1, 0)
Sleep(5000)

ConsoleWrite("To show Sign Out" & @CRLF)
MouseClick("primary", 34, 72, 1, 0)
Sleep(1000)
ConsoleWrite("Click Sign Out" & @CRLF)
MouseClick("primary", 65, 447, 1, 0)
Sleep(1000)
ConsoleWrite("Click Yes" & @CRLF)
;MouseClick("primary", 538, 360, 1, 0)
Send("{ENTER}")
Sleep(8000)

ConsoleWrite("Close DA" & @CRLF)
MouseClick("primary", 772, 12, 1, 0)


Func Terminate()
	Exit
EndFunc
