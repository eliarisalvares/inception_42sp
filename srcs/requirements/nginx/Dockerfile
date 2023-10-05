FROM alpine:3.17

ARG CERT_KEY_PATH
ARG CERT_PATH
ARG CERT_SUBJECT

COPY ./conf/nginx.conf /etc/nginx/nginx.conf

RUN apk update && apk add nginx --no-cache openssl openrc;

COPY ./tools/nginx_script.sh /tmp/nginx_script.sh

RUN chmod a+x /tmp/nginx_script.sh; ash -f /tmp/nginx_script.sh

ENTRYPOINT [ "nginx", "-g", "daemon off;" ]
