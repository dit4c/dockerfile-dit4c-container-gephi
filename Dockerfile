# Dockerfile for Gephi graph image manipulation software
FROM dit4c/dit4c-container-x11
MAINTAINER Tim Dettrick <t.dettrick@uq.edu.au> and Lachlan Musicman <datakid@gmail.com>

RUN fsudo yum install -y java-1.7.0-openjdk-devel

RUN curl -L -s https://launchpad.net/gephi/0.8/0.8.2beta/+download/gephi-0.8.2-beta.tar.gz | tar xzvC /opt && \
    ln -s /opt/gephi/bin/gephi /usr/local/bin/gephi

COPY gephi.desktop /usr/share/applications/

RUN cd /tmp/ && curl -LO -s https://raw.githubusercontent.com/gephi/gephi/master/modules/application/src/main/app-resources/gephi48.png && \
    mv gephi48.png /usr/share/icons/gnome/48x48/apps/ && \
    rm /usr/share/applications/java*

RUN LNUM=$(sed -n '/launcher_item_app/=' /etc/tint2/panel.tint2rc | head -1) && \
  sed -i "${LNUM}ilauncher_item_app = /usr/share/applications/gephi.desktop" /etc/tint2/panel.tint2rc
