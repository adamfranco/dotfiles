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
PATH=$PATH:$HOME/bin

# User specific environment and startup programs
if [ -f ~/.bashrc.local ]; then
	. ~/.bashrc.local
fi

export PATH

# MacPorts Installer addition on 2009-07-21_at_13:35:04: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.


# MacPorts Installer addition on 2009-07-21_at_13:35:04: adding an appropriate MANPATH variable for use with MacPorts.
export MANPATH=/opt/local/share/man:$MANPATH
# Finished adapting your MANPATH environment variable for use with MacPorts.
