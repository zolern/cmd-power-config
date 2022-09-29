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
@mklink /j now nim-%1 > NUL
@nim -v
@popd