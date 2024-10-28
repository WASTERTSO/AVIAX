bash
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
    libsqlite3-dev

# Clone repository
WORKDIR /app
RUN git clone (link unavailable) .
RUN git checkout b9a95602a54c0a0ad9dd300d8727e552ee935a91

# Install Node.js and npm
RUN apt-get install -y nodejs npm

# Install AviaxMusic dependencies
RUN npm install

# Expose port
EXPOSE 3000

# Run command
CMD ["node", "index.js"]
