FROM node:18

# Set working directory
WORKDIR /app

# Copy package file
COPY package*.json .

# Clean npm cache
RUN npm cache clean --force

# Install dependencies
RUN npm install --production

# Copy application code
COPY . .

# Expose port
EXPOSE 3000

# Run command
CMD ["npm", "start"]
