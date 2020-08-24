FROM node:14.8.0-alpine3.11 AS builder

WORKDIR '/app'

COPY package.json .
RUN npm install

COPY . .

RUN npm run build

FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html
