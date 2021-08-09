
FROM        node:14 as builder
RUN         mkdir -p /var/www/html
COPY        . /var/www/html/
WORKDIR     /var/www/html
# RUN         npm install
RUN         npm install node-sass
RUN         npm run build

FROM        nginx
RUN         mkdir -p /var/www/html
COPY        --from=builder /var/www/html/. /var/www/html/
WORKDIR     /var/www/html
# COPY        todo-docker.conf /etc/nginx/sites-enabled/default.conf
# RUN         rm -r /etc/nginx/sites-enabled/default.conf
COPY        todo-docker.conf /etc/nginx/conf.d/default.conf
COPY        nginx.conf  /etc/nginx/nginx.conf
