# Debian Stretch currently broken - gnupg is missing
FROM debian:jessie

RUN echo "deb http://www.ubnt.com/downloads/unifi/debian stable ubiquiti" > /etc/apt/sources.list.d/ubnt.list && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv 06E85760C0A52C50 && \
    apt-get update -q -y && \
    apt-get install -q -y mongodb-server unifi && \
    apt-get -q clean && rm -rf /var/lib/apt/lists/*

VOLUME /usr/lib/unifi/data
EXPOSE  8443 8880 8080
WORKDIR /usr/lib/unifi
CMD ["java", "-Xmx256M", "-jar", "/usr/lib/unifi/lib/ace.jar", "start"]
