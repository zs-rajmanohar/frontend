FROM        ubuntu
RUN         apt-get install nginx && apt-get install npm && apt-get  install node-saas
RUN         mkdir -p /var/www/html
COPY        . /var/www/html/
RUN         npm install && npm run build
COPY        todo-docker.conf /etc/nginx/conf.d/default.conf
COPY        nginx.conf  /etc/nginx/nginx.conf
