@setlocal

@IF [%1] == [^?] GOTO showhelp
@IF [%1] == [^\^?] GOTO showhelp
@IF [%1] == [^-^?] GOTO showhelp
@IF [%1] == [^/^?] GOTO showhelp


@IF /i [%1] == [vl] (
	echo:
	echo  Node Version Manager for Windows
	echo:
	@nvm list
	GOTO :eof
)

@IF /i [%1] == [va] (
	echo:
	echo  Node Version Manager for Windows
	echo:
	@nvm list available
	GOTO :eof
)

@if /i [%1] == [vi] (
	echo:
	echo  Node Version Manager for Windows
	echo:
	@nvm install %2
	GOTO :eof
)

@if /i [%1] == [vu] (
	echo:
	echo  Node Version Manager for Windows
	echo:
	@nvm uninstall %2
	GOTO :eof
)

@if /i [%1] == [vs] (
	goto :setnodever
)

@if /i [%1] == [vg] (
	goto :getnodever
)

@if /i [%1] == [vd] (
	echo:
	echo  Node Version Manager for Windows
	echo:
	@nvm uninstall %2
	GOTO :eof
)

@IF /i [%1] == [v] (
	if [%2] == [] (
		CALL :showver
		GOTO :eof
	)
	goto :changenodever
)

@IF /i [%1] == [s] (
	@call npm start %2 %3 %4 %5 %6 %7 %8 %9
	GOTO :eof
)

@IF /i [%1] == [start] (
	@call npm start %2 %3 %4 %5 %6 %7 %8 %9
	GOTO :eof
)

@if /i [%1] == [t] (
	@call npm run test %2 %3 %4 %5 %6 %7 %8 %9
	@GOTO :eof
)

@if /i [%1] == [test] (
	@call npm run test %2 %3 %4 %5 %6 %7 %8 %9
	@GOTO :eof
)

@if /i [%1] == [c] (
	@call :npm_coverage
	@GOTO :eof
)

@if /i [%1] == [coverage] (
	@call :npm_coverage
	@GOTO :eof
)

@if /i [%1] == [cf] (
	@goto :npm_format
)

@if /i [%1] == [check] (
	@goto :npm_format
)

@if /i [%1] == [f] (
	@goto :npm_format_fix
)

@if /i [%1] == [fmt] (
	@goto :npm_format_fix
)

@if /i [%1] == [format] (
	@goto :npm_format_fix
)

@if /i [%1] == [r] (
	@npm run %2 %3 %4 %5 %6 %7 %8 %9
	@goto :eof
)

@IF /i [%1] == [l] (
	@IF [%2] == [] @call npm list --depth=0
	@IF NOT [%2] == [] @call npm list --depth=%2
	GOTO :eof
)

@IF /i [%1] == [p] (
	@echo Package ^"%2^"
	@echo - recent version:
	@call npm view %2 version %3 %4 %5 %6 %7 %8 %9
	GOTO :eof
)

@IF /i [%1] == [i] (
	@IF NOT [%2] == [] GOTO NODEPACKAGEINSTALL
	@rd node_modules /s/q > NUL 2>&1
	@call npm install 
	GOTO :eof
)

@IF /i [%1] == [ri] (
	@rd node_modules /s/q > NUL 2>&1
	@del package-lock.json > NUL 2>&1
	@call npm install 
	GOTO :eof
)

@IF /i [%1] == [rd] (
	@rd node_modules /s/q > NUL 2>&1
	@del package-lock.json > NUL 2>&1
	GOTO :eof
)

@IF /i [%1] == [id] (
	@IF NOT [%2] == [] GOTO NODEPACKAGEINSTALLDEV
	GOTO :eof
)

@IF /i [%1] == [ip] (
	@call npm install --production
	GOTO :eof
)

@IF /i [%1] == [a] (
	GOTO NODEPACKAGEINSTALL
)

@IF /i [%1] == [u] (
	@call npm uninstall %2 %3 %4 %5 %6 %7 %8 %9
	GOTO :eof
)

@IF /i [%1] == [d] (
	@call npm uninstall %2 %3 %4 %5 %6 %7 %8 %9
	GOTO :eof
)

@IF /i [%1] == [lg] (
	@IF [%2] == [] @call npm list -g --depth=0
	@IF NOT [%2] == [] @call npm list -g --depth=%2
	GOTO :eof
)

@IF /i [%1] == [gl] (
	@IF [%2] == [] @call npm list -g --depth=0
	@IF NOT [%2] == [] @call npm list -g --depth=%2
	GOTO :eof
)

@IF /i [%1] == [ig] (
	@IF /i [%2] == [] GOTO showusage
	@call npm install -g %2 %3 %4 %5 %6 %7 %8 %9
	GOTO :eof
)

@IF /i [%1] == [ag] (
	@call npm install -g %2 %3 %4 %5 %6 %7 %8 %9
	GOTO :eof
)

@IF /i [%1] == [ga] (
	@call npm install -g %2 %3 %4 %5 %6 %7 %8 %9
	GOTO :eof
)

@IF /i [%1] == [ug] (
	@call npm uninstall -g %2 %3 %4 %5 %6 %7 %8 %9
	GOTO :eof
)

@IF /i [%1] == [gu] (
	@call npm uninstall -g %2 %3 %4 %5 %6 %7 %8 %9
	GOTO :eof
)

@IF /i [%1] == [dg] (
	@call npm uninstall -g %2 %3 %4 %5 %6 %7 %8 %9
	GOTO :eof
)

@IF /i [%1] == [gd] (
	@call npm uninstall -g %2 %3 %4 %5 %6 %7 %8 %9
	GOTO :eof
)

@IF /i [%1] == [ls] (
	echo:
	echo  Node Version Manager for Windows
	echo:
	nvm list
	GOTO :eof
)

@IF /i [%1] == [cc] (
	@call npm cache verify
	GOTO :eof
)

@IF /i [%1] == [ccf] (
	@call npm cache clean --force
	GOTO :eof
)

@IF /i [%1] == [env] (
	GOTO setnodeenv
)

:errorpar
@IF [%1] == [] (
	CALL :showver
	GOTO :eof
)

@echo:
@echo Unknown parameter ^<%1^>
@GOTO showusage

:showhelp
@echo:
@echo NodeJS command-line companion
:showusage
@echo:
@echo   Usage:
@echo:
@echo   n v		shows current nodeJS^/npm version
@echo:
@echo   n l   	lists all nodeJS modules in current directory
@echo   n p ^<pkg^>	show package version: recent vs local installed
@echo:
@echo   n i 		install all packages
@echo   n ri 		install all packages (with deleting node_modules)
@echo   n ip 		install all packages in production
@echo:
@echo   n i ^<pkg^>	install package
@echo   n a ^<pkg^>	install package
@echo   n id ^<pkg^>	install package as dev dependency
@echo   n u ^<pkg^>	remove package
@echo   n d ^<pkg^>	remove package
@echo:
@echo   n lg  	lists all global nodeJS modules 
@echo   n ig ^<pkg^>	install global package
@echo   n ag ^<pkg^>	install global package
@echo   n ug ^<pkg^>	remove global package
@echo   n dg ^<pkg^>	remove global package
@echo:
@echo   n cc		clean node modules cache
@echo:
@echo   n env d^[ev^]	set NODE_ENV to development
@echo   n env p^[rod^]	set NODE_ENV to production
@echo   n env -  	unset NODE_ENV
@echo:
::@echo   n p^+		set proxies
::@echo   n p^-		unset proxies
::@echo   n pp		show proxies
::@echo:
@echo   n ls		list installed node versions
@echo:
@echo   n ^?		show this info
@GOTO :eof

:NODEPACKAGEINSTALL
@call npm install %2 %3 %4 %5 %6 %7 %8 %9
GOTO :eof

:NODEPACKAGEINSTALLDEV
@call npm install --save-dev %2 %3 %4 %5 %6 %7 %8 %9
GOTO :eof

:setnodeenv
@IF /i [%2] == [dev] GOTO devsetnodeenv
@IF /i [%2] == [d] GOTO devsetnodeenv
@IF /i [%2] == [prod] GOTO prodsetnodeenv
@IF /i [%2] == [p] GOTO prodsetnodeenv
@IF /i [%2] == [-] GOTO clearnodeenv
@echo Node env: %NODE_ENV%
@GOTO :eof
:clearnodeenv
@set NODE_ENV=
@setx NODE_ENV "" > NUL
@echo Node env is cleared
@GOTO :eof
:devsetnodeenv
@set NODE_ENV=development
@setx NODE_ENV development > NUL
@echo Node env set to development
@GOTO :eof
:prodsetnodeenv
@set NODE_ENV=production
@setx NODE_ENV production > NUL
@echo Node env set to production
@GOTO :eof


:npm_format
@if [%2] == [] (
	@call eslint . --ext .js,.json,.ts -c %APPDATA%\npm\.eslintrc.js
)
@if NOT [%2] == [] (
	@call eslint --ext .js,.json,.ts -c %APPDATA%\npm\.eslintrc.js %2 %3 %4 %5 %6 %7 %8 %9
)
@goto :eof

:npm_format_fix
@call eslint . --fix --ext .js,.json,.ts -c %APPDATA%\npm\.eslintrc.js
@goto :eof

:npm_coverage
@call npx nyc npx mocha
@goto :eof

:showver 
@node -v
@echo:
@echo    npm version:
@call npm -v
@echo:
@GOTO :eof

:NODENOTSET 
@echo NodeJS is not set.
@echo n ? for more info
@GOTO :eof

:changenodever
@echo:
@echo  Node Version Manager for Windows
@IF NOT exist "%APPDATA%\nvm_sets\node_%2.set" goto :normalnvmset
@set _lver=
@Set /P _lver=<"%APPDATA%\nvm_sets\node_%2.set"
@IF "%_lver%" == "" goto :normalnvmset
@echo     use %2 as %_lver%
@nvm use %_lver%
@set _lver=
@goto :eof

:normalnvmset
@nvm use %2
@if [%3] == [] goto :eof

:setnodever
@IF NOT exist "%APPDATA%\nvm_sets" (
	mkdir "%APPDATA%\nvm_sets" > NUL 2> NUL
)
@if [%3] == [] goto :delnodever
@echo     set shortcut for %2 as %3
@echo %2 > "%APPDATA%\nvm_sets\node_%3.set"
@goto :eof

:getnodever
@echo:
@echo  Node Version Manager for Windows
@IF NOT exist "%APPDATA%\nvm_sets\node_%2.set" goto :nodevernotset
@set _lver=
@Set /P _lver=<"%APPDATA%\nvm_sets\node_%2.set"
@IF "%_lver%" == "" goto :nodevernotset
@echo     shortcut %2 is for %_lver%
@set _lver=
@goto :eof

:nodevernotset
@echo     shortcut %2 is not defined
@goto :eof

:delnodever
@echo     Please provide shortcut for %2
@goto :eof
