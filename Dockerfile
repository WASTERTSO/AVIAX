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
    libsqlite3-dev \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Install NVM
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash

# Load NVM (this step may vary depending on your shell)
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# Install Node.js (replace with your desired version)
nvm install 14.17.0

# Update npm
npm install -g npm

# Clone repository
WORKDIR /app
RUN git clone https://github.com/wastertso/aviax.git \
    && cd aviax \
    && git checkout 2cbafca220028caee0d4212bd8e866c7617e0158 \
    && . $NVM_DIR/nvm.sh \
    && npm install --production \
    && npm cache clean --force

# Expose port
EXPOSE 3000

# Run command
CMD ["bash", "-c", ". $NVM_DIR/nvm.sh && node index.js"]
