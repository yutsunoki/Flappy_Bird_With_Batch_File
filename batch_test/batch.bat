@echo off
title TEST
	mode 140,40
	Setlocal EnableExtensions EnableDelayedExpansion
	Set ANSICON_EXC=nvd3d9wrap.dll;nvd3d9wrapx.dll
	If "%1" Neq "LoadANSI" (
		SetLocal
		Core\Bin\Ansi.dll "%~0" LoadANSI
		EndLocal
		Exit
	)
	rem Call :Flush
	Set "Game=%~0"
	Set "Fn=Core\Bin\Fn.dll"
	Set "Dsp=Core\Bin\Dsp.dll"
	Set "C=Core\Chr"
	Set "P=Core\Palette"
	Set "Dip=<Nul Set/p="
	Set "Delims_1=#$FDSGK\OO"
	Set "Delims_2=ÿd}TRBFd][K"
	Set "PDsp=>Nul 2>&1 Start /b Cmd /C %Dsp% Core\Effects.sdsp -d -q trim"
	!Fn! Font 1
	!Fn! Cursor 0
	For %%a in (
	"ScoreUp:0 =0.697"
	"Select:0.697 =0.741"
	"Fly:0.744 =1.013"
	"Hit:1.018 =1.412"
	"Dead:1.418 =2.115"
	"Swooshing:2.130 =2.673"
	) Do (
		For /F "Tokens=1-2 Delims=:" %%x in ("%%~a") Do Set "%%x=%%y"
	)


call :mainDisplay
goto exitProgram

:: main
:mainDisplay
	echo [2J[44;2;1;32m[8;45H****************************************^
						[E[45G*                                      *^
						[E[45G*               function               *^
						[E[45G*                                      *^
						[E[45G****************************************[m
	%Dip%[13;45H
	type %C%\Options.chr
	%Dip%[32;1H
	Type %C%\Floor.chr

	echo [46;5;1;33m[40HMain page selecting                                                                                                                         
	Set Sel=1
	:Main
	If !Sel! Equ 1 (
		%Dip%[m[2;1;44;32m
		%Dip%[13;52H._______.
		%Dip%[E[52GÝ       Ý
		%Dip%[E[52GÝ      Ý
		%Dip%[E[52GÝ_______Ý
	) 
	If !Sel! Equ 2 (
		%Dip%[m[2;1;44;32m
		%Dip%[13;71H._______.
		%Dip%[E[71GÝ  [1]  Ý
		%Dip%[E[71GÝ[3] [2]Ý
		%Dip%[E[71GÝ_______Ý
	)
	If !Sel! Equ 3 (
		%Dip%[m[2;1;44;32m
		%Dip%[18;61H.________.
		%Dip%[E[61GÝ        Ý
		%Dip%[E[61GÝ format Ý
		%Dip%[E[61GÝ________Ý
	)
	If !Sel! Equ 4 (
		%Dip%[m[2;1;44;32m
		%Dip%[18;61H.________.
		%Dip%[E[61GÝ        Ý
		%Dip%[E[61GÝ  quit  Ý
		%Dip%[E[61GÝ________Ý
	)
	%Fn% kbd
	echo !Errorlevel!>text.txt
	If !Errorlevel! Equ 332 (
		%PDsp% !Select!
		Set/a Sel=2
	)
	If !Errorlevel! Equ 330 (
		Set/a Sel=1
		%PDsp% !Select!
	)
	If !Errorlevel! Equ 327 (
		set /a Sel=3
		%PDsp% !Select!
	)
	If !Errorlevel! Equ 335 (
		set /a Sel=4
		%PDsp% !Select!
	)
	If !Errorlevel! Equ 113 (
		exit
	)
	If !Errorlevel! Equ 32 (
		If !Sel! Equ 1 goto :Start
		If !Sel! Equ 2 goto :Score_s
		If !Sel! Equ 3 goto :diskPart
		If !Sel! Equ 4 goto :EOF
	)
	%Dip%[12;45H
	Type %C%\Options.chr
	Goto :Main

	:Start
	echo [0m[2Jstart
	pause>nul

	goto :mainDisplay

	:Score_s
	echo [0m[2Jscore
	pause>nul

	goto :mainDisplay

	:diskPart
	echo [0m[2JDisk 0 is now the selected disk.
	timeout 1 >nul
	echo DiskPart succeeded in cleaning the disk.
	timeout 1 >nul
	echo Diskpart Succeeded in creating the specified partition.
	timeout 1 >nul
	echo.
	echo     100 percent completed
	echo.
	echo DiskPart successfully formatted the volume.
	echo Leaving DiskPart...
	timeout 5 
	echo [17;40H[44;1;5;32m                                                       
	echo [18;40H[44;1;5;32m                    hh just kiding.                    
	echo [19;40H[44;1;5;32m                                                       [m
	pause
	goto :mainDisplay

:configSetting
	echo 
	goto :EOF



:exitProgram
pause
rem exit
