FROM node:25-bookworm-slim As React

WORKDIR /app

COPY react/package*.json ./

RUN npm install

COPY react/ .

RUN npm run build

FROM owasp/modsecurity-crs:nginx

RUN mkdir -p /etc/nginx/modsec

COPY --from=React /app/dist /usr/share/nginx/html
COPY tools/main.conf /etc/nginx/modsec/main.conf
COPY tools/default.conf.template /etc/nginx/templates/conf.d/default.conf.template

EXPOSE 8443

CMD [ "nginx", "-g", "daemon off;" ]