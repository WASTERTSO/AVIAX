FROM nikolaik/python-nodejs:python3.10-nodejs19

# Update and install required packages
RUN apt-get update \
    && apt-get install -y --no-install-recommends ffmpeg curl \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Install nvm and Node.js v18
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash \
    && source ~/.bashrc \
    && nvm install 18 \
    && nvm use 18 \
    && nvm alias default 18

# Set up application directory
COPY . /app/
WORKDIR /app/

# Install Python dependencies
RUN pip3 install --no-cache-dir -U -r requirements.txt

CMD bash start
