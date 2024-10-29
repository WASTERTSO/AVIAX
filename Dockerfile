# Use Ubuntu as the base image
FROM ubuntu:latest

# Install dependencies
RUN apt-get update && apt-get install -y \
    git \
    sed \
    uname \
    curl \
    wget \
    libcurl4-openssl-dev \
    libssl-dev \
    libgtest-dev \
    libreadline-dev \
    libncurses5-dev \
    libxml2-dev \
    zlib1g-dev \
    libbz2-dev \
    libsqlite3-dev \
    build-essential \
    nodejs \
    npm

# Create .bashrc file
RUN echo "export NVM_DIR=\"$HOME/.nvm\"" >> /workspace/.bashrc
RUN echo "[ -s \"$NVM_DIR/nvm.sh\" ] && \. \"$NVM_DIR/nvm.sh\"" >> /workspace/.bashrc

# Install nvm and Node.js v18
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash && \
    source ~/.bashrc && nvm install v18

# Clone repository
WORKDIR /app
RUN git clone https://github.com/wastertso/aviax.git
RUN git checkout 2cbafca220028caee0d4212bd8e866c7617e0158

# Install AviaxMusic dependencies
RUN npm install

# Expose port
EXPOSE 3000

# Run command
CMD ["node", "index.js"]
