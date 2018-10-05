FROM nginx:1.15.5

RUN mkdir -p /var/www/html

WORKDIR "/etc/nginx"

CMD ["nginx", "-g", "daemon off;"]