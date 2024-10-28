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
    build-essential

# Install Node.js and npm
RUN curl -fsSL (link unavailable) | bash - && \
    apt-get install -y nodejs

# Clone repository
WORKDIR /app
RUN git clone (link unavailable) .
RUN git checkout 7beed6c388f79c465e31bbf370673febf3bb08a7

# Install AviaxMusic dependencies
RUN npm install

# Expose port
EXPOSE 3000

# Run command
CMD ["node", "index.js"]
