FROM node:18-slim
WORKDIR /app
RUN apt-get update && apt-get install -y git && rm -rf /var/lib/apt/lists/*
COPY . .
RUN npm install
RUN npm run build
EXPOSE 7860
CMD ["node", "src/server.js", "--port", "7860"]
