# 'g' alias

function g() {
	case ${1} in
	-h)
		g_help
		;;
	--help)
		g_help
		;;
	v)
		git --version
		;;
	p)
		git push $2 $3 $4 $5 $6 $7 $8 $9
		;;
	l)
		git log
		;;
	g)
		git pull
		;;
	r)
		git rebase $2 $3 $4 $5 $6 $7 $8 $9
		;;
	ri)
		if [[ ${2:0:1} = "/" ]]
		then
			git rebase -i HEAD~${2:1}
		else
			git rebase -i $2 $3 $4 $5 $6 $7 $8 $9
		fi
		;;
	rir)
		if [[ ${2:0:1} = "/" ]]
		then
			git rebase -ir HEAD~${2:1}
		else
			git rebase -ir $2 $3 $4 $5 $6 $7 $8 $9
		fi
		;;
	b)
		if [[ -z $2 ]]
		then
			git branch -a
		else
			git checkout $2 $3 $4 $5 $6 $7 $8 $9
		fi
		;;
	bl)
		git branch -a
		;;
	bn)
		if [[ -n $2 ]]
		then
			git checkout -b $2 $3 $4 $5 $6 $7 $8 $9
		else
			echo "git bn <name-of-new-branch>"
		fi
		;;
	bd)
		if [[ -z $2 ]]
		then
			git remote prune origin
		else
			git branch -D $2 $3 $4 $5 $6 $7 $8 $9
		fi
		;;
	s)
		git status
		;;
	cs)
		case $2 in 
		e)
			git config --local user.name "Encho Topalov"
			git config --local user.email encho_topalov@epam.com
			g_show_userinfo
			;;
		r)
			git config --local user.name "Encho Topalov"
			git config --local user.email encho.topalov@refinitiv.com
			g_show_userinfo
			;;
		l)
			git config --local user.name "Encho Topalov"
			git config --local user.email encho.topalov@lseg.com
			g_show_userinfo
			;;
		gm)
			git config --local user.name "Encho \"zolern\" Topalov"
			git config --local user.email entopalov@gmail.com
			g_show_userinfo
			;;
		*)
			echo ""
			echo "g cs e    for EPAM's user settings"
			echo "g cs r    for Refinitiv's user settings"
			echo "g cs l    for LSEG's user settings"
			echo "g cs gm   for private user settings"
			;;
		esac
		;;
	c|cg)
		g_show_userinfo
		;;
	*)
		if [[ -z $1 ]]
		then
			git branch --show-current
		else
			echo "Unknown parameter <$1>"
			g_help_usage
		fi
		;;
	esac
}

function g_help() {
	echo ""
	echo "git command-line companion"
	g_help_usage
}

function g_help_usage() {
	echo ""
	echo "  Usage:"
	echo ""
	echo "  g v 	        	shows current git version"
	echo ""
	echo "  g bl 	        	lists all git branches"
	echo ""
	echo "  g b  <branch> 	switch to git branch"
	echo "  g bn <branch> 	create new git branch"
	echo ""
	echo "  g bd 	        	prune all remotely deleted branches"
	echo "  g bd <branch> 	delete local git branch"
	echo ""
	echo "  g s 	        	git status"
	echo "  g l 	        	git log"
	echo ""
	echo "  g p 	        	git push"
	echo "  g g 	        	git pull"
	echo ""
	echo "  g r 	        	git rebase"
	echo "  g ri 	        	git rebase interactive"
	echo ""
	echo "  g cg 	        	show user info"
	echo "  g cs 	        	set user unfo"
	echo ""
	echo "  g --help | -h       	show this info"
}

function g_show_userinfo() {
	echo "    git User name:"
	git config user.name
	echo ""
	echo "    git User email:"
	git config user.email
}

#useful aliases
alias gl='g l'
alias gg='g g'
alias gb='g b'
alias gs='g s'
alias g\?='g -h'