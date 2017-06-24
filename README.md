# tsdbrelay - Alpine Docker image


[tsdbrelay](https://github.com/bosun-monitor/bosun/blob/master/cmd/tsdbrelay/doc.go) relays OpenTSDB traffic to TSD and Bosun servers.

Usage (from https://github.com/bosun-monitor/bosun/blob/master/cmd/tsdbrelay/doc.go#L20)
```
	tsdbrelay [-l listen-address] [-b bosun-server] -t tsdb-server
    
The flags are:
	-b="bosun"
		Target Bosun server. Can specify as host, host:port, or https://host:port.
	-t=""
		Target OpenTSDB server. Can specify as host, host:port or https://host:port.
	-l=":4242"
		Listen address.
	-v=false
	    Enable verbose logging
	-r=""
		Additional relays to send data to, comma seperated. Intended for secondary data center replication. Only response from primary tsdb server wil be relayed to clients.
		Examples: hostA:port,https://hostB:port,hostC#data-only,https://hostD:8080#bosun-index,https://hostE:8080#metadata-only
	-redis=""
		Redis host to store external counter data in
	-db=0
		Redis database number to use
	-denormalize=""
		List of metrics to denormalize. Comma seperated list of `metric__tagname__tagname` rules. Will be translated to `__tagvalue.tagvalue.metric`
```


##### Docker image usage example:
```bash
docker run -p 4242:4242 -it yohlulz/tsdbrelay-alpine tsdbrelay -b localhost:4343 -t localhost:4545
```
