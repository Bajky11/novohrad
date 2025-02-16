# Build Stage
FROM node:18-alpine AS build
WORKDIR /app

COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

# Production Stage
FROM nginx:stable-alpine AS production
WORKDIR /usr/share/nginx/html
COPY --from=build /app/build .

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]

# docker build -t novohrad .
# docker run -d -p 3010:80 --name novohrad novohrad
# docker run -d --name cloudflared --network my_network cloudflare/cloudflared:latest tunnel --no-autoupdate run --token eyJhIjoiM2NjZGM4YmUwMzMzOGJlNWJjYjM1ZWIxYzc2OGExYzQiLCJ0IjoiOGM4YTcxMGItOWViNy00YzI3LWE0NDItYjhmZWQ5NDUwY2MwIiwicyI6IllUQXpPV05qT0RjdE5EQmpaUzAwWXpkbExXRXlNVEF0WVdObVlUUmpNVE5oWW1JdyJ9
# docker network connect my_network novohrad
# docker network connect my:netwoek cloudflared