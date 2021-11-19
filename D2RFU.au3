#RequireAdmin
#include <GUIConstantsEx.au3>
#include <AutoItConstants.au3>
#include <MsgBoxConstants.au3>
Opt("WinTitleMatchMode", 3)
Local Const $inipath = @ScriptDir & "/config.ini"
Local $go = False
HotKeySet("{numpad1}", "SendGame")
HotKeySet("{numpad2}", "ExitGame")


Example()


Func ExitGame()
	ToolTip("Exiting Game ",0,0)
	$exitgames = IniWrite($inipath, "D2FU", "ExitGame", "True")
	ToolTip("",0,0)
EndFunc


Func SendGame()
	$single = IniRead($inipath, "D2FU", @ComputerName & "Singlepc", "Default Value")
	if $single = "True" Then
		ToolTip("single pc",0,0)
		$tempgame = ClipGet()
		ToolTip("Sending Game " & $tempgame,0,0)
		$gamemake = IniWrite($inipath, "D2FU", "GameName", $tempgame)
		$gamemake = IniWrite($inipath, "D2FU", "JoinGame", "True")
		ToolTip("",0,0)

	Else
		ToolTip("Multiple pc",0,0)
		$create = IniRead($inipath, "D2FU", @ComputerName & "Creator", "Default Value")
		If $create = "True" Then
			$tempgame = ClipGet()
			ToolTip("Sending Game " & $tempgame,0,0)
			$gamemake = IniWrite($inipath, "D2FU", "GameName", $tempgame)
			$gamemake = IniWrite($inipath, "D2FU", "JoinGame", "True")
			ToolTip("",0,0)
		EndIf
	EndIf



EndFunc

Func JoinWindow($data)
	$gamecheck = IniRead($inipath, "D2FU", "GameName", "Default Value")
	$gamepass = IniRead($inipath, "D2FU", "GamePass", "Default Value")
	If WinExists($data) Then
		ToolTip($data & " Window found joining " & $gamecheck & "/" & $gamepass,0,0)
		ToolTip($data & " Window Activated Joining " & $gamecheck & "/" & $gamepass,0,0)
		If WinActivate($data) Then
			Sleep(500)
			Send($gamecheck)
			Sleep(300)
			Send("{TAB}")
			Sleep(300)
			Send($gamepass)
			Sleep(300)
			Send("{ENTER}")
		Else
			ToolTip("FAILED TO ACTIVATE " & $data,0,0)
		EndIf
	Else
		ToolTip($data & " Window not found",0,0)
	EndIf
	ToolTip("",0,0)
EndFunc

Func ExitWindow($data)
	$gamecheck = IniRead($inipath, "D2FU", "GameName", "Default Value")
	$gamepass = IniRead($inipath, "D2FU", "GamePass", "Default Value")
	If WinExists($data) Then
		ToolTip($data & " Window found exiting " & $gamecheck & "/" & $gamepass,0,0)
		Sleep(2000)
		ToolTip($data & " Window Activated exiting " & $gamecheck & "/" & $gamepass,0,0)
		If WinActivate($data) Then
			Sleep(500)
			Send("{ESCAPE}")
			Sleep(300)
			Send("{DOWN}")
			Sleep(100)
			Send("{DOWN}")
			Sleep(100)
			Send("{up}")
			Sleep(100)
			Send("{enter}")
		Else
			ToolTip("FAILED TO ACTIVATE " & $data,0,0)
		EndIf
	Else
		ToolTip($data & " Window not found",0,0)
	EndIf
	ToolTip("",0,0)
EndFunc

Func Example()
	Local $iFileExists = FileExists($inipath)
	; Display a message of whether the file exists or not.
	If $iFileExists Then
		$mainv = IniRead($inipath, "D2FU", "Mainwindow", "Default Value")
		$char1v = IniRead($inipath, "D2FU", "Window1", "Default Value")
		$char2v = IniRead($inipath, "D2FU", "Window2", "Default Value")
		$char3v = IniRead($inipath, "D2FU", "Window3", "Default Value")
		$char4v = IniRead($inipath, "D2FU", "Window4", "Default Value")
		$char5v = IniRead($inipath, "D2FU", "Window5", "Default Value")
		$char6v = IniRead($inipath, "D2FU", "Window6", "Default Value")
		$char7v = IniRead($inipath, "D2FU", "Window7", "Default Value")
		$single = IniRead($inipath, "D2FU", @ComputerName & "Singlepc", "Default Value")
		$multiple = IniRead($inipath, "D2FU", @ComputerName & "Multiplepc", "Default Value")
		$follow = IniRead($inipath, "D2FU", @ComputerName & "Follower", "Default Value")
		$create = IniRead($inipath, "D2FU", @ComputerName & "Creator", "Default Value")
		$netpath = IniRead($inipath, "D2FU", "ConfigPath", "Default Value")
		$gamepass = IniRead($inipath, "D2FU", "GamePass", "Default Value")

	Else
		$mainv = IniWrite($inipath, "D2FU", "Mainwindow", "")
		$char1v = IniWrite($inipath, "D2FU", "Window1", "")
		$char2v = IniWrite($inipath, "D2FU", "Window2", "")
		$char3v = IniWrite($inipath, "D2FU", "Window3", "")
		$char4v = IniWrite($inipath, "D2FU", "Window4", "")
		$char5v = IniWrite($inipath, "D2FU", "Window5", "")
		$char6v = IniWrite($inipath, "D2FU", "Window6", "")
		$char7v = IniWrite($inipath, "D2FU", "Window7", "")
		$single = IniWrite($inipath, "D2FU", @ComputerName & "Singlepc", "False")
		$multiple = IniWrite($inipath, "D2FU",@ComputerName & "Multiplepc", "False")
		$follow = IniWrite($inipath, "D2FU", @ComputerName & "Follower", "False")
		$create = IniWrite($inipath, "D2FU", @ComputerName & "Creator", "False")
		$netpath = IniWrite($inipath, "D2FU", "ConfigPath", "")
		$joingame = IniWrite($inipath, "D2FU", "JoinGame", "False")
		$exitgame = IniWrite($inipath, "D2FU", "ExitGame", "False")
		$gamename = IniWrite($inipath, "D2FU", "GameName", "")
		$gamepass = IniWrite($inipath, "D2FU", "GamePass", "")


		ShellExecute(@ScriptName)
		Exit
	EndIf
	; Create a GUI with various controls.
	Local $hGUI = GUICreate("D2RFU", 300, 450)
	; Create a button control.
	GUICtrlCreateLabel("DR RESURECTED FOLLOW YOU", 55, 10, 350)
	$startpos1 = 53
	$startpos2 = 50
	GUICtrlCreateLabel("WINDOW TITLE SETINGS", 55, $startpos1, 350)
	$startpos1 = $startpos1 + 25
	$startpos2 = $startpos2 + 25
	GUICtrlCreateLabel("MAIN", 5, $startpos1, 50)
	Local $main = GUICtrlCreateInput($mainv, 55, $startpos2, 200, 20)
	GUICtrlSetTip($main, "ENTER YOUR MAIN WINDOW THE ONE YOU PLAY ON")
	$startpos1 = $startpos1 + 25
	$startpos2 = $startpos2 + 25
	GUICtrlCreateLabel("Window 1", 5, $startpos1, 50)
	Local $char1 = GUICtrlCreateInput($char1v, 55, $startpos2, 200, 20)
	GUICtrlSetTip($char1, "Followers window titles go here.")
	$startpos1 = $startpos1 + 25
	$startpos2 = $startpos2 + 25
	GUICtrlCreateLabel("Window 2", 5, $startpos1, 50)
	Local $char2 = GUICtrlCreateInput($char2v, 55, $startpos2, 200, 20)
	GUICtrlSetTip($char2, "Followers window titles go here.")
	$startpos1 = $startpos1 + 25
	$startpos2 = $startpos2 + 25
	GUICtrlCreateLabel("Window 3", 5, $startpos1, 50)
	Local $char3 = GUICtrlCreateInput($char3v, 55, $startpos2, 200, 20)
	GUICtrlSetTip($char3, "Followers window titles go here.")
	$startpos1 = $startpos1 + 25
	$startpos2 = $startpos2 + 25
	GUICtrlCreateLabel("Window 4", 5, $startpos1, 50)
	Local $char4 = GUICtrlCreateInput($char4v, 55, $startpos2, 200, 20)
	GUICtrlSetTip($char4, "Followers window titles go here.")
	$startpos1 = $startpos1 + 25
	$startpos2 = $startpos2 + 25
	GUICtrlCreateLabel("Window 5", 5, $startpos1, 50)
	Local $char5 = GUICtrlCreateInput($char5v, 55, $startpos2, 200, 20)
	GUICtrlSetTip($char5, "Followers window titles go here.")
	$startpos1 = $startpos1 + 25
	$startpos2 = $startpos2 + 25
	GUICtrlCreateLabel("Window 6", 5, $startpos1, 50)
	Local $char6 = GUICtrlCreateInput($char6v, 55, $startpos2, 200, 20)
	GUICtrlSetTip($char6, "Followers window titles go here.")
	$startpos1 = $startpos1 + 25
	$startpos2 = $startpos2 + 25
	GUICtrlCreateLabel("Window 7", 5, $startpos1, 50)
	Local $char7 = GUICtrlCreateInput($char7v, 55, $startpos2, 200, 20)
	GUICtrlSetTip($char7, "Followers window titles go here.")
	$startpos1 = $startpos1 + 25
	$startpos2 = $startpos2 + 25
	If $single = "" And $multiple = "" Then
		$selectorlabel = GUICtrlCreateLabel("SELECT SINGLE OR MULTIPLE PCS", 55, $startpos2, 350)
	Else
	EndIf
	$startpos1 = $startpos1 + 25
	$startpos2 = $startpos2 + 25
	Local $singlepc = GUICtrlCreateCheckbox("Single PC", 10, $startpos1, 90, 25)
	Local $multiplepc = GUICtrlCreateCheckbox("Multiple PCS", 100, $startpos1, 185, 25)
	Local $creator = GUICtrlCreateCheckbox("Creator", 10, $startpos1 + 25, 90, 25)
	Local $follower = GUICtrlCreateCheckbox("Follower", 100, $startpos1 + 25, 185, 25)
	$startpos1 = $startpos1 + 55
	$startpos2 = $startpos2 + 55
	GUICtrlCreateLabel("Config:", 5, $startpos1, 50)
	Local $configpath = GUICtrlCreateInput($netpath, 55, $startpos2, 200, 20)
	$startpos1 = $startpos1 + 25
	$startpos2 = $startpos2 + 25
	GUICtrlCreateLabel("Password:", 5, $startpos1, 50)
	Local $gamepassword = GUICtrlCreateInput($gamepass, 55, $startpos2, 200, 20)


	Local $save = GUICtrlCreateButton("Save", 5, 420, 85, 25)
	Local $close = GUICtrlCreateButton("Close", 210, 420, 85, 25)

	If $single = "True" Then
		GUICtrlSetState($singlepc, $GUI_CHECKED)
		GUICtrlSetState($follower,$GUI_DISABLE)
		GUICtrlSetState($creator,$GUI_DISABLE)
	EndIf
	If $multiple = "True" Then
		GUICtrlSetState($multiplepc, $GUI_CHECKED)
	EndIf
	If $follow = "True" Then
		GUICtrlSetState($follower, $GUI_CHECKED)
	EndIf
	If $create = "True" Then
		GUICtrlSetState($creator, $GUI_CHECKED)
	EndIf
	; Display the GUI.
	GUISetState(@SW_SHOW, $hGUI)

	Local $iPID = 0


	While 1
		If $single = "True" Then

				$gamecheck = IniRead($inipath, "D2FU", "JoinGame", "Default Value")
				$exitcheck = IniRead($inipath, "D2FU", "ExitGame", "Default Value")
				$mainv = IniRead($inipath, "D2FU", "Mainwindow", "Default Value")
				if $gamecheck = "True" Then
					For $i = 1 To 7 Step +1
						$wincheck = IniRead($inipath, "D2FU", "Window" & $i, "Default Value")
						if $wincheck Then
							JoinWindow($wincheck)
						EndIf
					Next
					$gamemake = IniWrite($inipath, "D2FU", "JoinGame", "False")
					If WinActivate($mainv) Then
					Else
						ToolTip("FAILED TO ACTIVATE " & $mainv,0,0)
					EndIf
				EndIf
				if $exitcheck = "True" Then
					ToolTip("Waiting to exit",0,0)
					Sleep(1000)
					For $i = 1 To 7 Step +1
						$wincheck = IniRead($inipath, "D2FU", "Window" & $i, "Default Value")
						if $wincheck Then
							ExitWindow($wincheck)
						EndIf
					Next
					$gamemake = IniWrite($inipath, "D2FU", "ExitGame", "False")
					If WinActivate($mainv) Then
					Else
						ToolTip("FAILED TO ACTIVATE " & $mainv,0,0)
					EndIf
		Else
			If $follow = "True" Then
				$gamecheck = IniRead($inipath, "D2FU", "JoinGame", "Default Value")
				$exitcheck = IniRead($inipath, "D2FU", "ExitGame", "Default Value")
				if $gamecheck = "True" Then
					For $i = 1 To 7 Step +1
						$wincheck = IniRead($inipath, "D2FU", "Window" & $i, "Default Value")
						if $wincheck Then
							JoinWindow($wincheck)
						EndIf
					Next
					$gamemake = IniWrite($inipath, "D2FU", "JoinGame", "False")
				EndIf
				if $exitcheck = "True" Then
					For $i = 1 To 7 Step +1
						$wincheck = IniRead($inipath, "D2FU", "Window" & $i, "Default Value")
						if $wincheck Then
							ExitWindow($wincheck)
						EndIf
					Next
					$exitgame = IniWrite($inipath, "D2FU", "ExitGame", "False")
				EndIf
		EndIf
		EndIf




		EndIf
		Switch GUIGetMsg()
			Case $singlepc
				If _IsChecked($multiplepc) Then
					MsgBox($MB_SYSTEMMODAL, "Error...", "Select single OR multiple pcs...", 0, $hGUI)
					GUICtrlSetState($singlepc, $GUI_UNCHECKED)
				Else
					If _IsChecked($singlepc) Then
						$single = IniWrite($inipath, "D2FU", @ComputerName & "Singlepc", "True")
						$single = "True"
						GUICtrlSetState($follower,$GUI_DISABLE)
						GUICtrlSetState($creator,$GUI_DISABLE)
					Else
						$single = IniWrite($inipath, "D2FU", @ComputerName & "Singlepc", "False")
						GUICtrlSetState($follower,$GUI_ENABLE)
						GUICtrlSetState($creator,$GUI_ENABLE)
					EndIf
				EndIf
			Case $multiplepc
				If _IsChecked($singlepc) Then
					MsgBox($MB_SYSTEMMODAL, "Error...", "Select single OR multiple pcs...", 0, $hGUI)
					GUICtrlSetState($multiplepc, $GUI_UNCHECKED)
				Else
					If _IsChecked($multiplepc) Then
						$single = IniWrite($inipath, "D2FU", @ComputerName & "Multiplepc", "True")
					Else
						$single = IniWrite($inipath, "D2FU", @ComputerName & "Multiplepc", "False")
					EndIf
				EndIf



			Case $creator
				If _IsChecked($follower) Then
					MsgBox($MB_SYSTEMMODAL, "Error...", "Select creator OR follower...", 0, $hGUI)
					GUICtrlSetState($creator, $GUI_UNCHECKED)
				Else
					If _IsChecked($creator) Then
						$single = IniWrite($inipath, "D2FU", @ComputerName & "Creator", "True")
					Else
						$single = IniWrite($inipath, "D2FU", @ComputerName & "Creator", "False")
					EndIf
				EndIf
			Case $follower
				If _IsChecked($creator) Then
					MsgBox($MB_SYSTEMMODAL, "Error...", "Select creator OR follower...", 0, $hGUI)
					GUICtrlSetState($follower, $GUI_UNCHECKED)
				Else
					If _IsChecked($follower) Then
						$single = IniWrite($inipath, "D2FU", @ComputerName & "Follower", "True")
					Else
						$single = IniWrite($inipath, "D2FU", @ComputerName & "Follower", "False")
					EndIf
				EndIf


			Case $GUI_EVENT_CLOSE, $close
				ExitLoop

			Case $save
				IniWrite($inipath, "D2FU", "Mainwindow", GUICtrlRead($main))
				IniWrite($inipath, "D2FU", "Window1", GUICtrlRead($char1))
				IniWrite($inipath, "D2FU", "Window2", GUICtrlRead($char2))
				IniWrite($inipath, "D2FU", "Window3", GUICtrlRead($char3))
				IniWrite($inipath, "D2FU", "Window4", GUICtrlRead($char4))
				IniWrite($inipath, "D2FU", "Window5", GUICtrlRead($char5))
				IniWrite($inipath, "D2FU", "Window6", GUICtrlRead($char6))
				IniWrite($inipath, "D2FU", "Window7", GUICtrlRead($char7))
				IniWrite($inipath, "D2FU", "ConfigPath", GUICtrlRead($configpath))
				IniWrite($inipath, "D2FU", "GamePass", GUICtrlRead($gamepassword))
		EndSwitch

	WEnd
	GUIDelete($hGUI)
	If $iPID Then ProcessClose($iPID)
EndFunc   ;==>Example


Func _IsChecked($idControlID)
	Return BitAND(GUICtrlRead($idControlID), $GUI_CHECKED) = $GUI_CHECKED
EndFunc   ;==>_IsChecked
