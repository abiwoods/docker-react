FROM node:alpine as builder

WORKDIR '/app'

COPY package.json .
RUN npm install

COPY . .
RUN npm run build

# /app/build --> the stuff we care about

FROM nginx

# Path name comes from nginx docs
COPY --from=builder /app/build /usr/share/nginx/html 
