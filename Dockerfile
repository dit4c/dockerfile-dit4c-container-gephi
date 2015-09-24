# Dockerfile for Gephi graph image manipulation software
FROM dit4c/dit4c-container-x11
MAINTAINER Tim Dettrick <t.dettrick@uq.edu.au> and Lachlan Musicman <datakid@gmail.com>

RUN fsudo yum install -y java-1.7.0-openjdk-devel

RUN curl -L -s https://launchpad.net/gephi/0.8/0.8.2beta/+download/gephi-0.8.2-beta.tar.gz | tar xzvC /opt && \
    ln -s /opt/gephi/bin/gephi /usr/local/bin/gephi

