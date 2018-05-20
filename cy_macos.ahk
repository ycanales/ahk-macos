; -----------------------------------------------------------;
; Autohotkey shortcuts to mimic my macOS keyboard workflow.  ;
;                                                            ;
; Modifiers symbols cheat sheet:                             ;
;   ^ - Control                                              ;
;   ! - Alt                                                  ;
;   + - Shift                                                ;
;   # - Windows keys                                         ;
;  <# - Left Windows key                                     ;
;  ># - Right Windows key                                    ;
;------------------------------------------------------------;


; Disables CapsLock
;---------------------------------------------------------------------------;
SetCapsLockState, AlwaysOff


; Emulates macOS Command + Shift + Left and Command + Shift + Right:
; Selects text from the cursor to the beginning and end of line.
; Control + Shift + Right/Left will snap the window to the side.
;---------------------------------------------------------------------------;
LWin & Left::
GetKeyState, state, Shift
if state = D
    Send +{Home}
else if ctrlstate = D
	SendEvent {LWin down}{Right down}{LWin up}{Right up}
else Send {Home}
Return

LWin & Right::
GetKeyState, state, Shift
GetKeyState, ctrlstate, Ctrl
if state = D
    Send +{End}
else if ctrlstate = D
    SendEvent {LWin down}{Left down}{LWin up}{Left up}
else Send {End}
Return

^M::WinMinimize, A


; Emulates Mission Control macOS shortcut.
;---------------------------------------------------------------------------;
^Up::Send, <#{Tab}            ; Ctrl + Up
CapsLock & Up:: Send, <#{Tab} ; Ctrl + Up


; When using Spanish ISO layout in an ANSI layout keyboard you'll be
; missing the < key to the right of the Left Shift key. Here I'm mapping
; it to Alt + , and Alt + . (where the symbols actually are when pressing
; Shift + , and Shift + . in ANSI layout keyboards)
;---------------------------------------------------------------------------;
Alt & ,::Send, <
Alt & .::Send, >


; Emulates common macOS shortcuts.
;---------------------------------------------------------------------------;
LWin & q::Send, !{F4} ; CMD + Q - quit app
LWin & c::Send, ^c    ; CMD + C - copy
LWin & v::Send, ^v    ; CMD + V - paste 
LWin & f::Send, ^f    ; CMD + F - find
LWin & r::Send, ^r    ; CMD + R - refresh
LWin & s::Send, ^s    ; CMD + S - save
LWin & t::Send, ^t    ; CMD + T - new tab
LWin & w::Send, ^w    ; CMD + W - close window
LWin & x::Send, ^x    ; CMD + X - cut
LWin & z::Send, ^z    ; CMD + Z - undo


; Emulates macOS Command + Shift + T to reopen last closed browser tab.
;---------------------------------------------------------------------------;
#+t::Send, ^+t


; Disables left Windows key to avoid opening the Start Menu.
;---------------------------------------------------------------------------;
;LWin::Return
;LWin Up::Return


; Windows key + Space will trigger Wox launcher shortcut (Alt + Space)
; as Wox seems unable to set Windows key + Space as its shortcut.
;---------------------------------------------------------------------------;
LWin & Space::Send, !{Space} ; CMD + Space


; Runs my Dell screen brightness control scripts.
;---------------------------------------------------------------------------;
CapsLock & 1::run, "C:\Users\cy\brightness_dimmer.cmd"
CapsLock & 2::run, "C:\Users\cy\brightness_brighter.cmd"


; Maps CapsLock + Number to Media Control keys.
;---------------------------------------------------------------------------;
CapsLock & 7::Send, {Media_Prev}
CapsLock & 8::Send, {Media_Play_Pause}
CapsLock & 9::Send, {Media_Next}
CapsLock & 0::Send, {Volume_Mute}
CapsLock & F11::Send, {Volume_Down}
CapsLock & F12::Send, {Volume_Up}


; Shortcuts to directly focus or open an specific application
; emulating what Apptivate macOS app does.
;---------------------------------------------------------------------------;
CapsLock & e::
	IfWinNotExist ahk_exe chrome.exe
		run, "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe"
	WinWait, ahk_exe chrome.exe
	WinActivate, ahk_exe chrome.exe
Return

CapsLock & k::
	IfWinNotExist ahk_exe slack.exe
		run, "C:\Users\cy\AppData\Local\slack\app-2.6.5\slack.exe"
	WinWait, ahk_exe slack.exe
	WinActivate, ahk_exe slack.exe
Return

CapsLock & l::
	IfWinNotExist ahk_exe Fork.exe
		run, "C:\Users\cy\AppData\Local\Fork\app-1.15.1\Fork.exe"
	WinWait, ahk_exe Fork.exe
	WinActivate, ahk_exe Fork.exe
Return

CapsLock & s::
	IfWinNotExist ahk_exe sublime_text.exe
		run, "C:\Program Files\Sublime Text 3\sublime_text.exe"
	WinWait, ahk_exe sublime_text.exe
	WinActivate, ahk_exe sublime_text.exe
Return

CapsLock & p::
	If GetKeyState("LShift", "P")
	{
		IfWinNotExist ahk_exe Spotify.exe
			run, "C:\Users\cy\AppData\Roaming\Spotify\Spotify.exe"
		WinWait, ahk_exe Spotify.exe
		WinActivate, ahk_exe Spotify.exe	
	}
	Else
	{
		IfWinNotExist ahk_exe pycharm64.exe
			run, "C:\Users\cy\AppData\Local\JetBrains\Toolbox\apps\PyCharm-P\ch-0\171.4249.47\bin\pycharm64.exe"
		WinWait, ahk_exe pycharm64.exe
		WinActivate, ahk_exe pycharm64.exe	
	}
	
Return

CapsLock & w::
	IfWinNotExist ahk_exe webstorm64.exe
		run, "C:\Program Files\JetBrains\WebStorm 2017.2\bin\webstorm64.exe"
	WinWait, ahk_exe webstorm64.exe
	WinActivate, ahk_exe webstorm64.exe
Return

CapsLock & t::
	IfWinNotExist ahk_exe git-bash.exe
		run, "C:\Program Files\Git\git-bash.exe"
	WinWait, ahk_exe git-bash.exe
	WinActivate, ahk_exe git-bash.exe
Return

CapsLock & n::
	If GetKeyState("LShift", "P")
	{
		IfWinNotExist ahk_exe Notion.exe
			run, "C:\Users\cy\AppData\Local\Programs\Notion\Notion.exe"
		WinWait, ahk_exe Notion.exe
		WinActivate, ahk_exe Notion.exe
	}

; TODO: Doesn't seem to work. Won't open a file explorer window.
CapsLock & f::
	If GetKeyState("LShift", "P")
	{
		IfWinNotExist ahk_exe explorer.exe
			run, "C:\Windows\explorer.exe"
		WinWait, ahk_exe explorer.exe
		WinActivate, ahk_exe explorer.exe
	}
Return
