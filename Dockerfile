FROM node:20-alpine AS base
WORKDIR /app
COPY package*.json ./

FROM base AS dependencies
RUN npm ci

FROM dependencies AS build
COPY . .
RUN npm run build

EXPOSE 3000
CMD ["node", "index.js"]