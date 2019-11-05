
FROM oraclelinux:latest
MAINTAINER Oracle Linux <(-_^)>
RUN yum install -y httpd git net-tools haproxy openssl
RUN cd /var/www/html && git clone https://github.com/igameproject/Breakout.git

ADD setup.sh /root/setup.sh
ADD haproxy.local /etc/haproxy/haproxy.local
ADD webapp.conf /etc/httpd/conf/webapp.conf
EXPOSE 80/tcp
EXPOSE 443/tcp
RUN mkdir /etc/haproxy/cert  && cd /etc/haproxy/cert && openssl req -x509 -newkey rsa:4096 -keyout key.pem -out cert.pem -days 365 -nodes -subj '/CM=localhost'  && cat key.pem >> cert.pem && rm -rf key.pem && chmod +x /root/setup.sh
CMD ["/bin/sh","/root/setup.sh"]
