# <img src="https://raw.githubusercontent.com/InsanityRadio/OnAirController/master/doc/headphones_dark.png" align="left" height=48 /> AudioEngine

AudioEngine is a set of utilities for really easily creating an online streaming architecture, using Docker.

Audio egress will include:

- Icecast
- Variable DASH
- HLS

# Building

Season config.yml to taste. Then run `ruby scripts/build_config` to build `docker-compose.yml`, and fill config files.

Then run `docker-compose build && docker-compose up -d` to build your system. 

# License

Licensed under the LGPLv3, probably. 
