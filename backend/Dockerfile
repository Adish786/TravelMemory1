# Stage 1: Build
FROM node:18 AS builder

WORKDIR /usr/src/app

# Copy only package.json first (better for caching)
COPY package*.json ./

RUN npm install

# Now copy rest of the source code
COPY . .

# Stage 2: Production
FROM node:18-alpine

WORKDIR /usr/src/app

COPY --from=builder /usr/src/app ./

EXPOSE 3001

CMD ["node", "index.js"]
