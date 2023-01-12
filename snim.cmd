@echo off
@echo:

@if [%1] == [] (
	echo Nim version helper
	echo:
	echo Use:
	echo    snim ^<version^>
	echo:
	goto :eof
)

@pushd .
@call d snim
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
@popd