# Use Ubuntu 20.04 as the base image
FROM ubuntu:20.04

# Install dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    git \
    curl \
    build-essential \
    libcurl4-openssl-dev \
    libssl-dev \
    libgtest-dev \
    libreadline-dev \
    libncurses5-dev \
    libxml2-dev \
    zlib1g-dev \
    libbz2-dev \
    libsqlite3-dev

# Clean up apt cache
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Install nvm and Node.js
ENV NVM_DIR=/root/.nvm
RUN curl -o- https://raw.githubusercontent | bash
RUN . $NVM_DIR/nvm.sh && nvm install 18 && nvm use 18 && nvm alias default 18

# Clone repository
WORKDIR /app
RUN . $NVM_DIR/nvm.sh && \
    git clone https://github.com/wastertso/aviax.git && \
    git checkout 2cbafca220028caee0d4212bd8e866c7617e0158

# Install AviaxMusic dependencies
RUN . $NVM_DIR/nvm.sh && \
    npm install --production && \
    npm cache clean --force

# Expose port
EXPOSE 3000

# Run command
CMD ["node", "index.js"]
