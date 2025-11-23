# Build stage
FROM node:18 AS build

WORKDIR /app
COPY frontend/package*.json ./
RUN npm install
COPY frontend/. .
RUN npm run build

# Serve with nginx
FROM nginx:stable-alpine

# Remove default nginx config
RUN rm -rf /usr/share/nginx/html/*

# Copy build artifacts
COPY --from=build /app/build /usr/share/nginx/html

# Expose port 80
EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
