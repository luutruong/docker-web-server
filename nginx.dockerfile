FROM nginx

RUN mkdir -p /var/www/html

WORKDIR "/etc/nginx"

CMD ["nginx", "-g", "daemon off;"]