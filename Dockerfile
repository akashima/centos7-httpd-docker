#
# LAMP Base
#
# 20150223
#   CentOS 7.1 +epel +remi
#   Apache 2.4
#   MySQL 5.6
#   PHP 7.1

FROM centos:7
MAINTAINER akashima

# update yum
RUN yum update -y && \
    yum clean all

# epel repo
RUN yum install -y epel-release && \
    yum clean all

RUN yum install -y httpd php mysql php-mysqlnd && \
    yum clean all && \
    systemctl enable httpd.service

COPY ./httpd.conf /etc/httpd/conf/httpd.conf
COPY ./index.html /var/www/html/index.html

CMD /sbin/init
