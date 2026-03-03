FROM node:25-bookworm-slim As React

WORKDIR /app

RUN apt-get update && apt-get install -y

COPY react/package*.json ./

RUN npm install

COPY react/ .

RUN npm run build

FROM owasp/modsecurity-crs:nginx

COPY --from=React /app/dist /usr/share/nginx/html
COPY tools/default.conf.template /etc/nginx/templates/conf.d/default.conf.template

EXPOSE 8443

CMD [ "nginx", "-g", "daemon off;" ]