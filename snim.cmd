@echo off
@echo:

@echo Nim version helper
@echo:

@if [%1] == [] (
	echo Use:
	echo    snim ^<version^>	switch current version
	echo:
	echo    snim list       	show all available versions
	echo    snim del ^<version^>	delete version
	echo:
	goto :eof
)

@pushd .
@call d snim

@if /i [%1] == [list] (
	goto :show
)

@if /i [%1] == [l] (
	goto :show
)

@if /i [%1] == [del] (
	goto :delete
)

@if /i [%1] == [d] (
	goto :delete
)

@rd now > NUL 2> NUL
if exist %1 (
	@mklink /j now %1 > NUL
	goto :next
)
if exist nim-%1 (
	@mklink /j now nim-%1 > NUL
)
:next
@nim -v
goto :exit

:show
@dir nim*.* /AD /B
goto :exit

:delete
if exist %2 (
	@rd %2 /s/q > NUL 2> NUL
	goto :exit
)
if exist nim-%2 (
	@rd nim-%1 /s/q > NUL 2> NUL
	goto :exit
)
@echo:
@echo nim version %2 is not installed
goto :exit

:exit
@popd
goto :eof
