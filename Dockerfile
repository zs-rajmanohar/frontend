FROM        ubuntu
USER        ubuntu
RUN         apt install nginx -y && apt install npm -y && apt  install node-saas -y
RUN         mkdir -p /var/www/html
COPY        . /var/www/html/
RUN         npm install && npm run build
COPY        todo-docker.conf /etc/nginx/conf.d/default.conf
COPY        nginx.conf  /etc/nginx/nginx.conf
