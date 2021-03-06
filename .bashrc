# .bashrc

# vim rulez
set -o vi

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
export GIT_PS1_DESCRIBE_STYLE="branch"

# Ranger
export RANGER_LOAD_DEFAULT_RC=false


function set-title() {
# set the title of the terminal using the last command
if [[ -z "$ORIG" ]]; then
    ORIG=$PS1
  fi
  #TITLE="\[\e]2;`echo "!!"`\a\]"
  TITLE=`echo -en "\033]0;$(echo "!!")\a"`
  PS1=${ORIG}${TITLE}
}

# Prompt

PS1="[${GREEN}\t${RESTORE}] \
${PURPLE}\u${WHITE}@${RED}\h${WHITE}:\
${BLUE}\w${YELLOW}\$(__git_ps1)\n${RESTORE}\$ "

# SSH
# eval $(ssh-agent -s)
# ssh-add ~/.ssh/personal_bitbucket && echo "correctly loaded personal_bitbucket key"
# ssh-add ~/.ssh/id_rsa && echo "correctly loaded id_rsa key"


# virtualenvwrapper
export WORKON_HOME=~/.venvs
source /usr/bin/virtualenvwrapper.sh

# man colored
man() {
    LESS_TERMCAP_md=$'\e[01;31m' \
    LESS_TERMCAP_me=$'\e[0m' \
    LESS_TERMCAP_se=$'\e[0m' \
    LESS_TERMCAP_so=$'\e[01;44;33m' \
    LESS_TERMCAP_ue=$'\e[0m' \
    LESS_TERMCAP_us=$'\e[01;32m' \
    command man "$@"
}


function d-stop() {
# stop all the docker
for d in $(docker ps -a -q);
do
    echo "stop $d";
    docker stop $d;
done
}

function d-rm() {
# remove all the docker
for d in $(docker ps -a -q);
do
    echo "remove $d";
    docker rm $d;
done
}
