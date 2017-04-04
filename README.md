# Syncthing Relay Docker Image 

[![Build Status](https://travis-ci.org/kylemanna/docker-syncthing-relay.svg)](https://travis-ci.org/kylemanna/docker-syncthing-relay)
[![Docker Stars](https://img.shields.io/docker/stars/kylemanna/syncthing-relay.svg)](https://hub.docker.com/r/kylemanna/syncthing-relay/)
[![Docker Pulls](https://img.shields.io/docker/pulls/kylemanna/syncthing-relay.svg)](https://hub.docker.com/r/kylemanna/syncthing-relay/)
[![ImageLayers](https://images.microbadger.com/badges/image/kylemanna/syncthing-relay.svg)](https://microbadger.com/#/images/kylemanna/syncthing-relay)

## Overview
Syncthing Relay to help Syncthing clients relay data when they can't communicate directly due to things like NAT routers and firewalls blocking inbound TCP connections.

More detailed description on [my blog](https://blog.kylemanna.com/sharing/syncthing-relay-docker-container/).

Extensively tested on [Digital Ocean $5/mo node](http://do.co/2d7vkfJ)

## Upstream Links

* Docker Registry @ [kylemanna/openvpn](https://hub.docker.com/r/kylemanna/syncthing-relay/)
* GitHub @ [kylemanna/docker-openvpn](https://github.com/kylemanna/docker-syncthing-relay)

## Quick Start

Just run:

    docker run --rm -p 22067:22067 -p 22070:22070 kylemanna/syncthing-relay

Verify your server shows up at http://relays.syncthing.net/

## Using Systemd to Auto Start the Docker Container

Here's the quick start guide for setting up a systemd service that will listen on the defualt ports and start at boot time.  It will also attempt to pull down image updates each time the service starts and automatically restart after 10 seconds if the process exits.  This Docker container preserves no state across starts.

    cd /etc/systemd/system
    sudo curl -O https://raw.githubusercontent.com/kylemanna/docker-syncthing-relay/master/init/docker-syncthing-relay.service
    sudo systemctl daemon-reload
    sudo systemctl enable --now docker-syncthing-relay.service
    sudo systemctl status docker-syncthing-relay.service
