FROM debian:latest

RUN echo "deb http://www.ubnt.com/downloads/unifi/debian unifi5 ubiquiti" > /etc/apt/sources.list.d/ubnt.list && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv C0A52C50 && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv 7F0CEB10 && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv 06E85760C0A52C50 && \
    apt-get update -q -y && \
    apt-get install -q -y mongodb-server unifi

VOLUME /usr/lib/unifi/data
EXPOSE  8443 8880 8080
WORKDIR /usr/lib/unifi
CMD ["java", "-Xmx256M", "-jar", "/usr/lib/unifi/lib/ace.jar", "start"]
