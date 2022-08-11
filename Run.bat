@echo off

:task
@cls
color 0a
echo What program do you want to start? If you need help do /help
set /p input=
if %input%==/help (
	@cls
	echo HELP MENU
	echo.
	echo HOW TO RUN PROGRAM
	echo to run a program you type the program name into the box.
	echo If windows cannot find the program you want, Try finding it's original name.
	echo Like for example: 
	echo Word is called WINWORD
	echo and Microsoft Edge is called MSEDGE
	echo.
	echo Press any key to go back to RUN...
	pause >nul
)
echo Starting %input%...
start %input%
if errorlevel 1 (
	echo That Program doesn't exist! Try again.
	goto :task
)
if errorlevel 0 (
	echo Success!!
	goto :task
)


