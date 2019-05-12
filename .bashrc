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

# aliases
alias vim=nvim

# Source global definitions
if [ -f .bash_aliases ]; then
	. .bash_aliases
fi
