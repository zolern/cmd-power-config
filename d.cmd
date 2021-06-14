@echo off
@setlocal

@SET _exitcode=0
@SET _ddver=0.2.0
@SET _ddtitle=Directory definition tool
@SET _ddres=NOTFOUND
@SET _ddcmd=USEDEF
@SET _newpath=%cd%

@IF /I [%1] == [-p] (
	@SET _ddcmd=SHOWDEF
	@shift
)

@SET _ddpar1=%1

@IF [%1] == [] SET _ddcmd=SHOWALL

@IF [%1] == [^/^?] SET _ddcmd=SHOWINFO
@IF [%1] == [^?] SET _ddcmd=SHOWINFO
@IF [%1] == [^-^?] SET _ddcmd=SHOWINFO
@IF /I [%1] == [^/h] SET _ddcmd=SHOWINFO
@IF /I [%1] == [^-h] SET _ddcmd=SHOWINFO

@IF /I [%1] == [^/l] (
	@SET _ddcmd=SHOWALL
	@SET _ddpar1=
	@SET _ddres=EMPTY
)
@IF /I [%1] == [^-l] (
	@SET _ddcmd=SHOWALL
	@SET _ddpar1=
	@SET _ddres=EMPTY
)

@IF /I [%1] == [^/f] (
	@SET _ddcmd=SHOWFILE
	@SET _ddpar1=
	@SET _ddres=EMPTY
)
@IF /I [%1] == [^-f] (
	@SET _ddcmd=SHOWFILE
	@SET _ddpar1=
	@SET _ddres=EMPTY
)

@IF /I [%1] == [^/s] (
	SET _ddcmd=SAVEDEF
	SET _ddpar1=%2
	SET _ddpar2=%3
)
@IF /I [%1] == [^-s] (
	SET _ddcmd=SAVEDEF
	SET _ddpar1=%2
	SET _ddpar2=%3
)
@IF /I [%2] == [^/s] (
	SET _ddcmd=SAVEDEF
	SET _ddpar1=%1
	SET _ddpar2=%3
)
@IF /I [%2] == [^-s] (
	SET _ddcmd=SAVEDEF
	SET _ddpar1=%1
	SET _ddpar2=%3
)
@IF /I [%3] == [^/s] (
	SET _ddcmd=SAVEDEF
	SET _ddpar1=%1
	SET _ddpar2=%2
)
@IF /I [%3] == [^-s] (
	SET _ddcmd=SAVEDEF
	SET _ddpar1=%1
	SET _ddpar2=%2
)

@IF /I [%1] == [^/a] (
	SET _ddcmd=SAVEDEF
	SET _ddpar1=%2
	SET _ddpar2=%3
)
@IF /I [%1] == [^-a] (
	SET _ddcmd=SAVEDEF
	SET _ddpar1=%2
	SET _ddpar2=%3
)
@IF /I [%2] == [^/a] (
	SET _ddcmd=SAVEDEF
	SET _ddpar1=%1
	SET _ddpar2=%3
)
@IF /I [%2] == [^-a] (
	SET _ddcmd=SAVEDEF
	SET _ddpar1=%1
	SET _ddpar2=%3
)
@IF /I [%3] == [^/a] (
	SET _ddcmd=SAVEDEF
	SET _ddpar1=%1
	SET _ddpar2=%2
)
@IF /I [%3] == [^-a] (
	SET _ddcmd=SAVEDEF
	SET _ddpar1=%1
	SET _ddpar2=%2
)

@IF [%_ddcmd%] == [SHOWINFO] (
	@echo:
	@echo %_ddtitle%  v.%_ddver%
	@echo:
	@echo   Usage:
	@echo:
	@echo   d ^<def^> 		- change current directory to defined
	@echo:
	@echo   d -s/-a ^<def^> 	- set/add def to current directory
	@echo   d -s/-a ^<def^> ^<dir^>	- set/add def to directory
	@echo   d -l 			- list all definitions
	@echo   d -f 			- show definitions file pathname
	@SET _ddres=FOUND
) ELSE IF [%_ddcmd%] == [SAVEDEF] (
	@IF [%_ddpar2%] == [] (
		@echo %_ddpar1%^@%cd% >> %USERPROFILE%\.d.def
	) ELSE (
		@echo %_ddpar1%^@%_ddpar2% >> %USERPROFILE%\.d.def
	)
	@SET _ddres=FOUND
) ELSE IF [%_ddcmd%] == [SHOWFILE] (
	@echo:
	@echo %_ddtitle%
	@echo:
	@echo   Definitions file: "%USERPROFILE%\.d.def"
	@echo:
	@start "Notepad" notepad++ "%USERPROFILE%\.d.def"
	@SET _ddres=FOUND
) ELSE (
	@IF [%_ddcmd%] == [SHOWALL] (
		@echo:
		@echo %_ddtitle%
		@echo:
		@echo   Definitions: ^(use d ^-^? for help^)
		@echo:
	)
	(@FOR /F "tokens=1,2 delims=@ eol=#" %%G IN (%USERPROFILE%\.d.def) DO @IF [] == [] (
		@IF [%_ddcmd%] == [SHOWALL] (
			@echo   %%G	-^> %%H
			@SET _ddres=FOUND
		)
		@IF  [%_ddpar1%] == [%%G] (
			@IF [%_ddcmd%] == [USEDEF] (
				@CALL CD /d %%H
				@SET _newpath=%%H
				@SET _ddres=FOUND
			)
			@IF [%_ddcmd%] == [SHOWDEF] (
				@echo %%H
				@SET _ddres=FOUND
				@SET _exitcode=99
			)
		)
	)) 2> NUL
)

@IF [%_ddres%] == [EMPTY] (
	@echo   No definitions yet
	@echo:
	@echo   Use d -s ^<def^> ^<dir^> to add one...
	@SET _ddres=FOUND
)

@IF [%_ddres%] == [NOTFOUND] (
	@echo:
	@echo %_ddtitle%
	@echo:
	@echo   No directory definition for ^>^>^> %1 ^<^<^<
	@echo:
	@echo   Use d -s ^<def^> ^<dir^> to add one...
)

@endlocal & @CALL CD /d "%_newpath%" & exit /b %_exitcode%
