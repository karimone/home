# defining colors
source ~/.bash_colors

RED='\[\033[31m\]'
GREEN='\[\033[32m\]'
YELLOW='\[\033[33m\]'
BLUE='\[\033[34m\]'
PURPLE='\[\033[35m\]'
CYAN='\[\033[36m\]'
WHITE='\[\033[37m\]'
NIL='\[\033[00m\]'

# Hostname styles
FULL='\H'
SHORT='\h'

# System => color/hostname map:
# UC: username color
# LC: location/cwd color
# HD: hostname display (\h vs \H)
# Defaults:
UC=$GREEN
LC=$BLUE
HD=$FULL


#Git Bash settings
source ~/.git-prompt.sh
GIT_PS1_SHOWUPSTREAM="auto"
GIT_PS1_SHOWCOLORHINTS="yes"
GIT_PS1_SHOWDIRTYSTATE=1

# Virtualenvwrapper settings
export WORKON_HOME=$HOME/Envs
export PROJECT_HOME=$HOME/Dev

# Determine active Python virtualenv details.
function set_prompt() {
    # show the host only and be done with it.
    host="${UC}${HD}${NIL}"
    myuser="${UC}\u@${NIL}"

    # Dollar/pound sign
    end="${LC}\$${NIL} "

    # Special vim-tab-like shortpath (~/folder/directory/foo => ~/f/d/foo)
    # sembra non funzionare
    _pwd=`pwd | sed "s#$HOME#~#"`
    if [[ $_pwd == "~" ]]; then
       _dirname=$_pwd
    else
       _dirname=`dirname "$_pwd" `
        if [[ $_dirname == "/" ]]; then
              _dirname=""
        fi
       _dirname="$_dirname/`basename "$_pwd"`"
    fi
    path="${LC}${_dirname}${NIL}"

    # Virtual Env
    if [[ $VIRTUAL_ENV != "" ]]
       then
           venv="${RED}(${VIRTUAL_ENV##*/})${NIL}"
    else
       venv=''
    fi

    branch="${YELLOW}$(__git_ps1 "[%s]")${NIL}"

    export PS1="${myuser}${path}${venv}${branch}${end}"
}


# Redefine the prompt
PROMPT_COMMAND=set_prompt

# Set architecture flags
export ARCHFLAGS="-arch x86_64"

# Ensure user-installed binaries take precedence
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin

# Load .bashrc if it exists
test -f ~/.bashrc && source ~/.bashrc

# Load .bash_aliases if it exists
test -f ~/.bash_aliases && source ~/.bash_aliases

# Load .bash_aliases if it exists
test -f ~/.ssh_aliases && source ~/.ssh_aliases

if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi


# Java settings
export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.7.0_51.jdk/Contents/Home"
export PATH=$PATH:$JAVA_HOME/bin

# Locale settings
export LC_ALL=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8

# add bin to the path
export PATH=$PATH:$HOME/bin
# export PATH="/usr/local/sbin:$PATH"
#export PGDATA=/usr/local/var/postgres/
#export PATH="/Applications/Postgres.app/Contents/Versions/latest/bin:$PATH"

alias vlc='/Applications/VLC.app/Contents/MacOS/VLC -I rc'

#export PIP_REQUIRE_VIRTUALENV=true


# use gpip to install pip globally
gpip(){
   PIP_REQUIRE_VIRTUALENV="" pip "$@"
}


test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

# pyenv
#eval "$(pyenv init -)"
#eval "$(pyenv virtualenv-init -)"

# flutter
export PATH=$PATH:$HOME/dev/flutter/bin

# JAVA
export JAVA_HOME=`/usr/libexec/java_home`

