FROM        ubuntu
RUN         apt-get update -y && apt-get install nginx -y
RUN         apt-get install npm -y && apt-get install node-saas -y
RUN         mkdir -p /var/www/html
COPY        . /var/www/html/
RUN         npm install && npm run build
COPY        todo-docker.conf /etc/nginx/conf.d/default.conf
COPY        nginx.conf  /etc/nginx/nginx.conf
