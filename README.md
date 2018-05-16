# <img src="https://raw.githubusercontent.com/InsanityRadio/OnAirController/master/doc/headphones_dark.png" align="left" height=48 /> AudioEngine

AudioEngine is a set of utilities for really easily creating an online streaming architecture, using Docker.

Audio egress currently includes:
- Icecast
- DASH (fully adaptive)

Features include
- Single configuration file deployment

## To-Do

Audio egress will include:

- HLS

There will be support for multiple ingest points, to prevent single point of failure from bad hardware. 

There will also be inbuilt telemetry support, uniform across all egress points. 

# Building

Season config.yml to taste. Then run `ruby scripts/build_config` to build `docker-compose.yml`, and fill config files.

Then run `docker-compose build && docker-compose up -d` to build your system. 

# License

Licensed under the LGPLv3, probably. 
