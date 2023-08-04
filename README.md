# Flappy_Bird_With_Batch_File
***
## Introduction
This is my practice and research how the batch file usage.<br>
I am refer the script from [Honguito98/batch-game-flappy-bird](https://github.com/Honguito98/batch-game-flappy-bird) for this practical.<br>
Thanks for the Honguito98.

## About the command prompt and batch file
Command prompt is a terminal that using instruction to interact with operating system.
The instruction and command can be refer by using a help command, 
but the operator and operation theory is not that clearly when refer to the help command.
</br>

So, I organized these may not common used operator, but it useful to improve the efficiency of batch script.
|operator|introduce|
|---|---|
|\( \)|Grouping is helps to group command into a execution. Example, the line [57-60](https://github.com/yutsunoki/Flappy_Bird_With_Batch_File/blob/main/batch_rev.bat?plain=1#L57-L60) is used to group command, and output the result into a file.| 
|^|This operator is use to join next line or enable literal characters instead of operator characters such as ‘&’ or '^|'. For example, The line of [72-76](https://github.com/yutsunoki/Flappy_Bird_With_Batch_File/blob/main/batch_rev.bat?plain=1#L72-L76) is joining next line of code, [11](https://github.com/yutsunoki/Flappy_Bird_With_Batch_File/blob/main/batch_rev.bat?plain=1#L11) is literal charactor instead of the operator charactor.|
|&@|Refer to the "operating system: three easy pieces". This operation is a shell operator used to execute commands in the same time with virtualizing the CPU.|
|&&|This operator is used to execute first command and second command with sequence. When the command fail, the instruction will stop executing.|
|\|\||This operator is used to execute second command when the first command fail.
|[ANSI escape code](https://en.wikipedia.org/wiki/ANSI_escape_code)|ANSI escape code is useful to display your output result. For example, where you want to a Bell sound, hide cursor, change text and backgound color, or output the result to a specify location etc.|


