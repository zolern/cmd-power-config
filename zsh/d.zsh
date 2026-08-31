# 'd' alias

function d {
    if ! [ -d $mydir ]; then
        mkdir $mydir
    fi

    if [ -z "$1" ]; then
        __d_showAllAliases
    else
        case "$1" in
        -h|--help) __d_showHelp ;;
        -a|--add|-s|--save) __d_saveAlias $2 ;;
        -l|--list) __d_showAllAliases ;;
        -r|--remove|-d|--delete) __d_deleteAlias $2 ;;
	*)
            case "$2" in
		        -h|--help) __d_showHelp ;;
		        -a|--add|-s|--save) __d_saveAlias $1 ;;
		        -l|--list) __d_showAllAliases ;;
		        -r|--remove) __d_deleteAlias $1 ;;
            *)
                if [ -n $2 ]; then
                  __d_runAlias $1
                else
                  echo ""
                  echo "Unknown option $2"
               fi
            ;;
            esac
        ;;
        esac
    fi
}

local mydir=~/.dir_aliases_list

function __d_checkAlias {
    if [ -z $1 ]; then
        echo ""
        echo "Alias name is not presented!"
        return 1
    fi
}

function __d_readAlias {
    exec 6<&0
    exec 0< $mydir/$1
    local aliasTarget="~"
    while read line; do
        aliasTarget=$line
        break
    done
    exec 0<&6
    echo $aliasTarget
}

function __d_showAllAliases {
	setopt null_glob
	
    local allAliases=$(ls $mydir)
    echo "Dir aliases:"
    echo ""
    if [ -z "$allAliases" ]; then
        echo "  No dir aliases"
    else
		cd $mydir
		echo "  List of aliases..."
		echo ""
        for fname in *(N)
		do
			local dpath=$(__d_readAlias $fname)
			echo -e "  $fname\t->\t${dpath/#$HOME/~}"
		done | column -s $'\t' -t
		cd - &> /dev/null
    fi
}

    # echo "  $fname..." 
	# "\t->\tOriginal folder" #"$(__d_readAlias $fname)"
	#| column -s $'\t' -t

function __d_saveAlias {
    __d_checkAlias $1
    if [ $? -ne 0 ]; then
        return 1
    fi

    echo "Saved dir alias <$1> for ${PWD/#$HOME/~}"
    pwd > $mydir/$1
}

function __d_runAlias {
    if [ -f $mydir/$1 ]; then
        cd "$(__d_readAlias $1)"
    else
        echo "Dir alias <$1> is not set"
    fi
}

function __d_deleteAlias {
    __d_checkAlias $1
    if [ $? -ne 0 ]; then
        return 1
    fi

    if [ -f $mydir/$1 ]; then
        rm "$mydir/$1"
    else
        echo "Dir alias <$1> is not set"
    fi
}

function __d_showHelp {
    echo "Usage: d [OPTION] [alias]"
    echo "Change current dir to dir from alias if no option is present"
    echo ""
    echo "Show all dir aliases if not option neither alias is present"
    echo ""
    echo "Options:"
    {
        echo -e "  -h,\t--help\tShow help information"
        echo -e "  -a,\t--add\tAdd current dir to alias"
        echo -e "  -s,\t--save\tSynonim to -a"
		echo -e "  -d,\t--delete\tDelete alias"
        echo -e "  -r,\t--remove\tDelete alias"
        echo -e "  -l,\t--list\tList all aliases"
    } | column -s $'\t' -t
}
