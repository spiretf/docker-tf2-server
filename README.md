# Moved to https://codeberg.org/spire/docker-tf2-server

## Team Fortress 2 + Docker

Basic Team Fortress 2 server

```
docker pull spiretf/docker-tf2-server
```

### Maps ###

In order to reduce the image size this image has most of the maps removed, you'll probably want to add aditional maps to a derived image, install [mapdownloader](https://github.com/spiretf/mapdownloader) or use [spiretf/docker-comp-server](https://hub.docker.com/r/spiretf/docker-comp-server) (comes with mapdownloader) instead.

### Details:
By default image is build with enabled autoupdate feature (take a look at `tf.sh` file).
You can create new Dockerfile based on that image (FROM spiretf/docker-tf2-server) and customize it with plugins, configs, CMD and ENTRYPOINT instructions.


```shell
# Run image with default options (CMD in Dockerfile)
docker run -d -p 27015:27015/udp spiretf/docker-tf2-server

# Run image with custom options
docker run -d -p 27015:27015/udp spiretf/docker-tf2-server +sv_pure 2 +map pl_badwater.bsp +maxplayers 32

# Run image with custom config
docker run -d -p 27015:27015/udp -v ~/server.cfg:/home/tf2/hlserver/tf2/tf/cfg/server.cfg:ro spiretf/docker-tf2-server
```
