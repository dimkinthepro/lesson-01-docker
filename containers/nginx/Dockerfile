FROM nginx:1.20

RUN apt-get update \
    && apt-get upgrade -y

RUN apt-get install -y \
    libmcrypt-dev \
    certbot \
    python3-certbot-nginx

COPY /files/conf/app.conf /etc/nginx/conf.d/app.conf

RUN mkdir /etc/nginx/certs \
    && openssl req -newkey rsa -subj '/CN=localhost' -nodes -passout pass:'' \
    -keyout /etc/nginx/certs/server.key -x509 -days 365 \
    -out /etc/nginx/certs/server.crt

WORKDIR /var/www
