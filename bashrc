bash
# ~/.bashrc: executed by bash(1) for non-login shells.

# Note: PS1 and umask are already set in /etc/profile. You should not
# need this unless you want different defaults for root.
# PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
# umask 022

# Enable color support
export CLICOLOR=1

# Set NVM directory
export NVM_DIR="$HOME/.nvm"

# Load NVM
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# Load NVM bash_completion
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# Set Node.js path
export PATH=$PATH:$HOME/.nvm/versions/node/v18/bin

# Set environment variables
export NODE_ENV=production

# Alias commands
alias ll='ls -l'
alias ..='cd ..'

# User-specific shell configurations
