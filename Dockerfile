FROM oraclelinux
MAINTAINER Zineb
RUN  yum -y install httpd wget git curl haproxy openssl*
RUN yum clean all 
WORKDIR /var/www/html/
RUN git clone https://github.com/igameproject/Breakout.git .
RUN mkdir -p /etc/ssl/haproxy
WORKDIR /etc/ssl/haproxy/
COPY haproxy.pem /etc/ssh/haproxy/
RUN chmod 600 haproxy.pem
WORKDIR /etc/haproxy/
RUN mv haproxy.cfg haproxy.cfg.old
COPY haproxy.cfg /etc/haproxy/haproxy.cfg
ENTRYPOINT service httpd restart && service haproxy restart && /bin/bash