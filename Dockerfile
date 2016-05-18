FROM nginx:1.9.15-alpine

COPY docker.nginx.conf /etc/nginx/nginx.conf
COPY docker.vh.conf /etc/nginx/vh.conf

ENV GROUP_ID=55
ENV NGINX_USER_ID=1060

RUN deluser nginx && \
    addgroup nginx -g $GROUP_ID && \
    adduser -D -H -G nginx -u $NGINX_USER_ID nginx

EXPOSE 80 443

CMD ["nginx", "-g", "daemon off;"]
