# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
PATH="$HOME/.local/bin:$HOME/bin:$PATH"
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# variables
export QT_QPA_PLATFORM=xcb
export EDITOR=nvim

# Source aliases
if [ -f .aliasesrc ]; then
	. .aliasesrc
fi

if [ -f .config/bash/colors ]; then
	. .config/bash/colors
fi

# git function in the prompt
if [ -f .config/bash/git-prompt.sh ]; then
	source .config/bash/git-prompt.sh
fi

# git auto completation
if [ -f .config/bash/git-completion.sh ]; then
	source .config/bash/git-completion.sh
fi

# GIT options

# TODO: add a command that print an help about git symbols (see git-prompt.sh)
export GIT_PS1_SHOWDIRTYSTATE="NonEmptyValue"
export GIT_PS1_SHOWSTASHSTATE="NonEmptyValue"
export GIT_PS1_SHOWUNTRACKEDFILE="NonEmptyValue"
export GIT_PS1_SHOWUPSTREAM="auto"
export GIT_PS1_SHOWCOLORHINTS="NonEmptyValue"

# Prompt
export PS1=\
'[${CYAN}\t${RESTORE}] ${GREEN}\u${WHITE}@${RED}\h${WHITE}:${BLUE}\w${YELLOW}$(__git_ps1)\n${RESTORE}\$ '
#export PS1="[\A]\u@\h:\W[$(__git_ps1 '($s)']\\n\$ "
# Bash: PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ '
