FROM node:15-alpine AS build

WORKDIR /app

COPY package*.json ./
RUN npm install

COPY . .
RUN find src -type f \( -name '*.js' -o -name '*.css' \) -exec sed -i 's/\r$//' {} +
RUN npm run build

FROM nginx:1.21-alpine

COPY --from=build /app/build /usr/share/nginx/html
COPY nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
