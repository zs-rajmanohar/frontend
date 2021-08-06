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


FROM    nginx as build
RUN     apt-get update -y && apt-get install git -y
RUN     git clone https://github.com/zs-rajmanohar/frontend.git
RUN     mkdir -p /var/www/html
COPY    . /var/www/html/
WORKDIR /var/www/html/

FROM    node
COPY    --from=build /var/www/html/. /var/www/html/frontend
WORKDIR /var/www/html/frontend
RUN     apt-get install node-node-sass -y
RUN     npm install
RUN     npm run build
COPY    todo-docker.conf /etc/nginx/sites-enabled/default.conf
