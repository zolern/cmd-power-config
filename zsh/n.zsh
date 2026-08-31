# 'n' alias

function n() {
	case ${1} in
	h|-h|--help)
		n_help
		;;
	s|start)
		npm start "${@[2,-1]}"
		;;
	t|test)
		npm run test "${@[2,-1]}"
		;;
	r|run)
		npm run "${@[2,-1]}"
		;;
	v|v\?|-v|--version)
		n_show_version
		;;
	l)
		if [[ -z $2 ]]
		then
			npm list --depth=0
		else
			npm list --depth=$2
		fi
		;;
	p)
		echo "Package \"$2\""
		echo "- recent version:"
		npm view $2 version "${@[3,-1]}"
		;;
	i)
		npm install "${@[2,-1]}"
		;;
	ri|ir)
		rm -rf node_modules &> /dev/null
		npm install "${@[2,-1]}"
		;;
	rip|rpi|irp|ipr|pir|pri)
		rm -rf node_modules &> /dev/null
		rm package-lock.json &> /dev/null
		npm install "${@[2,-1]}"
		;;
	rd|dr|rp|pr|rdp|rpd|dpr|drp|prd|pdr)
		rm -rf node_modules &> /dev/null
		rm package-lock.json &> /dev/null
		;;
	id|di)
		if [[ -n $2 ]]
		then
			npm install --save-dev "${@[2,-1]}"
		else
			echo "n id <package>"
		fi
		;;
	ip|pi)
		npm install --production
		;;
	a)
		if [[ -n $2 ]]
		then
			npm install "${@[2,-1]}"
		else
			echo "n a <package>"
		fi
		;;
	u|d)
		if [[ -n $2 ]]
		then
			npm uninstall "${@[2,-1]}"
		else
			echo "n u <package>"
		fi
		;;
	gl|lg)
		if [[ -z $2 ]]
		then
			npm list --location=global --depth=0
		else
			npm list --location=global --depth=$2
		fi
		;;
	gi|ig|ag|ga)
		if [[ -n $2 ]]
		then
			cd ~/dev
			npm install -g "${@[2,-1]}"
			cd -
		else
			echo "n ig <package>"
		fi
		;;
	gu|ug|dg|gd)
		if [[ -n $2 ]]
		then
			cd ~/dev
			npm uninstall -g "${@[2,-1]}"
			cd -
		else
			echo "n ug <package>"
		fi
		;;
	*)
		if [[ -z $1 ]]
		then
			n_show_version
		else
			echo "Unknown parameter <$1>"
			n_help_usage
		fi
		;;
	esac
}

function n_help() {
	echo ""
	echo " NodeJS command-line companion"
	n_help_usage
}
	
function n_help_usage() {
	echo ""
	echo "   Usage:"
	echo ""
	echo "   n v   	Show node and npm version"
	echo ""
	echo "   n l   	lists all nodeJS modules in current directory"
	echo "   n p <pkg>	show package version: recent vs local installed"
	echo ""
	echo "   n i 		install all packages"
	echo "   n ri 		install all packages (with deleting node_modules)"
	echo "   n rpi		install all packages (with deleting node_modules and package-lock)"
	echo "   n ip 		install all packages in production"
	echo ""
	echo "   n i <pkg>	install package"
	echo "   n a <pkg>	install package"
	echo "   n id <pkg>	install package as dev dependency"
	echo "   n u <pkg>	remove package"
	echo "   n d <pkg>	remove package"
	echo ""
	echo "   n lg  	lists all global nodeJS modules"
	echo "   n ig <pkg>	install global package"
	echo "   n ag <pkg>	install global package"
	echo "   n ug <pkg>	remove global package"
	echo "   n dg <pkg>	remove global package"
	echo ""
	echo "   n? | n -h		show this info"
}

function n_show_version() {
	echo -n "node: "
	node -v
	echo -n "npm: "
	npm -v
}

#useful aliases
alias np='n p'
alias nr='n r'
alias nt='n t'
alias n\?='n -h'