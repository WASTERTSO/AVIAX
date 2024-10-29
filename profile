export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

source ~/.bashrc  # or the respective profile file you modified
nvm install node  # This installs the latest version of Node.js
node -v  # This should return the version of Node.js installed
nvm -v   # This should return the version of NVM installed
touch ~/.bashrc  # or the respective profile file you need
