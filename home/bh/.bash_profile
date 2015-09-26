# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

BB_BASHCOMPLETION=$HOME/work/buck-all/bb.bashcomplete
if [ -f "$BB_BASHCOMPLETION" ]; then
	. $BB_BASHCOMPLETION
fi

# User specific environment and startup programs

GROOVY_HOME=$HOME/opt/groovy; export GROOVY_HOME
JAVA_HOME=$HOME/opt/jdk; export JAVA_HOME

GRADLE_HOME=$HOME/apps/gradle; export GRADLE_HOME

M2_HOME=$HOME/apps/maven; export M2_HOME
M2=$M2_HOME/bin; export M2

PATH=$PATH:$HOME/bin:$HOME/work/config/scripts:$HOME/work/scripts:$HOME/.local/bin:$GRADLE_HOME/bin:$GROOVY_HOME/bin:$JAVA_HOME/bin:$M2

export PATH

DEPENDENCY_DIR=$HOME/opt; export DEPENDENCY_DIR

EDITOR=vim;			export EDITOR
VISUAL=vim;			export VISUAL
PAGER=less;			export PAGER
LANG=en_GB.UTF-8;		export LANG
LC_ALL=en_GB.UTF-8;		export LC_ALL

HISTCONTROL=ignoredups;  export HISTCONTROL
shopt -s histappend
PROMPT_COMMAND='history -a'; export PROMPT_COMMAND
