Docker image for Left 4 Dead 2 server
=====================================

# Usage

## Build the Image:

```
docker build -t bol/l4d2 -f Dockerfile .
```

## Then run it:


```bash
docker run -p 27015:27015 -p 27015:27015/udp bol/l4d2
```


# Environment Variables

* `SV_HOSTNAME`
* `SV_RCON_PASSWORD`


