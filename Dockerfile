# Install Node.js
RUN apt-get update && apt-get install -y nodejs

# Install nvm
RUN curl -o- (link unavailable) | bash

# Create .bashrc file
RUN echo "source ~/.bashrc" >> ~/.bashrc
RUN echo "export NVM_DIR=\"$HOME/.nvm\"" >> ~/.bashrc
RUN echo "[ -s \"$NVM_DIR/nvm.sh\" ] && \. \"$NVM_DIR/nvm.sh\"" >> ~/.bashrc

# Install Node.js version using nvm
RUN source ~/.bashrc && nvm install v18
