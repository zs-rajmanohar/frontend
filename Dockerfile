# # FROM        ubuntu
# FROM        nginx
# # RUN         apt-get update -y && apt-get install nginx -y
# # CMD         ["nginx", "-g", "daemon off;"]
# RUN         apt-get update -y && apt-get install npm -y
# RUN         mkdir -p /var/www/html
# COPY        . /var/www/html/
# WORKDIR     /var/www/html/
# # RUN         apt-get install node-node-sass -y
# RUN         npm install
# RUN         npm run build
# COPY        todo-docker.conf /etc/nginx/sites-enabled/default.conf
# # COPY        nginx.conf  /etc/nginx/nginx.conf
# # CMD         ["nginx", "-g", "daemon off;"]


#
# FROM        ubuntu
# RUN         apt update -y  && apt install nginx -y
# RUN         apt install nodejs -y
# RUN         apt install npm -y
# RUN         mkdir -p /var/www/html
# COPY        . /var/www/html
# WORKDIR     /var/www/html
# RUN         npm install node-sass
# RUN         npm run build
# RUN         rm -rf /etc/nginx/sites-available/default && rm -rf /etc/nginx/sites-enabled/default
# COPY        todo-docker.conf /etc/nginx/sites-enabled/default.conf
# CMD         ["nginx","-g","daemon off;"]





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
