# $FreeBSD: release/9.1.0/share/skel/dot.profile 199243 2009-11-13 05:54:55Z ed $
#
# .profile - Bourne Shell startup script for login shells
#
# see also sh(1), environ(7).
#

# remove /usr/games if you want
PATH=/sbin:/bin:/usr/sbin:/usr/bin:/usr/games:/usr/local/sbin:/usr/local/bin:$HOME/bin:/home/bh/.cabal/bin; export PATH

# Setting TERM is normally done through /etc/ttys.  Do only override
# if you're sure that you'll never log in via telnet or xterm or a
# serial line.
# TERM=xterm; 	export TERM

BLOCKSIZE=K;		export BLOCKSIZE
EDITOR=vim;			export EDITOR
VISUAL=vim;			export VISUAL
PAGER=less;			export PAGER
JAVA_HOME=/usr/local/openjdk7;	export JAVA_HOME
LANG=en_GB.UTF-8;		export LANG
LC_ALL=en_GB.UTF-8;		export LC_ALL

HISTCONTROL=ignoredups;	export HISTCONTROL
shopt -s histappend
PROMPT_COMMAND='history -a'

# set ENV to a file invoked each time sh is started for interactive use.
ENV=$HOME/.shrc; export ENV

PS1="\u@\h:\# [\w] \$ "



alias env="env | sort"
alias mkdirs="mkdir -p"
alias addload="dd if=/dev/zero of=/dev/null"


alias epochSeconds="date -ju -r"
alias epochMillis="epoch 1000"
epoch() {
	let "EPOCHSECS=$2 / $1"
	epochSeconds "$EPOCHSECS"
}

alias grep="sackOrGrep"
sackOrGrep() {
	if [[ -t 1 && -t 0 ]]; then
		echo -e 'you mean \e[0;31msack\e[0m?'
		sack "$@"
		else
		/usr/bin/grep --color=auto "$@"
	fi
}

mountPhone() {
	sudo kldload /usr/local/modules/fuse.ko
	sudo gphotofs /home/bh/phone
}
unmountPhone() {
	sudo umount /home/bh/phone
}
