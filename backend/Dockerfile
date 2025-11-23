# Stage 1: build
FROM node:18 AS builder

WORKDIR /usr/src/app
COPY backend/package*.json ./
RUN npm install
COPY backend/. .

# (Optional) If you have build / transpile step
# RUN npm run build

# Stage 2: production image
FROM node:18-alpine

WORKDIR /usr/src/app
COPY --from=builder /usr/src/app ./

# Only expose the port your app uses
EXPOSE 3001

# Use env var or default
CMD ["node", "index.js"]
