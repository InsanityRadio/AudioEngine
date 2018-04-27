FROM ubuntu:xenial

MAINTAINER Jamie Woods <jamie.woods@insanityradio.com>

RUN apt-get update

RUN apt-get install -y libx264-dev build-essential make pkg-config g++ zlib1g-dev firefox-dev libfreetype6-dev libjpeg62-dev libpng12-dev libopenjpeg-dev libmad0-dev libfaad-dev libogg-dev libvorbis-dev libtheora-dev liba52-0.7.4-dev libavcodec-dev libavformat-dev libavutil-dev libswscale-dev libavresample-dev libxv-dev x11proto-video-dev libgl1-mesa-dev x11proto-gl-dev linux-sound-base libxvidcore-dev libssl-dev libjack-dev libasound2-dev libpulse-dev libsdl1.2-dev dvb-apps libavdevice-dev libmozjs185-dev git

RUN apt-get install -y wget curl

WORKDIR /tmp
RUN wget https://github.com/gpac/gpac/archive/v0.7.1.tar.gz && tar -xf v0.7.1.tar.gz
WORKDIR /tmp/gpac-0.7.1

RUN ./configure && make && make install && make install-lib

RUN cp bin/gcc/DashCast /usr/bin/DashCast

COPY start.sh /
RUN chmod +x /start.sh

CMD ["/start.sh"]
