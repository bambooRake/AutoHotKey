#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
;SetTitleMatchMode,2
;#InstallKeybdHook
#UseHook

;keyswapで
;mac ひらがな→変換 左Win→左Alt 左Alt→左Win
;win 左Ctrl→Caps Caps→左Ctrl


/*
#IF A_COMPUTERNAME = "WIN8MBA"
;mbaの独自設定
#IF
*/

/*
#IF A_COMPUTERNAME = "G2120PC"
;デスクトップの独自設定
#IF
*/

/*
SetTimer AutoClose,5000 
return 

AutoClose: 
IfWinExist, スポンサーセッション ahk_class #32770 
{ 
ControlClick OK, スポンサーセッション ahk_class #32770 
} 
return 
*/

#IF WinActive("ahk_exe GuiltyGearXrd.exe")
*vk1Dsc07B::w
*s::a
*d::s
*f::d

*vk1Csc079::j
*j::u
*k::i
*l::o
*;::l

*i::p
*o::q


#IF

#IF WinActive("ahk_exe Baka MPlayer.exe") and !GetKeyState("vk1Dsc07B","P") and !GetKeyState("vkEBsc07B","P")
*d::
	Send,{Blind}{Left}
	return
*f::
	Send,{Blind}{Right}
	return
;mpv seek +300
*g::
	Send,{Shift Down}{right}{Shift Up}
	return
;mpv seek -300
*s::
	Send,{Shift Down}{left}{Shift Up}
	return
*r::
	Send,{Ctrl Down}{right}{Ctrl Up}
	return
*4::
	Send,{Ctrl Down}{left}{Ctrl Up}
	return
*Enter::
	Send,{Blind}{f}
	return
#IF

;vk1Dsc07B-無変換
;vkFFsc145-pause
;vk1Csc079-変換

*vkACsc0H0::ESCAPE


XButton2::
   	Send,{Blind}{F11}
	return

XButton1::
	Send,{Blind}{esc}
	return

;MButton::RButton
;RButton::MButton

;IME ON/OFF
*vk1Csc079::
	KeyWait, vk1Csc079, T0.2    ; 0.2秒以上キーが離されなかったら、ErrorLevel=1
	if ErrorLevel
		;短押し
		Send,{Ctrl Down}{]}{Ctrl Up}
	else
		;長押し
		Send,{Ctrl Down}{[}{Ctrl Up}
	keywait, vk1Csc079
	return

;IME ON/OFF bluetooth用 右winを無変換に　日本語キーボードとコードは異なる模様
*vkFFsc079::
	KeyWait, vkFFsc079, T0.2    ; 0.2秒以上キーが離されなかったら、ErrorLevel=1
	if ErrorLevel
		;短押し
		Send,{Ctrl Down}{]}{Ctrl Up}
	else
		;長押し
		Send,{Ctrl Down}{[}{Ctrl Up}
	keywait, vkFFsc079
	return

*vk1Dsc07B::return
*vkEBsc07B::return


*vk1Dsc07B up::
*vkEBsc07B up::
	if GetKeyState("Shift","P"){
		Send,{Blind}{Sift Up}
	}
	if GetKeyState("Ctrl","P"){
		Send,{Blind}{Ctrl Up}
	}
	if GetKeyState("Alt","P"){
		Send,{Blind}{Alt Up}
	}
	if GetKeyState("F","P"){
		Send,{Blind}{LButton Up}
	}
	if GetKeyState("G","P"){
		Send,{Blind}{MButton Up}
	}
	if GetKeyState("V","P"){
		Send,{Blind}{RButton Up}
	}

	return


#IF GetKeyState("vk1Dsc07B","P") or GetKeyState("vkEBsc07B","P")
*F1::Edit
*F2::Reload


*1::
Loop
{
If(!GetKeyState("1","P"))
Break
MouseClick, LEFT
Sleep, 100
}
Return 

*3::
  Send,{LWin Down}{t}{LWin Up}
	return
*4::
	While GetKeyState("4","P")
	{
		Send {WheelUp}
		Sleep, 30 ; miliseconds
	}
	Return
*5::WheelLeft
*6::WinSet, AlwaysOnTop, TOGGLE, A
*q::
	Send,{Alt Down}{F4}{Alt Up}
	return

*w::
	return
*e::
	Send,{Blind}{End}
	return
*r::
	While GetKeyState("r","P")
	{
		Send {WheelDown}
		Sleep, 30 ; miliseconds
	}
	Return

*t::WheelRight
*y::
	return
*u::
	return
*i::
	return
*o::
	return
*p::
	return
*a::
	Send,{Blind}{Home}
	return
*s::
	Send,{Blind}{Enter}
	return
*d::
	Send,{Blind}{Del}
	return

*f::
    Send,{Blind}{LButton down}
    KeyWait,f
    Send,{Blind}{LButton up}
    return

*g::
    Send,{Blind}{MButton down}
    KeyWait,g
    Send,{Blind}{MButton up}
    return

*h::
	Send,{Blind}{Left}
	return
*j::
	Send,{Blind}{Down}
	return
*k::
	Send,{Blind}{Up}
	return
*l::
	Send,{Blind}{Right}
	return
*`::
	return
*z::
	return
*x::
	Send,{Blind}{BS}
	return
*c::
	return

*v::

    Send,{Blind}{RButton down}
    KeyWait,v
    Send,{Blind}{RButton up}
    return

*b::
	return
*n::
	return
*m::
	Send,{Blind}{SPACE}
	return

*Left::
	Run DisplaySwitch.exe /internal
	return
*Down::
	Run DisplaySwitch.exe /extend
	return

*Right::
	;Run DisplaySwitch.exe /extend
	Run DisplaySwitch.exe /external
	return
#IF

!0::
	Run DisplaySwitch.exe /external
	return
!9::
	Run DisplaySwitch.exe /internal
	return

;ウィンドウを透明化する/解除
#W::
  WinGet, tp, Transparent, A
  If tp =
    Winset, Transparent, 200, A
  else
    Winset, Transparent, OFF, A
return

;透明度を指定する
+#W::
  WinGet, itp, Transparent, A
  InputBox, itp, 透明度を変更(0～255), , , 200, 110,, , , , %itp%
  If ErrorLevel = 1
    return
  else
    WinSet, Transparent, %itp%, A
  return
