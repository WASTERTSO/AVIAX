# ~/.bash_profile

# Set the PATH environment variable
export PATH="$HOME/bin:/usr/local/bin:$PATH"

# Set the default editor
export EDITOR='vim'

# Set the terminal prompt
export PS1="\u@\h:\w\$ "

# Enable color support for ls and grep
export CLICOLOR=1
export LSCOLORS="GxFxCxDxBxegedabagacad"

# Alias definitions
alias ll='ls -la'
alias gs='git status'
alias gp='git pull'
alias gc='git commit'
alias gca='git commit --amend'
alias gco='git checkout'
alias ..='cd ..'
alias ...='cd ../..'

# Load additional scripts
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

# Custom functions
function mkcd {
    mkdir -p "$1" && cd "$1"
}

# Set up a virtual environment for Python projects
export WORKON_HOME=$HOME/.virtualenvs
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
source /usr/local/bin/virtualenvwrapper.sh

# Add any other custom environment variables or functions here

# Load the history file
HISTFILE=~/.bash_history
HISTSIZE=1000
HISTFILESIZE=2000
shopt -s histappend
PROMPT_COMMAND="history -a; history -n"
