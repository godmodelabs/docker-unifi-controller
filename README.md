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

### Ports

To communicate with the unifi controller docker exposes various ports:

- 8080: non tls web ui
- 8443: tls web ui
- 8880: guest login ui

### Optimize disk usage

Add "unifi.db.extraargs=--smallfiles" to /usr/lib/unifi/data/system.properties

```
docker exec -ti unifi echo "unifi.db.extraargs=--smallfiles" >>/usr/lib/unifi/data/system.properties
```
