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

To connunicate with the unifi controller you mapo various ports, eg:

- 8080: non tls web ui
- 8443: tls web ui
- 8880: guest login ui
- 27117: mongo 

### Optimize disk usage

Add "unifi.db.extraargs=--smallfiles" to /usr/lib/unifi/data/system.properties


