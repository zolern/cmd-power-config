:: Standalone Office command-line helper ver. 0.0.1
:: LSEG/Refinitiv Office Platform command-line companion
:: for easy config, start/stop Workspace for Office Framework
:: and rebuild Office Platform Modules
:: EPAM Systems Bulgaria 2024
:: LSEG Workspace Analytics Team 2024

@echo off
@setlocal

@IF [%1] == [^?] GOTO showhelp
@IF [%1] == [^\^?] GOTO showhelp
@IF [%1] == [^-^?] GOTO showhelp
@IF [%1] == [^/^?] GOTO showhelp
@IF /i [%1] == [h] GOTO showhelp
@IF /i [%1] == [help] GOTO showhelp
@IF /i [%1] == [^-h] GOTO showhelp
@IF /i [%1] == [^-^-help] GOTO showhelp

@if NOT [%1] == [] GOTO checkops

@goto showhelp
@goto :eof

:checkops
@if /i [%1] == [k] goto kbstop
@if /i [%1] == [^\k] goto kbstop
@if /i [%1] == [^/k] goto kbstop
@if /i [%1] == [kill] goto kbstop
@if /i [%1] == [^-k] goto kbstop
@if /i [%1] == [^-^-kill] goto kbstop

@if /i [%1] == [c] goto kbcacheclear
@if /i [%1] == [^\c] goto kbcacheclear
@if /i [%1] == [^/c] goto kbcacheclear
@if /i [%1] == [clear] goto kbcacheclear
@if /i [%1] == [clean] goto kbcacheclear
@if /i [%1] == [^-c] goto kbcacheclear
@if /i [%1] == [^-^-clear] goto kbcacheclear
@if /i [%1] == [^-^-clean] goto kbcacheclear

@echo Unknown parameter %1
@goto showusage

:showhelp
@echo.
@echo Standalone Office
@echo (Office Platform command-line companion)
:showusage
@echo.
@echo  Usage:
@echo.
@echo    so k[ill]    	stops WorkspaceOffice and/or Excell
@echo    so c[lear]   	clears WorkspaceOffice cache and logs
@echo.
@echo    so h[elp]    	show this info
@goto :eof


:kbstop
@tskill excel /a 2> NUL
@tskill powerpnt /a 2> NUL
@sleep 5 > NUL 2> NUL
@timeout /t 5 /nobreak 2> NUL > NUL
@tskill Electron /a 2> NUL
@exit /b


:kbcacheclear
@call :kbstop
@call :cleandir "%localappdata%\\Workspace Office\\cache" > NUL 2> NUL
@call :cleandir "%localappdata%\\Workspace Office\\logs" > NUL 2> NUL
@exit /b


:cleandir
@pushd %1 > NUL 2> NUL
@if %ERRORLEVEL% NEQ 0 goto cleandir_err
@rd %1 /s/q > NUL 2> NUL
@popd

:cleandir_err
@exit /b 0
