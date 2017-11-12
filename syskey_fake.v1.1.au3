#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=D:\Autoit Script\Syskey\lock.ico
#AutoIt3Wrapper_Outfile=D:\Autoit Script\Syskey\Syskey_fake.exe
#AutoIt3Wrapper_Res_Fileversion=1.1
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
;Fake Syskey by Xenomorphdelombre Rev 1.1

;Release note:
;V1.1
;	Changed the part that tells to contact Microsoft for a Microsoft scam report instead and removed the Notepad in order to make it less obvious.

;If you build the executable from Scite Autoit editor don't forget to change the location of the .ico and Image

#include <MsgBoxConstants.au3>
#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <date.au3>
#include <WindowsConstants.au3>
#include <Misc.au3>

HotKeySet("{ESC}", "_Cancel")
$Logfile = "C:\temp\syskeylol.log"

DllCall("uxtheme.dll", "none", "SetThemeAppProperties", "int", 0)
Global $Form2 = 1
Global $Button5 = 1
Global $Button4 = 1
Global $Radio5 = 1
Global $Radio4 = 1
Global $Radio3 = 1
Global $Radio6 = 1
Global $Label2 = 1
Global $Label3 = 1
Global $Label4 = 1
Global $PASSWORD = 1
Global $CONFIRM = 1

GUI1()
Func GUI1()
$Form1 = GUICreate("Securing the Windows Account Database", 343, 234, 325, 145, $WS_SYSMENU)
GUISetIcon("D:\Autoit Script\syskey\lock.ico")
$Static2 = GUICtrlCreateLabel("This tool will allow you to configure the Accounts Database to enable additional encryption, further protecting the database from compromise.", 78, 16, 232, 55)
$Label1 = GUICtrlCreateLabel("Once enabled, this encryption cannot be disabled.", 78, 78, 241, 17)
$Radio1 = GUICtrlCreateRadio("Encryption Disabled", 78, 112, 239, 17)
GUICtrlSetState(-1, $GUI_DISABLE)
$Radio2 = GUICtrlCreateRadio("Encryption Enabled", 78, 132, 239, 17)
GUICtrlSetState(-1, $GUI_CHECKED)
$Button1 = GUICtrlCreateButton("OK", 51, 163, 71, 23, $WS_GROUP)
$Button2 = GUICtrlCreateButton("Cancel", 128, 163, 71, 23, $WS_GROUP)
$Button3 = GUICtrlCreateButton("&Update", 204, 163, 71, 23, $WS_GROUP)
$Pic1 = GUICtrlCreatePic("d:\Syskey\lock.jpg", 14, 14, 48, 48, BitOR($SS_NOTIFY,$WS_GROUP,$WS_CLIPSIBLINGS))
GUISetState(@SW_SHOW)


While 1
   Switch GUIGetMsg()
	  Case $GUI_EVENT_CLOSE
	  If WinActive("Startup Key") Then
		  GUIDelete($Form2)
	  ElseIf WinActive("Securing the Windows Account Database") Then
		  Exit
	  EndIf


	  Case $Button1
	  sleep(1000)
	  Exit
Case $Button2
   Exit

   Case $Button3
	If WinExists("Startup Key") Then
			WinActivate($Form2)
	Else
		GUI2()
	EndIf

Case $Button5
	GUIDelete($Form2)

Case $Radio3
	GUICtrlSetState($Radio5, $GUI_DISABLE)
	GUICtrlSetState($Radio6, $GUI_DISABLE)
	GUICtrlSetState($Label2, $GUI_ENABLE)
	GUICtrlSetState($Label3, $GUI_ENABLE)
	GUICtrlSetState($Label4, $GUI_ENABLE)
	GUICtrlSetState($PASSWORD, $GUI_ENABLE)
	GUICtrlSetState($CONFIRM, $GUI_ENABLE)

Case $Radio4
	GUICtrlSetState($Radio5, $GUI_ENABLE)
	GUICtrlSetState($Radio6, $GUI_ENABLE)
	GUICtrlSetState($Label2, $GUI_DISABLE)
	GUICtrlSetState($Label3, $GUI_DISABLE)
	GUICtrlSetState($Label4, $GUI_DISABLE)
	GUICtrlSetState($PASSWORD, $GUI_DISABLE)
	GUICtrlSetState($CONFIRM, $GUI_DISABLE)

	Case $Button4
	If GUICtrlRead($Radio3) = 1 Then
		   If GuiCtrlRead($PASSWORD) = GUICtrlRead($CONFIRM) Then
			   MsgBox(64, "Success", "The Account Database Startup Key was changed.")
			   Logit("Startup password changed for " & GUICtrlRead($PASSWORD))
			   GUIDelete($Form2)
			   GUIDelete($Form1)
			   sleep(3000)
			   MsgBox(16, "System Error", "The Account Database Startup has been corrupted." & @CRLF & @CRLF & "Click ok to open https://support.microsoft.com/en-us")
			   BlockInput(1)
			   ShellExecute("iexplore.exe", "https://www.microsoft.com/en-us/reportascam/")
			   BlockInput(0)
			   Exit
		   Else
			   MsgBox(16, "System Error", "The password (" & GUICtrlRead($PASSWORD) & ") does not match the confirmation password (" & GUICtrlRead($CONFIRM) & "). Please re-enter the passwords.")
			    Logit("Startup password attempt failed. Password: " & GUICtrlRead($PASSWORD) & " and Confirmation: " & GUICtrlRead($PASSWORD) & " do not match")
		   EndIf
	Else
			GUIDelete($Form2)
	EndIf



EndSwitch
WEnd
EndFunc


Func GUI2()
    $Form2 = GUICreate("Startup Key", 306, 324, 208, 176)
		$Group1 = GUICtrlCreateGroup("", 16, 16, 273, 121)

	  $Group2 = GUICtrlCreateGroup("", 16, 150, 273, 139)
	  GUISetIcon("D:\Autoit Script\syskey\invisible.ico")
	  GUIStartGroup()
	  $Radio3 = GUICtrlCreateRadio("Password Startup", 23, 10, 105, 22)
	  $Radio4 = GUICtrlCreateRadio("System Generated Password", 24, 150, 161, 14)
	  GUICtrlSetState(-1, $GUI_CHECKED)


	  $Label2 = GUICtrlCreateLabel("Requires a password to be entered during system start.", 40, 33, 245, 29)
	  GUICtrlSetState(-1, $GUI_DISABLE)
	  $Label3 = GUICtrlCreateLabel("Password:", 40, 72, 53, 17)
	  GUICtrlSetState(-1, $GUI_DISABLE)
	  $Label4 = GUICtrlCreateLabel("Confirm:", 40, 100, 42, 17)
	  GUICtrlSetState(-1, $GUI_DISABLE)
	  $PASSWORD = GUICtrlCreateInput("", 112, 72, 161, 21, $ES_PASSWORD)
	  GUICtrlSetState(-1, $GUI_DISABLE)
	  $CONFIRM = GUICtrlCreateInput("", 112, 99, 161, 21, $ES_PASSWORD)
	  GUICtrlSetState(-1, $GUI_DISABLE)
	  GUICtrlCreateGroup("", -99, -99, 1, 1)

	  GUIStartGroup()
	  $Radio5 = GUICtrlCreateRadio("Store Startup Key on Floppy &Disk", 40, 170, 233, 17)
	  $Radio6 = GUICtrlCreateRadio("Store Startup Key Locally", 40, 224, 185, 17)
	  GUICtrlSetState(-1, $GUI_CHECKED)
	  $Label5 = GUICtrlCreateLabel("Requires a floppy disk to be inserted during system start.", 56, 188, 231, 24)
	  $Label6 = GUICtrlCreateLabel("Stores a key as part of the operating system, and no interaction is required during system start.", 56, 240, 225, 44)
	  GUICtrlCreateGroup("", -99, -99, 1, 1)
	  $Button4 = GUICtrlCreateButton("OK", 78, 296, 71, 23, $WS_GROUP)
	  $Button5 = GUICtrlCreateButton("Cancel", 156, 296, 71, 23, $WS_GROUP)


	  GUICtrlSetState(-1, $GUI_CHECKED)
	  GUISetState(@SW_SHOW)
  EndFunc

Func _Cancel()
		If WinExists("Startup Key") then
			GUIDelete("$Form2")
		Else
			Exit
		EndIf
EndFunc

;~ Function to log easily
Func LogIt($sText)
    FileWrite($Logfile, _NowCalcDate() & " " & _NowTime() & ": " & $sText & @CRLF)
EndFunc
