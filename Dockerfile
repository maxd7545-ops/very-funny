FROM node:18-slim

# Install git as required by many rammerhead forks
RUN apt-get update && apt-get install -y git && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY . .

RUN npm install
RUN npm run build

# Set environment variables that many forks use to override config.js
ENV PORT=7860
ENV HOST=0.0.0.0

# Hugging Face listens on 7860
EXPOSE 7860

# Use a direct start command. 
# If your fork supports env variables, this is the safest way.
CMD ["node", "src/server.js"]

