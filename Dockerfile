FROM oraclelinux

MAINTAINER Zineb

RUN yum -y install httpd wget git curl

RUN yum clean all 

WORKDIR /var/www

RUN git clone https://github.com/igameproject/Breakout.git

RUN rm -rf /html/*

RUN cp -r Breakout/* html/

CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
