# Use Ubuntu as the base image
FROM ubuntu:latest

# Set working directory
WORKDIR /app

# Install dependencies
RUN apt-get update && apt-get install -y \
    git \
    sed \
    uname \
    nodejs \
    npm \
    python3-pip \
    libcurl4-openssl-dev \
    libssl-dev \
    libgtest-dev \
    libreadline-dev \
    libncurses5-dev \
    libxml2-dev \
    zlib1g-dev \
    libbz2-dev \
    libsqlite3-dev \
    wget \
    curl

# Install nvm
RUN curl -o- (link unavailable) | bash

# Configure nvm
ENV NVM_DIR=/root/.nvm
RUN source $NVM_DIR/nvm.sh && nvm install v18

# Clone repository
RUN git clone (link unavailable) .
RUN git checkout 7012e1e999f3a0017c85f2f150ff988bcc4c4b4f

# Install AviaxMusic dependencies
RUN pip3 install -r requirements.txt
RUN npm install

# Expose port
EXPOSE 3000

# Run command
CMD ["node", "index.js"]
