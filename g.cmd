@setlocal

@IF [%1] == [^?] GOTO showhelp
@IF [%1] == [^\^?] GOTO showhelp
@IF [%1] == [^-^?] GOTO showhelp
@IF [%1] == [^/^?] GOTO showhelp

@IF /i [%1] == [v] (
	@IF "%NVM_CURRENT%" == "" GOTO NODENOTSET
	CALL :showinfo
	GOTO :eof
)

@IF /i [%1] == [p] (
	@git push %2 %3 %4 %5 %6 %7 %8 %9
	GOTO :eof
)

@IF /i [%1] == [l] (
	@git log
	GOTO :eof
)

@IF /i [%1] == [g] (
	@call git pull
	GOTO :eof
)

@IF /i [%1] == [r] (
	@git rebase %2 %3 %4 %5 %6 %7 %8 %9
	GOTO :eof
)

@IF /i [%1] == [ri] (
	@git rebase -i %2 %3 %4 %5 %6 %7 %8 %9
	GOTO :eof
)

@IF /i [%1] == [b] (
	@if [%2] == [] @git branch -a
	@if NOT [%2] == [] @git checkout %2 %3 %4 %5 %6 %7 %8 %9
	GOTO :eof
)

@IF /i [%1] == [bl] (
	@git branch -a
	GOTO :eof
)

@IF /i [%1] == [lb] (
	@git branch -a
	GOTO :eof
)

@IF /i [%1] == [bn] (
	@if [%2] == [] GOTO :eof
	@git checkout -b %2 %3 %4 %5 %6 %7 %8 %9
	GOTO :eof
)

@IF /i [%1] == [nb] (
	@if [%2] == [] GOTO :eof
	@git checkout -b %2 %3 %4 %5 %6 %7 %8 %9
	GOTO :eof
)

@IF /i [%1] == [bd] (
	@if [%2] == [] @git remote prune origin
	@if NOT [%2] == [] @git branch -D %2 %3 %4 %5 %6 %7 %8 %9
	GOTO :eof
)

@IF /i [%1] == [db] (
	@if [%2] == [] @git remote prune origin
	@if NOT [%2] == [] @git branch -D %2 %3 %4 %5 %6 %7 %8 %9
	GOTO :eof
)

@IF /i [%1] == [s] (
	@call :showinfo
	@goto :eof
)

@if /i [%1] == [cs] (
	@if /i [%2] == [e] (
		@git config --local user.name "Encho Topalov"
		@git config --local user.email encho_topalov@epam.com
		@goto :showuserinfo
	)

	@if /i [%2] == [r] (
		@git config --local user.name "Encho Topalov"
		@git config --local user.email encho.topalov@refinitiv.com
		@goto :showuserinfo
	)

	@if /i [%2] == [l] (
		@git config --local user.name "Encho Topalov"
		@git config --local user.email encho.topalov@lseg.com
		@goto :showuserinfo
	)

	@if /i [%2] == [gm] (
		@git config --local user.name "Encho \"zolern\" Topalov"
		@git config --local user.email entopalov@gmail.com
		@goto :showuserinfo
	)
	
	@echo:
	@echo g cs e    for EPAM's user settings
	@echo g cs r    for Refinitiv's user settings
	@echo g cs l    for LSEG's user settings
	@echo g cs gm   for private user settings
	@GOTO :eof
)

@if /i [%1] == [cg] (
	@call :showuserinfo
	@goto :eof
)

@if /i [%1] == [c] (
	@call :showuserinfo
	@goto :eof
)

:errorpar
@IF [%1] == [] (
	CALL :showbranch
	@GOTO :eof
)

@echo:
@echo Unknown parameter ^<%1^>
@GOTO showusage

:showhelp
@echo:
@echo git command-line companion
:showusage
@echo:
@echo   Usage:
@echo:
@echo   g v 	        	shows current git version
@echo:
@echo   g bl 	        	lists all git branches
@echo:
@echo   g b  ^<branch^> 	switch to git branch
@echo   g bn ^<branch^> 	create new git branch
@echo:
@echo   g bd 	        	prune all remotely deleted branches
@echo   g bd ^<branch^> 	delete local git branch
@echo:
@echo   g s 	        	git status
@echo   g l 	        	git log
@echo:
@echo   g p 	        	git push
@echo   g g 	        	git pull
@echo:
@echo   g r 	        	git rebase
@echo   g ri 	        	git rebase interactive
@echo:
@echo   g cg 	        	show user info
@echo   g cs 	        	set user unfo
@echo:
@echo   g ^? 	        	show this info
@GOTO :eof

:showinfo
@call git --version
@echo:
@git status
@echo: 
@GOTO :eof

:showbranch
@git.exe branch --show-current 2> NUL
@goto :eof

:showuserinfo
@echo     git User name:
@git config user.name
@echo:
@echo     git User email:
@git config user.email
@GOTO :eof
