# Syncthing Relay Docker Image

[![Docker Stars](https://img.shields.io/docker/stars/migel0/syncthing-relay.svg)](https://hub.docker.com/r/migel0/syncthing-relay/)
[![Docker Pulls](https://img.shields.io/docker/pulls/migel0/syncthing-relay.svg)](https://hub.docker.com/r/migel0/syncthing-relay/)

## Overview

Syncthing Relay to help Syncthing clients relay data when they can't communicate directly due to things like NAT routers and firewalls blocking inbound TCP connections.

More detailed description on the [original author's blog](https://blog.kylemanna.com/sharing/syncthing-relay-docker-container/).

Extensively tested on [Digital Ocean $5/mo node](http://do.co/2d7vkfJ)

## Upstream Links

- Docker Registry @ [migel0/syncthing-relay](https://hub.docker.com/repository/docker/migel0/syncthing-relay//)
- GitHub @ [migelo/docker-syncthing-relay](https://github.com/Migelo/docker-syncthing-relay)

## Quick Start

Just run:

```bash
docker run --rm -p 22067:22067 -p 22070:22070 migel0/syncthing-relay
```

Verify your server shows up at <http://relays.syncthing.net/>

Or private relay:

```bash
docker run --rm -p 22067:22067 -p 22070:22070 migel0/syncthing-relay -pools=""
```

## Private relays and persistent keys

When using the commands above, docker will remove the old container once it's no longer running. This is fine for public relays where the key does not matter, but becomes impractical for private relays where the URL must contain the key signature.

For those using private relays, it may be a good idea to use persistent storage for the certificate. To that effect, the first step is to create a volume with the command below (only needs to be done once):

```bash
docker volume create syncthing-relay
```

Then run the container mapping the `/relaysrv` directory into the volume:

```bash
docker run -p 22067:22067 -p 22070:22070 --mount source=syncthing-relay,target=/relaysrv -d migel0/syncthing-relay -pools=""
```

## Automatically restarting the container on reboot

To automatically restart the container after a host reboot, replace the `--rm` option in any of the docker invocations above with `--restart=always`. This is a simple solution for those who want to have a relay server that survives host restarts but prefer not to deal with systemd.

## Using Systemd to Auto Start the Docker Container

Here's the quick start guide for setting up a systemd service that will listen on the defualt ports and start at boot time.  It will also attempt to pull down image updates each time the service starts and automatically restart after 10 seconds if the process exits. This Docker container preserves no state across starts.

```bash
cd /etc/systemd/system
sudo curl -O https://raw.githubusercontent.com/migelo/docker-syncthing-relay/main/init/docker-syncthing-relay.service
sudo systemctl daemon-reload
sudo systemctl enable --now docker-syncthing-relay.service
sudo systemctl status docker-syncthing-relay.service
```
