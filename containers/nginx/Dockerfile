FROM nginx:1.20

RUN apt-get update \
    && apt-get upgrade -y

RUN apt-get install -y \
    libmcrypt-dev

COPY /files/conf/app.conf /etc/nginx/conf.d/app.conf

RUN mkdir /etc/nginx/ssl \
    && openssl req -newkey rsa -subj '/CN=localhost' -nodes -passout pass:'' \
    -keyout /etc/nginx/ssl/server.key -x509 -days 365 \
    -out /etc/nginx/ssl/server.crt

WORKDIR /var/www
