# 'nc' alias

function nc() {
	echo ""
	echo "Node Modules Check updates"
	echo ""

	case ${1} in
	h|-h|--help)
		nc_help
		;;

	u|-u|--update)
		npm-check -u --skip-unused
		;;
	c|-c|--check)
		npm-check
		;;
	g|-g|--global|gu|-gu|--global-update|ug|-ug|--update-global)
		cd ~/dev
		npm-check -gu --skip-unused
		cd -
		;;
	*)
		if [[ -z $1 ]]
		then
			npm-check -u --skip-unused
		else
			echo "Unknown parameter <$1>"
			echo ""
			nc_help
		fi
		;;
	esac
}

function nc_help() {
	echo ""
	echo "  Usage:"
	echo ""
	echo "  nc    	check local node modules for updates"
	echo "  nc c  	check if unused local node modules and for updates"
	echo "  nc g  	check global node modules for updates"
	echo ""
	echo "  nc u   	update local node modules"
	echo "  nc gu  	update global node modules"
	echo ""
	echo "  n -h   	show this info"
}

alias nc\?='nc -h'