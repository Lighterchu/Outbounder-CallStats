#SingleInstance, Force
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
CoordMode,Mouse ,screen
#Include outbounderHelp-WideSales.ahk



;#----------------------HANDELS THE GUI------------------------



Gui, Color, 000000
Gui, Font,, Lucida Fax


Gui, Add, Text,cRed , The Outbound call clicker





Gui, +AlwaysOnTop
Gui, Add, Button, Default x10  w100 h30 gManualLeavingMessage,Manual Leave message
Gui, Add, Button, Default x145 y26  w100 h30 gEndingCalling ,End Call
Gui, Add, Button, Default x265 y26  w100 h30 gTrack ,Track Calls


;telly to show how many sales and number of calls 
Gui, Add, ListView, x0 r20 w700 , Calls




Gui, Show, w400 h190, OutBounder Call Clicker,Gui
Return 


global calls := 0
nbnSales := 0
AutoCall := 0
global matchingLeads 
global moveMouseSpeed := 500

devmode := 1
holdSaveAndCLoseButton := 154, 822



;#----------------------------------------------

;#--------------------FUNCTIONS--------------------------

ManualLeavingMessage()
{
    
    BlockInput On
	; move the mouse to the next window click on it and then leave message
	click, 1999, 430
	CoordMode,Mouse ,window
	click, 65, 241
	click, 204, 237
	click, 216, 195
	
	HandUpCall()
	EndCallTracker()
	BlockInput Off
    
}


HandUpCall()
{
	CoordMode,Mouse ,screen
	click, 2310, 939
	
}



EndingCalling()
{
 
 EndCallTracker()
	
}
EndCallTracker() {
	calls++

 
	LV_Modify("calls"," ",calls)
}


Track()
{
  LV_Add("calls", 0)
 
}

;#--------------------------------------------------------

;#------------------------LOGIC--------------------------------



::]m::
if WinExist("MicroSIP")
{
	ManualLeavingMessage() 
}
return 



:*:]c::  	
send,Converted
Return

::]test::
send,{Enter}
return

::]d:: 	
send, Dupe lead 
Return

:*:]s:: 
send,Slacked to 
return

:*:]relo:: 
send,Relocation Of Service
Return

::]dis:: 
send, Disconnected
Click, 2343, 929
return

:*:]pass::
send, Please Pass to me 2338
return



^q::ExitApp




