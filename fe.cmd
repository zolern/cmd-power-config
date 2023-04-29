@echo off


@if [%1] == [^?] goto fe_help

@setlocal

@set emulator=ephone_R
@if /i [%1] == [l] set emulator=ephone_L
@if /i [%1] == [n] set emulator=ephone_N
@if /i [%1] == [r] set emulator=ephone_R
@if /i [%1] == [s] set emulator=ephone_S

@flutter emulators --launch %emulator%

@endlocal
@goto :eof

:fe_help
@echo.
@echo Flutter Device Emulator helper
@echo.
@echo fe L	launch Android Lolipop
@echo fe N	launch Android Nougat
@echo fe R	launch Android R
@echo fe S	launch Android S
@goto :eof
