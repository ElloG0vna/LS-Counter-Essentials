@echo off

:task
@cls
color 0a
tasklist
setlocal EnableDelayedExpansion
echo Do you want to (d)elete or (s)tart a task? If you need help do /help
set /p start= 
if %start%==d (
	set /p a="What Task do you want to end?"
	echo Ending !a!'s task...
	tasklist | find /I "!a!"
	if errorlevel 1 (
		echo That task doesn't exist!
		goto :task
	)
	if errorlevel 0 (
		taskkill /f /t /im !a!
		goto :task
	)
)
if %start%==s (
	set /p run="What task do you want to run?"
	echo Starting !run! ...
	start !run!
	if errorlevel 1 (
		echo That program doesn't exist!
		goto :task
	)else(
		goto :task
	)	
)
if %start%==/help (
	@cls
	echo HELP MENU
	echo.
	echo --------------------------------------------------------
	echo KILLING PROGRAMS/TASKS
	echo.
	echo When you want to end a program, 
	echo you have to pick from the tasks listed and type it in.
	echo.
	echo EXAMPLE
	echo.
	echo What Task do you want to end?
	echo msedge.exe
	echo --------------------------------------------------------
	echo STARTING PROGRAMS/TASKS
	echo.
	echo When you want to start a program, 
	echo you type the program name you want to run into the box.
	echo.
	echo If windows cannot find the program you want, Try finding it's original name.
	echo Like for Example:
	echo Word is called WINWORD
	echo and Microsoft Edge is called msedge
	echo Press any key to go back to TaskMgr...
	pause >nul
	goto :task
)
		
		