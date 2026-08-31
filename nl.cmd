@echo off
@echo:
@echo NPM Linker
@echo:

@if [%1] == [] goto :showhelp
@IF [%1] == [^?] GOTO :showhelp
@IF [%1] == [^\^?] GOTO :showhelp
@IF [%1] == [^-^?] GOTO :showhelp
@IF [%1] == [^/^?] GOTO :showhelp
@IF /i [%1] == [h] GOTO :showhelp
@IF /i [%1] == [help] GOTO :showhelp
@IF /i [%1] == [^-h] GOTO :showhelp
@IF /i [%1] == [^-^-help] GOTO :showhelp

@if [%2] == [] goto :link_simple

goto :link_dir

:link_simple
@if not exist "%APPDATA%\npm\node_modules\%1" goto :npm_notexist

@if NOT exist node_modules mkdir node_modules > NUL
@if exist node_modules\%1 rd node_modules\%1 /s/q  > NUL

@mklink /J node_modules\%1 "%APPDATA%\npm\node_modules\%1"

goto :eof

:link_dir
@setlocal
@set _grp=%1
@if [%1] == [^@op] set _grp=@office-platform

@if not exist "%APPDATA%\npm\node_modules\%_grp%\%2" goto :npm_notexist_dir

@if not exist node_modules\%_grp% mkdir node_modules\%_grp% > NUL
@if exist node_modules\%_grp%\%2 rd node_modules\%_grp%\%2 /s/q > NUL

@mklink /J node_modules\%_grp%\%2 "%APPDATA%\npm\node_modules\%_grp%\%2"
@goto :eof

:npm_notexist
@echo:
@echo NPM module ^"%1^" is not exist in global NPM registry
@echo:
@goto :eof

:npm_notexist_dir
@echo:
@echo NPM module ^"%1^/%2^" is not exist in global NPM registry
@echo:
@goto :eof

:showhelp
@echo USAGE:
@echo:
@echo nl ^[module-group^] module-name
@echo:
@echo WHERE module_group could be @op (@office-platform)
@echo:
@goto :eof