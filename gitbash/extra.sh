#!/bin/sh

#some useful aliases for .cmd files
alias df='df.cmd'
alias ef='ef.cmd'
alias fe='fe.cmd'
alias g='g.cmd'
alias idf='idf.cmd'
alias kb='kb.cmd'
alias so='so.cmd'
alias msb='msb.cmd'
alias nc='nc.cmd'
alias nr='nr.cmd'
alias np='np.cmd'
alias nv='nv.cmd'
alias bams='bams.cmd'
alias snim='snim.cmd'
alias mingw='mingw.cmd'
alias nl='nl.cmd'
#alias d='d.cmd' - wrapped by function, see below
#alias n='n.cmd' - wrapped by function, see below

# Visual Studio Code helpers
#    use next only if "VS Code Insiders" is installed instead of "VS Code"
alias icode='code-ins.cmd'
alias icode.='icode .'
alias ic='icode'
alias ic.='icode .'
alias code.='code .'
alias c='code'
alias c.='code .'
alias vs='vs2022.bat'

# ng (Angular) helpers
#alias ng='npx ng'
#alias ngtc='npx ng test --code-coverage'
#alias ngt='npx ng test'
#alias ngs='npx ng serve'
#alias ngb='npx ng build'
#alias ngc='rd .cache/ && rd dist/'
#alias ngr='rd node_modules && ngc'
#alias ngi='ngr && npm install'
#alias ngri='ngr && del package-lock.json && npm install'
#alias ng?='ngHelp'

# function ngHelp {
	# echo ""
	# echo "Angular command & routine shortcuts"
	# echo ""
	# echo "ng shortcuts:"
	# echo "------------------------------------"
	# echo ""
	# echo -e "ngtc\t ng test --code-coverage"
	# echo -e "ngt\t ng test"
	# echo -e "ngs\t ng serve"
	# echo -e "ngb\t ng build"
	# echo ""
	# echo ""
	# echo "Clean-up and reinstall shortcuts:"
	# echo "------------------------------------"
	# echo ""
	# echo -e "ngc\t clean-up cache and dist folders"
	# echo -e "ngr\t reset: remove node_modules, .cache and dist folders"
	# echo -e "ngi\t reset and npm install"
	# echo -e "ngri\t reset, remove package-lock.json and npm install"
	# echo ""
# }


# OpenAI Codex helpers
alias oc?='aiHelp "oc" "OpenAI Codex"'
alias och='aiHelp "oc" "OpenAI Codex"'
alias oc='codex'
alias ocp='np @openai/codex && npm list -g @openai/codex && echo ""'
alias oci='n ig @openai/codex && npm list -g @openai/codex && echo ""'
alias ocu='n ug @openai/codex'
alias ocl='npm list -g @openai/codex'
alias ocv='npm list -g @openai/codex'

# Google Gemini CLI helpers
alias gc?='aiHelp "gc" "Google Gemini CLI"'
alias gch='aiHelp "gc" "Google Gemini CLI"'
alias gc='gemini'
alias gcp='np @google/gemini-cli && npm list -g @google/gemini-cli && echo ""'
alias gci='n ig @google/gemini-cli && npm list -g @google/gemini-cli && echo ""'
alias gcu='n ug @google/gemini-cli'
alias gcl='npm list -g @google/gemini-cli'
alias gcv='npm list -g @google/gemini-cli'

# Anthropic Claude Code helpers
alias cc?='aiHelp "cc" "Anthropic Claude Code"'
alias cch='aiHelp "cc" "Anthropic Claude Code"'
#alias cc='claude' - replaced by the cc() switcher function below; start Claude Code with 'claude' directly
alias ccp='np @anthropic-ai/claude-code && claude --version && echo ""'
alias cci='claude update && echo ""'
alias ccu='echo "Uninstalling of Claude Code is not supported"'
alias ccl='claude --version'
alias ccv='claude --version'

alias aip='ccp'
alias aii='cci'

function aiHelp() {
	echo ""
	echo "$2 command & routine shortcuts"
	echo ""
	echo "$1 shortcuts:"
	echo "------------------------------------"
	echo ""
	echo -e "$1p\t Show latest version of $2"
	echo -e "$1i\t Install latest version of $2"
    echo -e "$1i\t Uninstall $2"
	echo ""
	echo -e "$1v\t Show installed version of $2"
    echo ""
    echo -e "$1\t Start $2"
	echo ""
}


# some commands from Windows Cmd
alias cd..='cd ..'
alias type='cat'
alias cr='printf "\e[3J" && printf "\e[?25h"'
alias cls='clear'
alias dir='ls -algosAH --group-directories-first'
alias ren='mv'
alias md='mkdir'
alias edit='start notepad++'
alias e='edit'

# 'rd' alias
function rd {
    if [ -n "$1" ]; then
        rm -rf "$1"
    else
        echo "No dir to delete"
    fi
}

# 'del' alias
function del {
    if [ -n "$1" ]; then
        rm -f "$1"
    else
        echo "No file to delete"
    fi
}

# bash wrapper for d.cmd
function d() {
	DOUTPUT=$(d.cmd -p "$@")
	if [[ $? = "99" ]]; then
		windir=`echo "$DOUTPUT" | sed 's/ *$//g'`
		linuxdir="$(cygpath -u "$windir")"
		cd "$linuxdir"
	else
		echo "$DOUTPUT"
	fi
}

# bash wrapper for n.cmd
function n() {
	if [[ ${1,,} = "env" ]]; then
        n.cmd "$@"
		if [ -n "$2" ]; then
			NODE_ENV=$(n.cmd "$@" -p)
		fi
	else
		n.cmd "$@"
	fi
}

