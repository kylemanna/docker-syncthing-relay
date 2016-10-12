# Syncthing Relay Docker Image 

[![Build Status](https://travis-ci.org/kylemanna/docker-syncthing-relay.svg)](https://travis-ci.org/kylemanna/docker-syncthing-relay)
[![Docker Stars](https://img.shields.io/docker/stars/kylemanna/syncthing-relay.svg)](https://hub.docker.com/r/kylemanna/syncthing-relay/)
[![Docker Pulls](https://img.shields.io/docker/pulls/kylemanna/syncthing-relay.svg)](https://hub.docker.com/r/kylemanna/syncthing-relay/)
[![ImageLayers](https://images.microbadger.com/badges/image/kylemanna/syncthing-relay.svg)](https://microbadger.com/#/images/kylemanna/syncthing-relay)

Syncthing Relay to help Syncthing clients relay data when they can't communicate directly due to things like NAT routers.  More documentation at https://docs.syncthing.net/users/relaying.html

Extensively tested on [Digital Ocean $5/mo node](http://do.co/2d7vkfJ)

#### Upstream Links

* Docker Registry @ [kylemanna/openvpn](https://hub.docker.com/r/kylemanna/syncthing-relay/)
* GitHub @ [kylemanna/docker-openvpn](https://github.com/kylemanna/docker-syncthing-relay)

## Quick Start

Just run:

    docker run --rm --publish-all kylemanna/syncthing-relay

Verify your server shows up at http://relays.syncthing.net/
