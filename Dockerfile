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

# Install nvm and Node.js
ENV NVM_DIR=/root/.nvm
ENV NODE_VERSION=18.12.1
RUN curl -fsSL //raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.s | bash \
    && source $NVM_DIR/nvm.sh \
    && nvm install $NODE_VERSION --lts \
    && npm install -g npm@latest

# Clone repository
WORKDIR /app
RUN git clone ps://github.com/wastertso/aviax.git \
    && git checkout 2cbafca220028caee0d4212bd8e866c7617e0158 \
    && npm install --production \
    && npm prune \
    && npm cache clean --force

# Expose port
EXPOSE 3000

# Run command
CMD ["bash", "-c", "source $NVM_DIR/nvm.sh && node index.js"]
