FROM ubuntu:trusty

# Based on the Dockerfile for moul/icecast by Manfred Touron <m@42.am>, and Stéphane Lepin <stephane.lepin@gmail.com>
MAINTAINER Jamie Woods <jamie.woods@insanityradio.com>

ENV DEBIAN_FRONTEND noninteractive
ENV IC_VERSION "2.4.0-kh4"

RUN apt-get -qq -y update && \
	apt-get -qq -y install build-essential \
		wget curl libxml2-dev libxslt1-dev \
		libogg-dev libvorbis-dev libtheora-dev \
		libspeex-dev python-setuptools && \
	wget "https://github.com/karlheyes/icecast-kh/archive/icecast-$IC_VERSION.tar.gz" -O- | tar zxvf - && \
	cd "icecast-kh-icecast-$IC_VERSION" && \
	./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var && \
	make && make install && useradd icecast && \
	chown -R icecast /etc/icecast.xml && \
	sed -i "s/<sources>[^<]*<\/sources>/<sources>42<\/sources>/g" /etc/icecast.xml

RUN easy_install supervisor && \
    easy_install supervisor-stdout

ADD ./start.sh /start.sh
ADD ./etc /etc

RUN chmod +x /start.sh

CMD ["/start.sh"]
EXPOSE 8000
VOLUME ["/config", "/var/log/icecast"]
