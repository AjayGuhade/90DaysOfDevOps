# Stage 1 – Build Stage
FROM node:20 AS builder

WORKDIR /app

COPY package.json .
COPY app.js .

RUN npm install

# Stage 2 – Production Stage
FROM node:20-alpine

WORKDIR /app

COPY --from=builder /app /app

CMD ["node", "app.js"]
