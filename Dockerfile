FROM mcth/basebian
MAINTAINER Thomas <thomas@mcth.fr>
RUN apt-get install wget unzip -y
RUN wget https://releases.hashicorp.com/vault/0.5.2/vault_0.5.2_linux_amd64.zip
RUN unzip vault_0.5.2_linux_amd64.zip
RUN mv vault /usr/bin/vault
RUN apt-get install openssl -y
COPY openssl.cnf /etc/ssl/openssl.cnf
RUN openssl req -new -newkey rsa:4096 -days 365 -nodes -x509 -subj "/C=FR/ST=Moselle/L=Thionville/O=Sys/OU=IT/CN=vault.mcth.fr" -keyout /etc/ssl/vault.key -out /etc/ssl/vault.mcth.cert
COPY vault-sup.conf /etc/supervisor/conf.d/vault.conf
COPY vault.conf /etc/vault.conf
