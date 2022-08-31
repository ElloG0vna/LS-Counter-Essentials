@echo off
if not "%minimized%"=="" goto :minimized
set minimized=true
start /min cmd /C "%~dpnx0"
goto :EOF
:minimized
start taskmgr.exe
:Restart
color 0a
@cls
tasklist | find /I "taskmgr"
if errorlevel 1 (
	start Minimize.vbs
	start onenote.exe
	goto retry
)
goto restart
:retry
tasklist | find /I "taskmgr"
if errorlevel 1 (
	start /min taskmgr.exe
	timeout /t 20 /nobreak
	@cls
	goto retry
	)
goto restart
