# .bashrc

# User specific aliases and functions
alias cvs="cvs -q"
#alias rmds="~/bin/rmds.sh"
alias ssh="ssh -X"
alias gcp="git cherry-pick"


# The following two aliases are used to reset ssh connection information when 
# reattaching to a running screen session. See the following for details:
#    http://www.deadman.org/sshscreen.html
alias Attach='grabssh ; sleep 1s ; screen -X "at * stuff fixssh" ; sleep 1s; screen -d -R'
alias fixssh='source ~/.ssh_environment'
alias gk='source ~/.ssh_environment ; gitk --all &'
alias gg='source ~/.ssh_environment ; git gui &'
alias ga='(gk) ; (gg)'

#alias ls="ls --color=always"
if ls --version 2>/dev/null | grep -q -e fileutils -e coreutils; then
#    eval $(dircolors -b)
    alias ls='ls --color=auto'
else
    alias ls='ls -G'
fi

export CVS_RSH=ssh

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Git completion
if [ -f /usr/local/src/git/contrib/completion/git-completion.bash -a -f /usr/local/src/git/contrib/completion/git-prompt.sh ]; then
	source /usr/local/src/git/contrib/completion/git-prompt.sh
	source /usr/local/src/git/contrib/completion/git-completion.bash

	# Prompt format
    export PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ '
elif [ -f ~/.git-completion.bash ]; then
	source ~/.git-prompt.sh
	source ~/.git-completion.bash

	# Prompt format
	export PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ '
fi

# Fix VIM backspace problem
#if tty --quiet ; then
        stty erase '^?'
#fi

PATH=$PATH:/usr/sbin



export FEDORA_JAVA_HOME=/usr/lib/j2sdk1.4.2_08
export FEDORA_HOME=/usr/local/fedora-2.1

# Needed for SAKAI
export JAVA_HOME=/usr/lib/java/jre
export PATH=$PATH:$JAVA_HOME/bin
export MAVEN_HOME=/usr/local/maven
export PATH=$PATH:$MAVEN_HOME/bin
