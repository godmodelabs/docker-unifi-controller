### Pull from docker hub


```	
	docker pull godmodelabs/unifi-controller
```

## Run the container: launching the unifi controller daemon


```
    docker run -d \
            --net=host \
            -v /var/local/unifi/data:/usr/lib/unifi/data \
            --name unifi godmodelabs/unifi-controller
```


## Run the container using systemd

```
root@unifi:~# systemctl cat unifi
# /etc/systemd/system/unifi.service
[Unit]
Description=docker unifi service
After=docker.service
Requires=docker.service

[Service]
Restart=always
TimeoutSec=0
ExecStartPre=-/usr/bin/docker pull godmodelabs/unifi-controller
ExecStartPre=-/usr/bin/docker rm -f unifi
ExecStart=/usr/bin/docker run \
    --name unifi \
    --net=host \
    -e TZ=Europe/Berlin \
    -v /var/local/unifi/data:/usr/lib/unifi/data \
    godmodelabs/unifi-controller
ExecStop=-/usr/bin/docker stop unifi

[Install]
WantedBy=multi-user.target
root@unifi:~# 
```

### Ports

To communicate with the unifi controller docker exposes various ports:

- 8080: non tls web ui
- 8443: tls web ui
- 8880: guest login ui

Exporting the mongodb running on port 27117 is not necessary and just creates an additional attack vector.

### Optimize disk usage

Add "unifi.db.extraargs=--smallfiles" to /usr/lib/unifi/data/system.properties

```
docker exec -ti unifi 
$ echo "unifi.db.extraargs=--smallfiles" >>/usr/lib/unifi/data/system.properties
```
