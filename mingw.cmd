@echo off
@echo:

@echo MinGW 64 version helper
@echo:

@if [%1] == [] (
	echo Use:
	echo    mingw ^<version^>	switch current version
	echo:
	echo    mingw list       	show all available versions
	echo:
	goto :eof
)

@pushd .
@call d mingw

@if /i [%1] == [list] (
	goto :show
)

@if /i [%1] == [l] (
	goto :show
)

@rd now
if exist %1 (
	@mklink /j now %1
	goto :next
)
goto :show

:next
@gcc.exe --version
goto :exit

:show
@dir gw*.* /AD /B
goto :exit

:exit
@popd
goto :eof
