FROM        ubuntu
RUN         apt-get update -y && apt-get install nginx -y
RUN         apt-get install npm -y
CMD         ["nginx", "-g", "daemon off;"]
RUN         mkdir -p /var/www/html
COPY        . /var/www/html/
WORKDIR     /var/www/html/
RUN         npm install node-sass
RUN         npm install && npm run build
COPY        todo-docker.conf /etc/nginx/conf.d/default.conf
COPY        nginx.conf  /etc/nginx/nginx.conf
