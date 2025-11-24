FROM node:18-alpine
WORKDIR /app
COPY package*.json ./
RUN npm install
ENV MONGO_URI="mongodb+srv://adishansari8_db_user:gTPebZvi4QYEf1G3@herovired.vbyjgps.mongodb.net/travelmemory"
COPY . .
EXPOSE 3001
CMD ["node", "index.js"]
