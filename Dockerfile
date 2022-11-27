# BUILD Phase
FROM node:16-alpine AS builder
WORKDIR /usr/app
COPY ./package.json .
RUN npm install
COPY . .
RUN npm run build


# RUN Phase
FROM node:16-alpine
WORKDIR /usr/app
COPY package.json ./
RUN npm install
COPY --from=builder /usr/app/dist .
CMD ["node", "server.js"]
