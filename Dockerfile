FROM mysql
COPY sakila-db.tar.gz /home
USER root
ENV MYSQL_ROOT_PASSWORD=root