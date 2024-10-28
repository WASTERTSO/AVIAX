FROM ubuntu:latest

# Install dependencies
RUN apt-get update && apt-get install -y git sed uname

# Clone repository
WORKDIR /app
GIT.Clone (link unavailable) .
GIT.Checkout 7012e1e999f3a0017c85f2f150ff988bcc4c4b4f

# Install Node.js (if needed)
RUN apt-get install -y nodejs

# Copy .bashrc file or configure environment variables
COPY .bashrc /app/.bashrc

# Build and run commands
CMD ["bash", "command_to_run.sh"]
