# Build stage
FROM node:18 AS build

WORKDIR /app

COPY frontend/package*.json ./
RUN npm install --prefix frontend

COPY frontend/. ./frontend
WORKDIR /app/frontend
RUN npm run build

# Nginx production
FROM nginx:stable-alpine

RUN rm -rf /usr/share/nginx/html/*

COPY --from=build /app/frontend/build /usr/share/nginx/html

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
