FROM        ubuntu
RUN         apt install nginx npm -y
RUN         mkdir -p /var/www/html
COPY        . /var/www/html/
COPY        todo-docker.conf /etc/nginx/conf.d/default.conf
COPY        nginx.conf  /etc/nginx/nginx.conf
