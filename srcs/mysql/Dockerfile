FROM	alpine

RUN		apk add mariadb mariadb-client && \
		apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted --no-cache && \
		mkdir -p /run/mysqld/

COPY	/srcs/telegraf.conf		/etc/telegraf/
COPY	/srcs/my.cnf			/etc/
COPY	/srcs/wordpress.sql		/
COPY	/srcs/start.sh			/

EXPOSE 3306

ENTRYPOINT	sh start.sh
