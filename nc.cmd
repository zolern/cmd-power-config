@echo:
@echo  Node Modules Check updates
@echo:

@IF [%1] == [^?] GOTO showhelp
@IF [%1] == [^\^?] GOTO showhelp
@IF [%1] == [^-^?] GOTO showhelp
@IF [%1] == [^/^?] GOTO showhelp

@IF [%1] == [] (
	@npm-check --skip-unused
	GOTO :eof
)

@IF [%1] == [c] (
	@npm-check
	GOTO :eof
)

@IF /i [%1] == [g] (
	@npm-check -gu --skip-unused
	GOTO :eof
)

@IF /i [%1] == [-g] (
	@npm-check -gu --skip-unused
	GOTO :eof
)

@IF /i [%1] == [u] (
	@npm-check -u --skip-unused
	GOTO :eof
)

@IF /i [%1] == [-u] (
	@npm-check -u --skip-unused
	GOTO :eof
)

@IF /i [%1] == [ug] (
	@npm-check -gu --skip-unused 
	GOTO :eof
)

@IF /i [%1] == [-ug] (
	@npm-check -gu --skip-unused 
	GOTO :eof
)


@IF /i [%1] == [gu] (
	@npm-check -gu --skip-unused
	GOTO :eof
)

@IF /i [%1] == [-gu] (
	@npm-check -gu --skip-unused
	GOTO :eof
)

@echo Unknown parameter ^<%1^>
@echo:
@GOTO showusage

:showhelp
:showusage
@echo:
@echo   Usage:
@echo:
@echo   nc    	check local node modules for updates
@echo   nc c  	check if unused local node modules and for updates
@echo   nc g  	check global node modules for updates
@echo:
@echo   nc u   	update local node modules
@echo   nc gu  	update global node modules
@echo:
@echo   n ^?   	show this info
@GOTO :eof
