FROM mysql:8.0.12

RUN echo 'default-authentication-plugin=mysql_native_password' >> /etc/mysql/my.cnf