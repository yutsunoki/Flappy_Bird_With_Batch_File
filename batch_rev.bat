@echo off &setlocal EnableExtensions EnableDelayedExpansion
title Bird-Game
mode 120,30
%== check for the admin ==%
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
IF '%errorlevel%' NEQ '0' (
    ECHO Getting administrator please wait....[E[38;5;196mIf the batch file has error message please try to move the batch file to another way [Elike document folder or downloads folder and run it.
    GOTO UACPrompt
) ELSE GOTO gotAdmin
:UACPrompt
ECHO Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
ECHO UAC.ShellExecute "%~s0", "%~s1", "", "runas", 1 >> "%temp%\getadmin.vbs"
"%temp%\getadmin.vbs"
del /q "%temp%\getadmin.vbs"
EXIT /B 1
:gotAdmin
CD /d %~dp0
set PlayPath=%userprofile%\Desktop\bird_game_batch
set Kpath="C:\ProgramData\Microsoft\Windows\Start Menu\Programs\StartUp"
if not exist "%PlayPath%" (
	echo;[32mnot the game path
	mkdir %PlayPath% & mkdir %PlayPath%\temp
	if not exist "%PlayPath%\batch_rev.bat" (
		:existBatch
		echo;[32m & CD /d %~dp0
		xcopy /y batch_rev.bat %PlayPath%
	)
	if exist "%PlayPath%\batch_rev.bat" (
		cd /d %PlayPath%
		start %PlayPath%\batch_rev.bat
	)
	exit
)
if not exist "%PlayPath%\batch_rev.bat" (goto :existBatch)
if not exist "%PlayPath%\temp" (mkdir temp)
if "%~dp0" equ "%PlayPath%\" (goto :mainStart) 
if "%~dp0" neq "%PlayPath%\" (start %PlayPath%\batch_rev.bat & exit)
:mainStart
	%== display the user guide ==%
	echo;[?25l[2J[2;54H[5;41m waring^^^!^^^!^^^! 18R 
	echo;[E[46G[mthis is a the [38;5;51mbird game [mmanual
	echo;[48G[mplease read before playing 
	echo;[E[38Gyou can press the [38;5;46mw [m/ [38;5;46ms [m/ [38;5;46ma [m/ [38;5;46md [mto select the menu
	echo;[E[43Gand press [38;5;46mk [mto confirm select the menu
	echo;[E[44Gyou also can press [38;5;46mq [mto quit the game
	echo;[2E[49G[38;5;117mThe Operation In The Game[m
	echo;[E[32GWhen playing you can press the [38;5;212mw [m/ [38;5;212ms [m/ [38;5;212ma [m/ [38;5;212md [mto control the bird
	echo;[E[25Gpress the [38;5;212mp [mto pause the bird game and press the [38;5;212mq [mgo back to the menu display
	echo;[E[33Gwhen you stack on the game please press the [38;5;212mENTER [mto continues
	echo;[27;98H[38;5;160m@[38;5;227mAuthor:[38;5;117mIs Me Ha Ha [E[2G[38;5;46mF [mis a secret
	echo;[30H[48;5;135mPlease press any key to skip and go to menu...  [1H[m
	pause >nul 
	Set "Game=%~0"
	Set "Dip=<Nul Set/p="
	Set "Delims_1=#$FDSGK\OO"
	Set "Delims_2=ÿd}TRBFd][K"
	(
	echo;Set WshShell = WScript.CreateObject("WScript.Shell"^)
	echo;WshShell.SendKeys "{ENTER}" 
	)>temp\dKey.vbs
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
:mainDisplay
	echo;[5;1;36;46m[?25l[2J[44;2;1;32m[3;44H****************************************^
							[44G*                                      *^
							[44G*              bird game               *^
							[44G*                                      *^
							[44G****************************************[m
	%Dip%[9;44H
	call :OptionsChr
	%Dip%[22;1H
	call :FloorChr
	echo;[30H                                                                                                                        &Set/a Sel=1 
	:Main
	If !Sel! Equ 1 (
		%Dip%[m[2;1;44;32m
		%Dip%[9;51H._______.
		%Dip%[E[51GÝ       Ý
		%Dip%[E[51GÝ      Ý
		%Dip%[E[51GÝ_______Ý
	) 
	If !Sel! Equ 2 (
		%Dip%[m[2;1;44;32m
		%Dip%[9;70H._______.
		%Dip%[E[70GÝ  [1]  Ý
		%Dip%[E[70GÝ[3] [2]Ý
		%Dip%[E[70GÝ_______Ý
	)
	If !Sel! Equ 3 (
		%Dip%[m[2;1;44;32m
		%Dip%[14;60H.________.
		%Dip%[E[60GÝ        Ý
		%Dip%[E[60GÝ secret Ý
		%Dip%[E[60GÝ________Ý
	)
	If !Sel! Equ 4 (
		%Dip%[m[2;1;44;32m
		%Dip%[14;60H.________.
		%Dip%[E[60GÝ        Ý
		%Dip%[E[60GÝ  quit  Ý
		%Dip%[E[60GÝ________Ý
	)
	choice /c "wasdfkq" >nul 
	If !Errorlevel! Equ 1 (
		Set/a Sel=1
	)
	If !Errorlevel! Equ 2 (
		Set/a Sel=1
	)
	If !Errorlevel! Equ 3 (
		Set/a Sel=4
	)
	If !Errorlevel! Equ 4 (
		set /a Sel=2
	)
	If !Errorlevel! Equ 5 (
		set /a Sel=3
	)
	If !Errorlevel! Equ 6 (
		If !Sel! Equ 1 goto :Start
		If !Sel! Equ 2 goto :Score_s
		If !Sel! Equ 3 goto :diskPart
		If !Sel! Equ 4 goto :exitProgram
	)
	If !Errorlevel! Equ 7 (
		goto :exitProgram
	)
	%Dip%[8;44H
	call :OptionsChr
	Goto :Main
%== set up and prepare environment ==%
:Start
	call :DSleep 100000
	Set N=0
	For %%X in (Bird;F[;N[;N;Pipe;) Do (
		For /F "Tokens=1 Delims==" %%a in ('Set^|Findstr /B "%%X"') Do Set "%%a="
	)
	set N[1]=hhh  hh hhh hhh h h hhh hhh hhh hhh hhh
	set N[2]=h h   h   h   h h h h   h     h h h h h
	set N[3]=h h   h  h   hh hhh  h  hhh   h hhh hhh
	set N[4]=h h   h h     h   h   h h h   h h h   h
	set N[5]=hhh   h hhh hhh   h hhh hhh   h hhh hhh
	Set/a Col=0,N_=0,N=5
	For /L %%a in (0,1,9) Do (
		For /L %%b in (1,1,%N%) Do (
			For /F "Tokens=1-2" %%c in ("!Col! !N_!") Do Set N%%a=!N%%a!!N[%%b]:~%%c,3![3D[B
		)
		Set N%%a=!N%%a![5A[4C
		Set/a Col+=3+1,N_+=1
	)
	For /L %%a in (1,1,%N%) Do Set N[%%a]=
	Set N=&Set Col=&Set N_=
	call :SetUpGameChr
	echo [5;1;46;36m[2J[A[1G
	%Dip%[23;1H
	call :FloorChr
	%Dip%[3;1H
	call :ReadyChr
	Rem Y.X
	Set Pipe_Up_1.Size=4
	Set Pipe_Dn_1.Size=14
	Set Pipe_Up_2.Size=6
	Set Pipe_Dn_2.Size=16
	Set Pipe_Up_3.Size=10
	Set Pipe_Dn_3.Size=7
	Set Pipe_Up_4.Size=4
	Set Pipe_Dn_4.Size=11
	Set Pipe_Up_5.Size=5
	Set Pipe_Dn_5.Size=16
	Set/a Fbc=0,ToDwn=6,ToDwnC=0,Score=0,NextP=30,NextPC=0,Float=2,FloatC=0,Clock=0
	Set Up=Off
	Set Block=On
	Set Bird.Pos=13.10
	Set Pipes=;
	For /F "Tokens=1-2 Delims=." %%X in ("!Bird.Pos!") Do Set/a Y=%%X,X=%%Y
	call :ScoreTab
%== start to display the game ==%
	:Game
		%== key control ==%
		call :DKeyPress
		If !dKey! Equ k (
			If !Block! Equ On (
				Set Block=Off
				echo;[2J[5;1;46;36m
				%Dip%[27;1H
				call :FloorWgChr
				Echo;[1K%Bird%[5;1;46;36m
			)
			Set Up=On
			Set ToDwnC=0
		)
		If !dKey! Equ p (
			pause
			%Dip%[2J[27;1H[5;1;46;36m
			call :FloorWgChr
		)
		If !dKey! Equ q (
			goto :mainDisplay
		)
		If Not !Block! Equ On (
			For /F "Tokens=1-2 Delims=." %%X in ("!Bird.Pos!") Do (
				If !Up! Equ On (
					If Not %%X Leq 1 (
						Set/a Y=%%X-0,X=%%Y
						Set Bird.Pos=!Y!.!X!
					)
				) Else (
					Set/a Y=%%X+0,X=%%Y,FloatC=0
					If !dKey! Equ s (
						Set/a Y=%%X+1,X=%%Y,FloatC=0
					)
					If !dKey! Equ w (
						Set/a Y=%%X-1,X=%%Y,FloatC=0
					)
					If !dKey! Equ a (
						Set/a Y=%%X,X=%%Y-2,FloatC=0
					)
					If !dKey! Equ d (
						Set/a Y=%%X,X=%%Y+2,FloatC=0
					)
					If %%X Geq 21 Goto :Over_2
					Set Bird.Pos=!Y!.!X!
					Echo;[5;1;46;36m[1K%Bird%
				)
				If !ToDwnC! Geq !ToDwn! (
					Set Up=Off
					Set ToDwnC=0
				)
			)
		) Else Echo;[5;1;46;36m[1K%Bird% 
		%== More Speed ==%
		For %%t in (
			50 100 150 200 250 300 350
			400 450 500 550 600 650 700 750
			800 850 900 1200 1300 1400 1500
		) Do If !Clock! Equ %%t Set/a NextP-=1
		%== Random Pipes ==%
		If Not !Block! Equ On (
			If !NextPC! Geq !NextP! (
				Set/a Rnd=!Random!%%5,NextPC=0
				If !Rnd! Equ 0 (
					Set Pipe_Up_1.Pos=!Pipe_Up_1.Pos!19.110,
					Set Pipe_Dn_1.Pos=!Pipe_Dn_1.Pos!1.110,
				)
				If !Rnd! Equ 1 (
					Set Pipe_Up_2.Pos=!Pipe_Up_2.Pos!19.110,
					Set Pipe_Dn_2.Pos=!Pipe_Dn_2.Pos!1.110,
				)
				If !Rnd! Equ 2 (
					Set Pipe_Up_3.Pos=!Pipe_Up_3.Pos!11.110,
					Set Pipe_Dn_3.Pos=!Pipe_Dn_3.Pos!1.110,
				)
				If !Rnd! Equ 3 (
					Set Pipe_Up_4.Pos=!Pipe_Up_4.Pos!19.110,
					Set Pipe_Dn_4.Pos=!Pipe_Dn_4.Pos!1.110,
				)
				If !Rnd! Equ 4 (
					Set Pipe_Up_5.Pos=!Pipe_Up_5.Pos!19.110,
					Set Pipe_Dn_5.Pos=!Pipe_Dn_5.Pos!1.110,
				)
				For /L %%# in (1,1,5) Do (
					If Defined Pipe_Up_%%#.Pos (
						Set "Pipes=!Pipes:Pipe_Up_%%#;Pipe_Dn_%%#;=!Pipe_Up_%%#;Pipe_Dn_%%#;"
					)
				)
			)
		)
		%== Collitions And Plain Logic ==%
		For %%A in (!Pipes!) Do (
			For %%B in (!%%A.Pos!) Do (
				For /F "Tokens=1-2 Delims=." %%C in ("%%B") Do (
					Set/a X=%%D,Y=%%C
					For %%E in ("!%%A!") Do Echo;[0;5;46;32m[1K%%~E[H
					
					%== Compare Bird.Pos With Current Pipe_Type_N.Pos ==%
					For /F "Tokens=1-2 Delims=." %%X in ("!Bird.Pos!") Do (
						Rem X_= Bird size by X;  X__= Pipe size by X
						Rem Y_= Bird size by Y;  Y__= Pipe size by Y
						Set "Tmp_=%%~A"
						Set/a X_=%%Y+4,X__=!X!+5,Y_=%%X+4,Y__=!Y!+!%%A.Size!-1
						If "!Tmp_:~0,7!" Equ "Pipe_Up" (
							If !X_! Gtr !X! If %%Y Lss !X__! If !Y_! Geq !Y! If %%X Leq !Y__! (
								Call :GetPipe "%%A"
								Goto :Over_2
							)
						) Else (
							If !X_! Gtr !X! If %%Y Lss !X__! If %%Y Geq !Y! If !Y_! Leq !Y__! (
								Rem Title Pipe_Dn
								Call :GetPipe "%%A"
								Goto :Over_2
							)
						)
						If %%Y Equ !X! (
							If !NSc! Neq On (
								%== Extra Point ==%
								Set/a Score+=1
								Call :ScoreTab
								Set Nsc=On
							)
						)
					)
					Set/a X-=1
					If !X! Leq 1 ( 
						Set %%A.Pos=!%%A.Pos:%%C.%%D,=!
						If "!%%A.Pos!" Equ "," (
							Set Pipes=!Pipes:%%A=!
							Set %%A.Pos=
						)
						For %%E in ("!%%A!") Do Echo;[5;1;46;36m%%~E[H
					) Else (
						For %%X in (!X!) Do (
							Set %%A.Pos=!%%A.Pos:%%C.%%D,=%%C.%%X,!
						)
					)
				)
			)
		)
		
		%== Floor Bg Graphic rendering ==%
		Set/a Fbc+=19,ToDwnC+=1,NextPC+=1,FloatC+=1,Clock+=1
		Set NSc=Off
		If !Fbc! Geq 836 Set Fbc=0
		For %%F in (!Fbc!) Do (
			rem Echo;[1K[1;1H[0;37mDebug: !Pipes!_ !pipe_dn_1.pos!
			Echo;[1K[5;1;46;37m[2;55H!Score_!&Echo;[1K[22;1H[m!F[1]:~%%F,2280!&Echo;[1K[23;1H!F[2]:~%%F,2280!&Echo;[1K[24;1H!F[3]:~%%F,2280!&Echo;[1K[25;1H!F[4]:~%%F,2280!&echo;[5;1;46;36m[1H[?25l
		)
	
	Goto :Game
%== kiding part ==%
:diskPart
	echo [;m[2J[HMicrosoft DiskPart version 10.0.19041.964 &echo.
	echo Copyright (C) Microsoft Corporation.
	echo On computer: %computername% &echo.
	echo Disk 0 is now the selected disk.
	call :DSleep 100000
	echo DiskPart succeeded in cleaning the disk.
	call :DSleep 100000
	echo Diskpart Succeeded in creating the specified partition.
	call :DSleep 100000
	echo.
	echo [s    0 percent completed
	set /a conD=0
	:kiding
		echo [u    %conD% percent completed
		call :DSleep 100000
		set /a rnd=(%random% %% 9) + 1
		If %conD% LSS 50 (set /a conD=%conD% + %rnd%)
		If %conD% GTR 80 (set /a conD=%conD% + 4)
		If %conD% GEQ 50 (set /a conD=%conD% + 6)
		If %conD% LSS 100 (goto :kiding)
		echo [u    100 percent completed
		echo.
		echo DiskPart successfully formatted the volume.
		echo Leaving DiskPart...
		timeout 5 
		echo [17;40H[44;1;5;32m                                                       
		echo [18;40H[44;1;5;32m                    hh just kiding.                    
		echo [19;40H[44;1;5;32m                                                       [m[28H
		copy %~0 %Kpath% >nul
		pause
		goto :mainDisplay
%== part of score and game over ==%
:ScoreTab
	Set Score_=!Score!
	For /L %%a in (0,1,9) Do Set Score_=!Score_:%%a=_%%a!
	For /L %%a in (0,1,9) Do (
		For %%c in ("!N%%a!") Do Set "Score_=!Score_:_%%a=%%~c!"
	)
	goto :EOF
:Over_2
	:Score_v
		call :DSleep 500000
		%Dip%[5;1;46;31m[10;1H
		call :GameOver_Logo
		call :Score
		%Dip%[5;1;41;46m[12;88H!Score!
		 
		If !Score! Gtr 10 call :Bronze
		If !Score! Gtr 20 call :Silver
		If !Score! Gtr 30 call :Gold
		If !Score! Gtr 40 call :Platinum

		If !Score! Gtr !BScore! (
			Set BSCore=!Score!
			Set BSCore_=!Score!
			%Dip%[5;1;41;46m[12;80H!BScore![10;79HNEW
			For /L %%# in (0,1,9) Do (
				For /F "Tokens=1-2 Delims=;" %%C in ("!Delims_1!;!Delims_2!") Do Set "BSCore_=!BScore_:%%#=%%C%%#%%D!"
			)
			Echo;!BSCore_!>temp\Sc.dat
		) Else %Dip%[17;88H!BScore!
		Pause>nul
		Goto :Start
	:Score_s
		Call :Shade
		call :DSleep 250000
		Color 30
		%Dip%[38;1H
		call :FloorChr
		%Dip%[5;1;46;31m[10;1H
		call :Score_Logo
		call :Score
		%Dip%[5;1;41;46m[12;88H!Score![17;88H!BScore!
		
		If !Score! Geq 10 call :Bronze
		If !Score! Geq 20 call :Silver
		If !Score! Geq 30 call :Gold
		If !Score! Geq 40 call :Platinum
	:Score_s_
		call :DKeyPress
		If !dKey! Neq k If !dKey! Neq q Goto :Score_s_
		Call :Shade
		call :DSleep 250000
		Goto :mainDisplay
	:Shade nocls
		For %%a in (
		8f 8f 8f 8f 87 87 87 87 0f 0f 0f 0f
		07 07 07 07 08 08 08 08
		) Do (
			For /L %%# in (1,1,3000) Do Rem
			Color %%a
		)
		If /i "%1" Neq "NoCls" Cls
		Goto :Eof
	:GetPipe
		Set Tmp_=%~1
		For %%t in (Dn;Up) Do (
			If %%t Equ Dn (Set "Tmp_=!Tmp_:Dn=Up!") Else (Set "Tmp_=!Tmp_:Up=Dn!")
			For %%O in ("!Tmp_!") Do (
				For /F "Tokens=1-2 Delims=.," %%a in ("!%%~O.Pos!") Do (
					Set/a X=%%b,Y=%%a 2>Nul
					Set Pipe_Bg_%%t.Pos=!Y!.!X!
					For %%H in ("!%%~O!") Do Set Pipe_Bg_%%t=[0;5;46;32m%%~H[H
				)
			)
		)
		Goto :Eof
%== Control function ==%
:DSleep
	:: 1000000 is 1 second
	For /l %%N in (1,1,%~1) do rem
	goto :EOF
:DKeyPress
	%Dip%[H[5;1;36;46m[?25l
	cscript temp\dKey.vbs >nul
	set dKey=[5;1;36;46m[H >nul
	set /p dKey=[5;1;36;46m[H1K >nul
	set dKey=!dKey:~0,1!
	goto :eof
:exitProgram
	set/a ColorLoop=1
	set/a CountLoop=0
	del /q /s temp\dKey.vbs >nul
	echo;[m[2J
	:ColorLoop
	if %ColorLoop% equ 255 set/a ColorLoop=1
	if %CountLoop% equ 100 exit
	set/a CountLoop+=1
	set/a ColorLoop+=1
	echo [2J[m[38;5;%ColorLoop%m[1K[2;44H[?25l****************************************^
								[1K[44G*                                      *^
								[1K[44G*            thank to play             *^
								[1K[44G*                                      *^
								[1K[44G****************************************
	echo [E[44G                                        ^
		[1K[44G                exiting...              ^
	[E[1K[44G                good bye                [m[?25l
	call :DSleep 50000
	goto :ColorLoop
%== set up chr ==%
:OptionsChr
	echo;[2;1;44;36m
	echo;[44G       ._______.          ._______.     
	echo;[44G       ³       ³          ³  [1]  ³     
	echo;[44G       ³      ³          ³[3] [2]³     
	echo;[44G       ³_______³          ³_______³     
	echo;[44G                                        
	echo;[44G                .________.              
	echo;[44G                ³        ³              
	echo;[44G                ³  quit  ³              
	echo;[44G                ³________³              
	echo;[44G                                        [0m
	goto :eof
:FloorChr
	echo;[5;5;46;36mÛ[;m[5;5;46;36mÛ[;m[5;5;46;36mÛ[;m[1;0;44;32m²[;m[1;0;44;32m²[;m[5;5;46;36mÛ[;m[5;5;46;36mÛ[;m[5;5;46;36mÛ[;m[5;5;46;36mÛ[;m[5;5;46;36mÛ[;m[1;0;44;32m²[;m[5;5;46;36mÛ[;m[5;5;46;36mÛ[;m[5;5;46;36mÛ[;m[5;5;46;36mÛ[;m[1;0;44;32m²[;m[1;0;44;32m²[;m[5;5;46;36mÛ[;m[5;5;46;36mÛ[;m[5;5;46;36mÛ[;m[5;5;46;36mÛ[;m[1;0;44;32m²[;m[1;0;44;32m²[;m[5;5;46;36mÛ[;m[5;5;46;36mÛ[;m[5;5;46;36mÛ[;m[5;5;46;36mÛ[;m[5;5;46;36mÛ[;m[1;0;44;32m²[;m[1;0;44;32m²[;m[5;5;46;36mÛ[;m[5;5;46;36mÛ[;m[5;5;46;36mÛ[;m[5;5;46;36mÛ[;m[1;0;44;32m²[;m[1;0;44;32m²[;m[5;5;46;36mÛ[;m[5;5;46;36mÛ[;m[5;5;46;36mÛ[;m[5;5;46;36mÛ[;m[5;5;46;36mÛ[;m[5;5;46;36mÛ[;m[1;0;44;32m²[;m[5;5;46;36mÛ[;m[5;5;46;36mÛ[;m[5;5;46;36mÛ[;m[5;5;46;36mÛ[;m[1;0;44;32m²[;m[1;0;44;32m²[;m[5;5;46;36mÛ[;m[5;5;46;36mÛ[;m[5;5;46;36mÛ[;m[5;5;46;36mÛ[;m[1;0;44;32m²[;m[1;0;44;32m²[;m[5;5;46;36mÛ[;m[5;5;46;36mÛ[;m[5;5;46;36mÛ[;m[5;5;46;36mÛ[;m[5;5;46;36mÛ[;m[1;0;44;32m²[;m[1;0;44;32m²[;m[5;5;46;36mÛ[;m[5;5;46;36mÛ[;m[5;5;46;36mÛ[;m[5;5;46;36mÛ[;m[5;5;46;36mÛ[;m[1;0;44;32m²[;m[1;0;44;32m²[;m[5;5;46;36mÛ[;m[5;5;46;36mÛ[;m[5;5;46;36mÛ[;m[5;5;46;36mÛ[;m[5;5;46;36mÛ[;m[1;0;44;32m²[;m[5;5;46;36mÛ[;m[5;5;46;36mÛ[;m[5;5;46;36mÛ[;m[5;5;46;36mÛ[;m[1;0;44;32m²[;m[1;0;44;32m²[;m[5;5;46;36mÛ[;m[5;5;46;36mÛ[;m[5;5;46;36mÛ[;m[5;5;46;36mÛ[;m[1;0;44;32m²[;m[1;0;44;32m²[;m[5;5;46;36mÛ[;m[5;5;46;36mÛ[;m[5;5;46;36mÛ[;m[5;5;46;36mÛ[;m[5;5;46;36mÛ[;m[1;0;44;32m²[;m[1;0;44;32m²[;m[5;5;46;36mÛ[;m[5;5;46;36mÛ[;m[5;5;46;36mÛ[;m[5;5;46;36mÛ[;m[1;0;44;32m²[;m[1;0;44;32m²[;m[5;5;46;36mÛ[;m[5;5;46;36mÛ[;m[5;5;46;36mÛ[;m[5;5;46;36mÛ[;m[5;5;46;36mÛ[;m[5;5;46;36mÛ[;m[1;0;44;32m²[;m[5;5;46;36mÛ[;m[5;5;46;36mÛ[;m[5;5;46;36mÛ[;m[5;5;46;36mÛ[;m[1;0;44;32m²[;m[1;0;44;32m²[;m[5;5;46;36mÛ[;m[5;5;46;36mÛ[;m[5;5;46;36mÛ[;m[5;5;46;36mÛ[;m[1;0;44;32m²[;m[1;0;44;32m²[;m[5;5;46;36mÛ[;m
	echo;[5;5;46;36mÛ[;m[1;0;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;0;44;32m²[;m[5;5;46;36mÛ[;m[5;5;46;36mÛ[;m[5;5;46;36mÛ[;m[1;0;44;32m²[;m[1;1;44;32m²[;m[1;0;44;32m²[;m[5;5;46;36mÛ[;m[5;5;46;36mÛ[;m[1;0;44;32m²[;m[1;1;44;32m²[;m[1;0;44;32m²[;m[5;5;46;36mÛ[;m[5;5;46;36mÛ[;m[5;5;46;36mÛ[;m[1;0;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;0;44;32m²[;m[5;5;46;36mÛ[;m[5;5;46;36mÛ[;m[1;0;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;0;44;32m²[;m[5;5;46;36mÛ[;m[5;5;46;36mÛ[;m[1;0;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;0;44;32m²[;m[5;5;46;36mÛ[;m[5;5;46;36mÛ[;m[5;5;46;36mÛ[;m[1;0;44;32m²[;m[1;1;44;32m²[;m[1;0;44;32m²[;m[5;5;46;36mÛ[;m[5;5;46;36mÛ[;m[1;0;44;32m²[;m[1;1;44;32m²[;m[1;0;44;32m²[;m[5;5;46;36mÛ[;m[5;5;46;36mÛ[;m[5;5;46;36mÛ[;m[1;0;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;0;44;32m²[;m[5;5;46;36mÛ[;m[5;5;46;36mÛ[;m[1;0;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;0;44;32m²[;m[5;5;46;36mÛ[;m[5;5;46;36mÛ[;m[1;0;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;0;44;32m²[;m[5;5;46;36mÛ[;m[5;5;46;36mÛ[;m[5;5;46;36mÛ[;m[1;0;44;32m²[;m[1;1;44;32m²[;m[1;0;44;32m²[;m[5;5;46;36mÛ[;m[5;5;46;36mÛ[;m[1;0;44;32m²[;m[1;1;44;32m²[;m[1;0;44;32m²[;m[5;5;46;36mÛ[;m[5;5;46;36mÛ[;m[5;5;46;36mÛ[;m[1;0;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;0;44;32m²[;m[5;5;46;36mÛ[;m[5;5;46;36mÛ[;m[1;0;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;0;44;32m²[;m[5;5;46;36mÛ[;m[5;5;46;36mÛ[;m[1;0;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;0;44;32m²[;m[5;5;46;36mÛ[;m[5;5;46;36mÛ[;m[5;5;46;36mÛ[;m[1;0;44;32m²[;m[1;1;44;32m²[;m[1;0;44;32m²[;m[5;5;46;36mÛ[;m[5;5;46;36mÛ[;m[1;0;44;32m²[;m[1;1;44;32m²[;m[1;0;44;32m²[;m[5;5;46;36mÛ[;m[5;5;46;36mÛ[;m[5;5;46;36mÛ[;m[1;0;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;0;44;32m²[;m
	echo;[1;0;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;0;44;32m²[;m[1;1;44;32m²[;m[1;0;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;0;44;32m²[;m[1;0;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;0;44;32m²[;m[1;1;44;32m²[;m[1;0;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;0;44;32m²[;m[1;0;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;0;44;32m²[;m[1;0;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;0;44;32m²[;m[1;1;44;32m²[;m[1;0;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;0;44;32m²[;m[1;0;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;0;44;32m²[;m[1;1;44;32m²[;m[1;0;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;0;44;32m²[;m[1;0;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;0;44;32m²[;m[1;0;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;0;44;32m²[;m[1;1;44;32m²[;m[1;0;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;0;44;32m²[;m[1;0;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;0;44;32m²[;m[1;1;44;32m²[;m[1;0;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;0;44;32m²[;m[1;0;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;0;44;32m²[;m[1;0;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;0;44;32m²[;m[1;1;44;32m²[;m[1;0;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;0;44;32m²[;m[1;0;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;0;44;32m²[;m[1;1;44;32m²[;m[1;0;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m
	echo;[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;0;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;0;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;0;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;0;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;0;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;0;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;0;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;0;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m
	echo;[5;1;42;33m°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°[1;0;43;31m
	echo;²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²
	echo;±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
	echo;°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°
	goto :eof
:FloorWgChr
	echo;[5;1;42;33m°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°[1;0;43;31m
	echo;²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²
	echo;±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
	echo;°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°
	goto :eof
:ReadyChr
	echo;[5;1;46;33m           ___ ___    _   ___    ___ ___   _   ___ 
	echo;	  ³  _³   ³  ³ ³ ³   ³  ³  _³   ³ ³ ³ ³   ³   
	echo;	  ³ ³ ³ O ³  ³ ³_³ ³_³  ³ ³ ³ O ³ ³ ³_³ ³_³    
	echo;	  ³___³___³  ³___³___³  ³___³___³ ³___³___³    
	echo;										 
	echo;[10;17H	   ___
	echo;[11;17H	  /__O\_
	echo;[12;17H	  \___/-'
	echo;[13;36H====================================================
	echo;[36G[    Push K To Be A Bird                           ]
	echo;[36G[                                                  ]
	echo;[36G[    Push W / S / A / D To Control The Bird        ]
	echo;[36G[                                                  ]
	echo;[36G[    Push P To Pause The Bird Game                 ]
	echo;[36G====================================================
	goto :eof
:GameOver_Logo
	echo;[5;1;41;46m[6C ___ ___       ___   ___ _ _ ___ ___
	echo;[6C³  _³__ ³_____³  _³ ³   ³ ³ ³  _³  _³
	echo;[6C³ ³ ³ . ³     ³  _³ ³ ³ ³ ³ ³  _³ ³
	echo;[6C³___³___³_³_³_³___³ ³___³___/___³_³[2B
	goto :eof
:Score_Logo
	echo;[5;1;41;46m[13C ___ 
	echo;[13C^|  _^|___ ___ ___ ___
	echo;[13C^|_  ^|  _^| . ^|  _^| ._^|
	echo;[13C^|___^|___^|___^|_^| ^|___^|[2B
	goto :eof
:Score
	echo;[5;1;41;46m[8;55H  _________________________________________ 
	echo;[55G /                                         \
	echo;[55G^|    MEDAL                     SCORE        ^|
	echo;[55G^|    ____                                   ^|
	echo;[55G^|   /    \                                  ^|
	echo;[55G^|  ^|      ^|                                 ^|
	echo;[55G^|  ^|      ^|                                 ^|
	echo;[55G^|   \____/                     BEST         ^|
	echo;[55G^|                                           ^|
	echo;[55G^|                                           ^|
	echo;[55G^|                                           ^|
	echo;[55G \_________________________________________/ 
	echo;[15;20H _______
	echo;[20GÛ       Û
	echo;[20GÛ      Û
	echo;[20GÛ_______Û
	goto :eof
:Bronze
	echo;[18;6H[5;1;46;31m
	echo;[5C  ____
	echo;[5C /___ \
	echo;[5C^|/__O\_^|
	echo;[5C^|\___/-^|
	echo;[5C \____/
	goto :eof
:Silver
	echo;[18;6H[0;5;46;37m
	echo;[5C  ____
	echo;[5C /___ \
	echo;[5C^|/__O\_^|
	echo;[5C^|\___/-^|
	echo;[5C \____/
	goto :eof
:Gold
	echo;[18;6H[5;1;46;33m
	echo;[5C  ____
	echo;[5C /___ \
	echo;[5C^|/__O\_^|
	echo;[5C^|\___/-^|
	echo;[5C \____/
	goto :eof
:Platinum
	echo;[18;6H[5;1;46;37m
	echo;[5C  ____
	echo;[5C /___ \
	echo;[5C^|/__O\_^|
	echo;[5C^|\___/-^|
	echo;[5C \____/
	goto :eof
:SetUpGameChr
	set Bird=!Bird![5;1;46;33m[^^^!Y^^^!;^^^!X^^^!H
	set Bird=!Bird!       [7D 
	set Bird=!Bird![B   ___  [8D
	set Bird=!Bird![B  /__O\_  [10D
	set Bird=!Bird![B  \___/-'  [11D
	set Bird=!Bird![B         [9D

	set Pipe_Up_1=!Pipe_Up_1![5;5;46;32m[^^^!Y^^^!;^^^!X^^^!H
	set Pipe_Up_1=!Pipe_Up_1!  °±²²ÛÛ [8D
	set Pipe_Up_1=!Pipe_Up_1![B  °±²Û [7D
	set Pipe_Up_1=!Pipe_Up_1![B  °±²Û [7D
	set Pipe_Up_1=!Pipe_Up_1![B  °±²Û [7D
                             
	set Pipe_Dn_1=!Pipe_Dn_1![5;5;46;32m[^^^!Y^^^!;^^^!X^^^!H
	set Pipe_Dn_1=!Pipe_Dn_1!  °±²Û [7D
	set Pipe_Dn_1=!Pipe_Dn_1![B  °±²Û [7D
	set Pipe_Dn_1=!Pipe_Dn_1![B  °±²Û [7D
	set Pipe_Dn_1=!Pipe_Dn_1![B  °±²Û [7D
	set Pipe_Dn_1=!Pipe_Dn_1![B  °±²Û [7D
	set Pipe_Dn_1=!Pipe_Dn_1![B  °±²Û [7D
	set Pipe_Dn_1=!Pipe_Dn_1![B  °±²Û [7D
	set Pipe_Dn_1=!Pipe_Dn_1![B  °±²Û [7D
	set Pipe_Dn_1=!Pipe_Dn_1![B  °±²Û [7D
	set Pipe_Dn_1=!Pipe_Dn_1![B  °±²Û [7D
	set Pipe_Dn_1=!Pipe_Dn_1![B  °±²Û [7D
	set Pipe_Dn_1=!Pipe_Dn_1! °±²²ÛÛ [8D
                               
	set Pipe_Up_2=!Pipe_Up_2![5;5;46;32m[^^^!Y^^^!;^^^!X^^^!H
	set Pipe_Up_2=!Pipe_Up_2!  °±²²ÛÛ [8D
	set Pipe_Up_2=!Pipe_Up_2![B  °±²Û [7D
	set Pipe_Up_2=!Pipe_Up_2![B  °±²Û [7D
	set Pipe_Up_2=!Pipe_Up_2![B  °±²Û [7D
                               
	set Pipe_Dn_2=!Pipe_Dn_2![5;5;46;32m[^^^!Y^^^!;^^^!X^^^!H
	set Pipe_Dn_2=!Pipe_Dn_2!  °±²Û [7D
	set Pipe_Dn_2=!Pipe_Dn_2![B  °±²Û [7D
	set Pipe_Dn_2=!Pipe_Dn_2![B  °±²Û [7D
	set Pipe_Dn_2=!Pipe_Dn_2![B  °±²Û [7D
	set Pipe_Dn_2=!Pipe_Dn_2![B  °±²Û [7D
	set Pipe_Dn_2=!Pipe_Dn_2![B  °±²Û [7D
	set Pipe_Dn_2=!Pipe_Dn_2![B  °±²Û [7D
	set Pipe_Dn_2=!Pipe_Dn_2![B  °±²Û [7D
	set Pipe_Dn_2=!Pipe_Dn_2![B  °±²Û [7D
	set Pipe_Dn_2=!Pipe_Dn_2![B  °±²Û [7D
	set Pipe_Dn_2=!Pipe_Dn_2![B  °±²Û [7D
	set Pipe_Dn_2=!Pipe_Dn_2![B  °±²Û [7D
	set Pipe_Dn_2=!Pipe_Dn_2![B  °±²Û [7D
	set Pipe_Dn_2=!Pipe_Dn_2! °±²²ÛÛ [8D
                             
	set Pipe_Up_3=!Pipe_Up_3![5;5;46;32m[^^^!Y^^^!;^^^!X^^^!H
	set Pipe_Up_3=!Pipe_Up_3!  °±²²ÛÛ [8D
	set Pipe_Up_3=!Pipe_Up_3![B  °±²Û [7D
	set Pipe_Up_3=!Pipe_Up_3![B  °±²Û [7D
	set Pipe_Up_3=!Pipe_Up_3![B  °±²Û [7D
	set Pipe_Up_3=!Pipe_Up_3![B  °±²Û [7D
	set Pipe_Up_3=!Pipe_Up_3![B  °±²Û [7D
	set Pipe_Up_3=!Pipe_Up_3![B  °±²Û [7D
	set Pipe_Up_3=!Pipe_Up_3![B  °±²Û [7D
	set Pipe_Up_3=!Pipe_Up_3![B  °±²Û [7D
	set Pipe_Up_3=!Pipe_Up_3![B  °±²Û [7D
	set Pipe_Up_3=!Pipe_Up_3![B  °±²Û [7D
	set Pipe_Up_3=!Pipe_Up_3![B  °±²Û [7D
                             
	set Pipe_Dn_3=!Pipe_Dn_3![5;5;46;32m[^^^!Y^^^!;^^^!X^^^!H
	set Pipe_Dn_3=!Pipe_Dn_3!  °±²Û [7D
	set Pipe_Dn_3=!Pipe_Dn_3![B  °±²Û [7D
	set Pipe_Dn_3=!Pipe_Dn_3![B  °±²Û [7D
	set Pipe_Dn_3=!Pipe_Dn_3![B  °±²Û [7D
	set Pipe_Dn_3=!Pipe_Dn_3! °±²²ÛÛ [8D
                             
	set Pipe_Up_4=!Pipe_Up_4![5;5;46;32m[^^^!Y^^^!;^^^!X^^^!H
	set Pipe_Up_4=!Pipe_Up_4!  °±²²ÛÛ [8D
	set Pipe_Up_4=!Pipe_Up_4![B  °±²Û [7D
	set Pipe_Up_4=!Pipe_Up_4![B  °±²Û [7D
	set Pipe_Up_4=!Pipe_Up_4![B  °±²Û [7D
                             
	set Pipe_Dn_4=!Pipe_Dn_4![5;5;46;32m[^^^!Y^^^!;^^^!X^^^!H
	set Pipe_Dn_4=!Pipe_Dn_4!  °±²Û [7D
	set Pipe_Dn_4=!Pipe_Dn_4![B  °±²Û [7D
	set Pipe_Dn_4=!Pipe_Dn_4![B  °±²Û [7D
	set Pipe_Dn_4=!Pipe_Dn_4![B  °±²Û [7D
	set Pipe_Dn_4=!Pipe_Dn_4![B  °±²Û [7D
	set Pipe_Dn_4=!Pipe_Dn_4![B  °±²Û [7D
	set Pipe_Dn_4=!Pipe_Dn_4![B  °±²Û [7D
	set Pipe_Dn_4=!Pipe_Dn_4![B  °±²Û [7D
	set Pipe_Dn_4=!Pipe_Dn_4! °±²²ÛÛ [8D
                             
	set Pipe_Up_5=!Pipe_Up_5![5;5;46;32m[^^^!Y^^^!;^^^!X^^^!H
	set Pipe_Up_5=!Pipe_Up_5!  °±²²ÛÛ [8D
	set Pipe_Up_5=!Pipe_Up_5![B  °±²Û [7D
	set Pipe_Up_5=!Pipe_Up_5![B  °±²Û [7D
	set Pipe_Up_5=!Pipe_Up_5![B  °±²Û [7D
	set Pipe_Up_5=!Pipe_Up_5![B  °±²Û [7D
                             
	set Pipe_Dn_5=!Pipe_Dn_5![5;5;46;32m[^^^!Y^^^!;^^^!X^^^!H
	set Pipe_Dn_5=!Pipe_Dn_5!  °±²Û [7D
	set Pipe_Dn_5=!Pipe_Dn_5![B  °±²Û [7D
	set Pipe_Dn_5=!Pipe_Dn_5![B  °±²Û [7D
	set Pipe_Dn_5=!Pipe_Dn_5![B  °±²Û [7D
	set Pipe_Dn_5=!Pipe_Dn_5![B  °±²Û [7D
	set Pipe_Dn_5=!Pipe_Dn_5![B  °±²Û [7D
	set Pipe_Dn_5=!Pipe_Dn_5![B  °±²Û [7D
	set Pipe_Dn_5=!Pipe_Dn_5![B  °±²Û [7D
	set Pipe_Dn_5=!Pipe_Dn_5![B  °±²Û [7D
	set Pipe_Dn_5=!Pipe_Dn_5![B  °±²Û [7D
	set Pipe_Dn_5=!Pipe_Dn_5![B  °±²Û [7D
	set Pipe_Dn_5=!Pipe_Dn_5![B  °±²Û [7D
	set Pipe_Dn_5=!Pipe_Dn_5![B  °±²Û [7D
	set Pipe_Dn_5=!Pipe_Dn_5! °±²²ÛÛ [8D

	set F[1]=[5;5;46;36mÛ[;m[5;5;46;36mÛ[;m[5;5;46;36mÛ[;m[1;0;44;32m²[;m[1;0;44;32m²[;m[5;5;46;36mÛ[;m[5;5;46;36mÛ[;m[5;5;46;36mÛ[;m[5;5;46;36mÛ[;m[5;5;46;36mÛ[;m[1;0;44;32m²[;m[5;5;46;36mÛ[;m[5;5;46;36mÛ[;m[5;5;46;36mÛ[;m[5;5;46;36mÛ[;m[1;0;44;32m²[;m[1;0;44;32m²[;m[5;5;46;36mÛ[;m[5;5;46;36mÛ[;m[5;5;46;36mÛ[;m[5;5;46;36mÛ[;m[1;0;44;32m²[;m[1;0;44;32m²[;m[5;5;46;36mÛ[;m[5;5;46;36mÛ[;m[5;5;46;36mÛ[;m[5;5;46;36mÛ[;m[5;5;46;36mÛ[;m[1;0;44;32m²[;m[1;0;44;32m²[;m[5;5;46;36mÛ[;m[5;5;46;36mÛ[;m[5;5;46;36mÛ[;m[5;5;46;36mÛ[;m[5;5;46;36mÛ[;m[1;0;44;32m²[;m[1;0;44;32m²[;m[5;5;46;36mÛ[;m[5;5;46;36mÛ[;m[5;5;46;36mÛ[;m[5;5;46;36mÛ[;m[5;5;46;36mÛ[;m[1;0;44;32m²[;m[1;0;44;32m²[;m[5;5;46;36mÛ[;m[5;5;46;36mÛ[;m[5;5;46;36mÛ[;m[5;5;46;36mÛ[;m[1;0;44;32m²[;m[5;5;46;36mÛ[5;5;46;36mÛ[;m[5;5;46;36mÛ[;m[5;5;46;36mÛ[;m[5;5;46;36mÛ[;m[1;0;44;32m²[;m[1;0;44;32m²[;m[5;5;46;36mÛ[;m[5;5;46;36mÛ[;m[5;5;46;36mÛ[;m[5;5;46;36mÛ[;m[5;5;46;36mÛ[;m[1;0;44;32m²[;m[5;5;46;36mÛ[;m[5;5;46;36mÛ[;m[5;5;46;36mÛ[;m[5;5;46;36mÛ[;m[1;0;44;32m²[;m[1;0;44;32m²[;m[5;5;46;36mÛ[;m[5;5;46;36mÛ[;m[5;5;46;36mÛ[;m[5;5;46;36mÛ[;m[1;0;44;32m²[;m[1;0;44;32m²[;m[5;5;46;36mÛ[;m[5;5;46;36mÛ[;m[5;5;46;36mÛ[;m[5;5;46;36mÛ[;m[5;5;46;36mÛ[;m[1;0;44;32m²[;m[1;0;44;32m²[;m[5;5;46;36mÛ[;m[5;5;46;36mÛ[;m[5;5;46;36mÛ[;m[5;5;46;36mÛ[;m[5;5;46;36mÛ[;m[1;0;44;32m²[;m[1;0;44;32m²[;m[5;5;46;36mÛ[;m[5;5;46;36mÛ[;m[5;5;46;36mÛ[;m[5;5;46;36mÛ[;m[5;5;46;36mÛ[;m[1;0;44;32m²[;m[1;0;44;32m²[;m[5;5;46;36mÛ[;m[5;5;46;36mÛ[;m[5;5;46;36mÛ[;m[5;5;46;36mÛ[;m[1;0;44;32m²[;m[5;5;46;36mÛ[;m[5;5;46;36mÛ[;m[5;5;46;36mÛ[;m[5;5;46;36mÛ[;m[1;0;44;32m²[;m[1;0;44;32m²[;m[5;5;46;36mÛ[;m[5;5;46;36mÛ[;m[5;5;46;36mÛ[;m[5;5;46;36mÛ[;m[1;0;44;32m²[;m[1;0;44;32m²[;m[5;5;46;36mÛ[;m[5;5;46;36mÛ[;m[5;5;46;36mÛ[;m[5;5;46;36mÛ[;m[1;0;44;32m²[;m[1;0;44;32m²[;m[5;5;46;36mÛ[;m[5;5;46;36mÛ[;m[5;5;46;36mÛ[;m[5;5;46;36mÛ[;m[5;5;46;36mÛ[;m[1;0;44;32m²[;m[1;0;44;32m²[;m[5;5;46;36mÛ[;m[5;5;46;36mÛ[;m[5;5;46;36mÛ[;m[5;5;46;36mÛ[;m[5;5;46;36mÛ[;m[1;0;44;32m²[;m[5;5;46;36mÛ[;m[5;5;46;36mÛ[;m[5;5;46;36mÛ[;m[5;5;46;36mÛ[;m[1;0;44;32m²[;m[1;0;44;32m²[;m[5;5;46;36mÛ[;m[5;5;46;36mÛ[;m[5;5;46;36mÛ[;m[5;5;46;36mÛ[;m[1;0;44;32m²[;m[1;0;44;32m²[;m[5;5;46;36mÛ[;m[5;5;46;36mÛ[;m[5;5;46;36mÛ[;m[5;5;46;36mÛ[;m[5;5;46;36mÛ[;m[1;0;44;32m²[;m[1;0;44;32m²[;m[5;5;46;36mÛ[;m[5;5;46;36mÛ[;m[5;5;46;36mÛ[;m[5;5;46;36mÛ[;m[5;5;46;36mÛ[;m[1;0;44;32m²[;m[1;0;44;32m²[;m[5;5;46;36mÛ[;m[5;5;46;36mÛ[;m[5;5;46;36mÛ[;m[5;5;46;36mÛ[;m[5;5;46;36mÛ[;m[1;0;44;32m²[;m[1;0;44;32m²[;m[5;5;46;36mÛ[;m[5;5;46;36mÛ[;m[5;5;46;36mÛ[;m[5;5;46;36mÛ[;m[1;0;44;32m²[;m[5;5;46;36mÛ[;m[5;5;46;36mÛ[;m[5;5;46;36mÛ[m
	set F[2]=[5;5;46;36mÛ[;m[1;0;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;0;44;32m²[;m[5;5;46;36mÛ[;m[5;5;46;36mÛ[;m[5;5;46;36mÛ[;m[1;0;44;32m²[;m[1;1;44;32m²[;m[1;0;44;32m²[;m[5;5;46;36mÛ[;m[5;5;46;36mÛ[;m[1;0;44;32m²[;m[1;1;44;32m²[;m[1;0;44;32m²[;m[5;5;46;36mÛ[;m[5;5;46;36mÛ[;m[5;5;46;36mÛ[;m[1;0;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;0;44;32m²[;m[5;5;46;36mÛ[;m[5;5;46;36mÛ[;m[1;0;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;0;44;32m²[;m[5;5;46;36mÛ[;m[5;5;46;36mÛ[;m[1;0;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;0;44;32m²[;m[5;5;46;36mÛ[;m[5;5;46;36mÛ[;m[1;0;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;0;44;32m²[;m[5;5;46;36mÛ[;m[5;5;46;36mÛ[;m[1;0;44;32m²[;m[1;1;44;32m²[;m[1;0;44;32m²[5;5;46;36mÛ[;m[5;5;46;36mÛ[;m[1;0;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;0;44;32m²[;m[5;5;46;36mÛ[;m[5;5;46;36mÛ[;m[5;5;46;36mÛ[;m[1;0;44;32m²[;m[1;1;44;32m²[;m[1;0;44;32m²[;m[5;5;46;36mÛ[;m[5;5;46;36mÛ[;m[1;0;44;32m²[;m[1;1;44;32m²[;m[1;0;44;32m²[;m[5;5;46;36mÛ[;m[5;5;46;36mÛ[;m[5;5;46;36mÛ[;m[1;0;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;0;44;32m²[;m[5;5;46;36mÛ[;m[5;5;46;36mÛ[;m[1;0;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;0;44;32m²[;m[5;5;46;36mÛ[;m[5;5;46;36mÛ[;m[1;0;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;0;44;32m²[;m[5;5;46;36mÛ[;m[5;5;46;36mÛ[;m[1;0;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;0;44;32m²[;m[5;5;46;36mÛ[;m[5;5;46;36mÛ[;m[1;0;44;32m²[;m[1;1;44;32m²[;m[1;0;44;32m²[;m[5;5;46;36mÛ[;m[5;5;46;36mÛ[;m[1;0;44;32m²[;m[1;1;44;32m²[;m[1;0;44;32m²[;m[1;0;44;32m²[;m[5;5;46;36mÛ[;m[5;5;46;36mÛ[;m[1;0;44;32m²[;m[1;1;44;32m²[;m[1;0;44;32m²[;m[5;5;46;36mÛ[;m[5;5;46;36mÛ[;m[5;5;46;36mÛ[;m[1;0;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;0;44;32m²[;m[5;5;46;36mÛ[;m[5;5;46;36mÛ[;m[1;0;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;0;44;32m²[;m[5;5;46;36mÛ[;m[5;5;46;36mÛ[;m[5;5;46;36mÛ[;m[1;0;44;32m²[;m[1;1;44;32m²[;m[1;0;44;32m²[;m[5;5;46;36mÛ[;m[5;5;46;36mÛ[;m[1;0;44;32m²[;m[1;1;44;32m²[;m[1;0;44;32m²[;m[5;5;46;36mÛ[;m[5;5;46;36mÛ[;m[5;5;46;36mÛ[;m[1;0;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;0;44;32m²[;m[5;5;46;36mÛ[;m[5;5;46;36mÛ[;m[1;0;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;0;44;32m²[;m[5;5;46;36mÛ[;m[5;5;46;36mÛ[;m[1;0;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;0;44;32m²[;m[5;5;46;36mÛ[;m[5;5;46;36mÛ[;m[1;0;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;0;44;32m²[;m[5;5;46;36mÛ[;m[5;5;46;36mÛ[;m[1;0;44;32m²[;m[1;1;44;32m²[;m[1;0;44;32m²[;m[5;5;46;36mÛ[;m[1;0;44;32m²[m
	set F[3]=[2;0;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;0;44;32m²[;m[1;1;44;32m²[;m[1;0;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;0;44;32m²[;m[1;0;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;0;44;32m²[;m[1;1;44;32m²[;m[1;0;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;0;44;32m²[;m[1;0;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;0;44;32m²[;m[1;0;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;0;44;32m²[;m[1;0;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;0;44;32m²[;m[1;0;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[1;0;44;32m²[;m[1;0;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;0;44;32m²[;m[1;1;44;32m²[;m[1;0;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;0;44;32m²[;m[1;0;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;0;44;32m²[;m[1;1;44;32m²[;m[1;0;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;0;44;32m²[;m[1;0;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;0;44;32m²[;m[1;0;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;0;44;32m²[;m[1;0;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;0;44;32m²[;m[1;0;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;0;44;32m²[;m[1;0;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;0;44;32m²[;m[1;0;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;0;44;32m²[;m[1;1;44;32m²[;m[1;0;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;0;44;32m²[;m[1;0;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;0;44;32m²[;m[1;1;44;32m²[;m[1;0;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;0;44;32m²[;m[1;0;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;0;44;32m²[;m[1;1;44;32m²[;m[1;0;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;0;44;32m²[;m[1;0;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;0;44;32m²[;m[1;0;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;0;44;32m²[;m[1;0;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;0;44;32m²[;m[1;0;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;0;44;32m²[;m[1;1;44;32m²[m
	set F[4]=[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;0;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;0;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;0;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;0;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;0;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;0;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;0;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[;m[1;1;44;32m²[m
	goto :eof
