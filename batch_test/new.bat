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
pause>nul
