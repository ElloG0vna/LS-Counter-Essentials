@echo off

:task
@cls
color 0a
tasklist
echo What Task do you want to end?
set /p input=
echo Ending %input%'s task...
tasklist | find /I "%input%"
if errorlevel 1 (
	echo That task Isn't Open!
	goto :task
)
if errorlevel 0 (
	taskkill /f /t /im %input%
	echo Success!!
	goto :task
)

