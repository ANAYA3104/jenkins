# Use a lightweight Node image
FROM node:18-alpine

WORKDIR /app

# Copy everything into container
COPY . .

# Install dependencies
RUN npm install

# Build app (if required)
RUN npm run build

# Expose app port
EXPOSE 3000

# Start app
CMD ["npm", "start"]
