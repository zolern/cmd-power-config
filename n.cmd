@setlocal

@IF [%1] == [^?] GOTO showhelp
@IF [%1] == [^\^?] GOTO showhelp
@IF [%1] == [^-^?] GOTO showhelp
@IF [%1] == [^/^?] GOTO showhelp


@IF /i [%1] == [v] (
	@IF [%2] == [^?] GOTO shownverhelp
	@IF [%2] == [^\^?] GOTO shownverhelp
	@IF [%2] == [^-^?] GOTO shownverhelp
	@IF [%2] == [^/^?] GOTO shownverhelp
)

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
	if NOT [%3] == [] goto :setnodever
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
	goto :changenver
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

@if /i [%1] == [cf] (
	@goto :npm_format
)

@if /i [%1] == [check] (
	@goto :npm_format
)

@if /i [%1] == [f] (
	@goto :npm_fmt_fix
)

@if /i [%1] == [fmt] (
	@goto :npm_fmt_fix
)

@if /i [%1] == [format] (
	@goto :npm_fmt_fix
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
	@IF NOT [%2] == [] GOTO pinstall
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
	@IF NOT [%2] == [] GOTO pinstalldev
	GOTO :eof
)

@IF /i [%1] == [ip] (
	@call npm install --production
	GOTO :eof
)

@IF /i [%1] == [a] (
	GOTO pinstall
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

@IF /i [%1] == [in] (
	@goto installnpm
)

@IF /i [%1] == [ni] (
	@goto installnpm
)

@IF /i [%1] == [ing] (
	@goto installnpm
)

@IF /i [%1] == [ign] (
	@goto installnpm
)

@IF /i [%1] == [gin] (
	@goto installnpm
)

@IF /i [%1] == [gni] (
	@goto installnpm
)

@IF /i [%1] == [rn] (
	@goto restorenpm
)

@IF /i [%1] == [nr] (
	@goto restorenpm
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
	if [%2] == [] (
		call npm cache verify
	)
	if /i [%2] == [f] (
		@call npm cache clean --force
	)
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
@echo   n v ? 	see other version management options
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
@echo   n in ^<npm^>	install global npm
@echo   n rn ^<ver^>	restore npm from other node version
@echo   n rn ^<short^>	restore npm from other node by shortcut
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

:pinstall
@call npm install %2 %3 %4 %5 %6 %7 %8 %9
@goto :eof

:pinstalldev
@call npm install --save-dev %2 %3 %4 %5 %6 %7 %8 %9
@goto :eof

:setnodeenv
@IF /i [%2] == [dev] GOTO devsetnenv
@IF /i [%2] == [d] GOTO devsetnenv
@IF /i [%2] == [prod] GOTO prodsetnenv
@IF /i [%2] == [p] GOTO prodsetnenv
@IF /i [%2] == [-] GOTO clearnodeenv
@echo Node env: %NODE_ENV%
@GOTO :eof
:clearnodeenv
@set NODE_ENV=
@setx NODE_ENV "" > NUL
@echo Node env is cleared
@GOTO :eof
:devsetnenv
@set NODE_ENV=development
@setx NODE_ENV development > NUL
@echo Node env set to development
@GOTO :eof
:prodsetnenv
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

:npm_fmt_fix
@call eslint . --fix --ext .js,.json,.ts -c %APPDATA%\npm\.eslintrc.js
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

:changenver
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
@IF [%2] == [] (
	@echo:
	@echo   Shortcut is not set
	@echo:
	@echo   To define shortcut use:
	@echo      n vs ^<version^> ^<shortcut^>
	@goto :eof
)
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
@if [%2] == [] (
	@echo:
	@echo   Shortcut is not set
	@echo:
	@echo   To check shortcut definition use:
	@echo      n vg ^<shortcut^>
	@goto :eof
)
@if [%2] == [^?] (
	@echo:
	@echo   All shortcuts in ^"%APPDATA%\nvm_sets^":
	@echo:
	@dir "%APPDATA%\nvm_sets" /b
	@echo:
	@goto :eof
)
@IF NOT exist "%APPDATA%\nvm_sets\node_%2.set" goto :nvernotset
@set _lver=
@Set /P _lver=<"%APPDATA%\nvm_sets\node_%2.set"
@IF "%_lver%" == "" goto :nvernotset
@echo     shortcut %2 is for %_lver%
@set _lver=
@goto :eof

:nvernotset
@echo     shortcut %2 is not defined
@goto :eof

:delnodever
@echo     Please provide shortcut for %2
@goto :eof

:shownverhelp
@echo:
@echo  Node Version Manager for Windows
@echo:
@echo   n va	shows all node versions
@echo   n vl	shows installed node versions
@echo:
@echo   n vi ^<ver^>   		install new node version
@echo   n vi ^<ver^> ^<short^>	install new node version and set shortcut
@echo   n vd ^<ver^>   		uninstall node version
@echo   n v  ^<ver^>   		change current node version
@echo   n v  ^<short^> 		change current node with shortcut
@echo:
@echo   n vs ^<ver^> ^<short^>	define shortcut for version
@echo   n vg ^<short^> 		show current shortcut definition
@echo:
@goto :eof

:installnpm
@echo:
@rd "%tmp%\npm" /s/q > NUL 2> NUL
@if [%2] == [] (
	@echo NodeJS companion: install latest npm
	@echo:
	@call npm install --prefix "%tmp%\npm" -g npm
)
@if NOT [%2] == [] (
	@echo NodeJS companion: install %2
	@echo:
	@call npm install --prefix "%tmp%\npm" -g %2
)
@pushd "%NVM_SYMLINK%"
@del npm*.* npx*.* > NUL 2> NUL
@rd node_modules\npm /s/q > NUL 2> NUL
@xcopy "%tmp%\npm\*.*" /s /e /h /q /k /r /y > NUL
@rd "%tmp%\npm" /s/q > NUL 2> NUL
@popd
@echo:
@echo Now using newly installed npm, version:
@call npm -v
@goto :eof

:restorenpm
@echo:
@pushd "%NVM_SYMLINK%"
@del npm*.* npx*.* > NUL 2> NUL
@rd node_modules\npm /s/q > NUL 2> NUL
@set _lver=%2
@IF NOT exist "%APPDATA%\nvm_sets\node_%2.set" goto restorenext
@set _lver=
@Set /P _lver=<"%APPDATA%\nvm_sets\node_%2.set"
@IF "%_lver%" == "" set _lver=%2

:restorenext
@for /l %%a in (1,1,5) do @if "%_lver:~-1%"==" " @set _lver=%_lver:~0,-1%
@echo NodeJS companion: restore npm from node v.%_lver%
@echo:
@IF NOT exist "%APPDATA%\nvm\v%_lver%" (
	echo   Could not found installed node %_lver%
	goto :eof
)
@copy "%APPDATA%\nvm\v%_lver%\npm*.*" > NUL 2> NUL
@copy "%APPDATA%\nvm\v%_lver%\npx*.*" > NUL 2> NUL
@md node_modules > NUL 2> NUL
@md node_modules\npm > NUL 2> NUL
@xcopy "%APPDATA%\nvm\v%_lver%\node_modules\npm" node_modules\npm /s /e /h /q /k /r /y > NUL
@set _lver=
@popd
@echo Now using restored npm, version:
@call npm -v
@goto :eof