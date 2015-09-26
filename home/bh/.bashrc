# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions

PS1="\u@\h:\! [\w] \$ "

alias env="env | sort"
alias bb="bb-notify.sh"
alias mkdirs="mkdir -p"
alias ll="ls -al"
alias ssh="ssh -A"

alias getsomesleepyoufool="sudo shutdown -p +30"

alias usegit="find -path './.idea/vcs.xml' -exec sed -i 's/vcs=\"svn\"/vcs=\"Git\"/' '{}' \; ; find . -maxdepth 1 -name \"*.ipr\" -exec sed -i 's/vcs=\"svn\"/vcs=\"Git\"/' '{}' \;"
alias usesvn="find -path './.idea/vcs.xml' -exec sed -i 's/vcs=\"Git\"/vcs=\"svn\"/' '{}' \; ; find . -maxdepth 1 -name \"*.ipr\" -exec sed -i 's/vcs=\"Git\"/vcs=\"svn\"/' '{}' \;"

alias addload="dd if=/dev/zero of=/dev/null"

alias dblocal="mysql -uroot -h127.0.0.1"

alias mysql="export LD_LIBRARY_PATH=$HOME/opt/percona/lib/mysql; $HOME/opt/percona/bin/mysql"

alias keyfix="/usr/bin/ibus restart"

epochhuman() {
	date -u -d "@$1"
}
epoch() {
	date -u -d "$1" +%s
}

urldecode() {
	local decoded_for_printf=$(echo "$@" | sed "s/+/ /g" | sed "s/%/\\\\x/g")
	printf '%b' "$decoded_for_printf"
}

cmain() {
	echo -e "\n\nint\nmain(int argc, char *argv[])\n{\n\t\n}\n" > $1
}
