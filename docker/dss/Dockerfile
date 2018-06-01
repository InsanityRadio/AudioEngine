FROM ubuntu:14.04

RUN apt-get update && apt-get install -y wget curl build-essential lib32z1 lib32ncurses5 lib32bz2-1.0 lib32stdc++6
RUN wget https://github.com/macosforge/dss/releases/download/5.5.5/DarwinStreamingSrvr5.5.5-Linux.tar.gz
RUN tar -xf DarwinStreamingSrvr5.5.5-Linux.tar.gz && cd DarwinStreamingSrvrlinux-Linux && \
	username=admin password=admin ./Install

COPY ./streamingserver.xml /etc/streaming/streamingserver.xml

CMD ["/usr/local/sbin/DarwinStreamingServer","-d"]
