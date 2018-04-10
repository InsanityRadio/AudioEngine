FROM jrottenberg/ffmpeg:3.3

MAINTAINER Jamie Woods <jamie.woods@insanityradio.com>


RUN apt-get -qq -y update && \
	apt-get -qq -y install wget curl

RUN wget https://www.stereotool.com/download/stereo_tool_cmd_64 -O /usr/bin/stereo_tool_cmd
RUN chmod +x /usr/bin/stereo_tool_cmd

ADD ./config.sts /config.sts
ADD ./start.sh /start.sh

RUN chmod +x /start.sh

ENTRYPOINT []
CMD ["/start.sh"]
