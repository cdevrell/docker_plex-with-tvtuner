FROM plexinc/pms-docker:plexpass

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y software-properties-common

RUN add-apt-repository ppa:b-rad/kernel+mediatree+hauppauge && \
    apt-get update && \
    echo "yes" | apt-get install -y linux-mediatree && \
    apt-get install -y linux-firmware-hauppauge

RUN usermod -a -G video plex

ADD ./fixperms.sh /etc/cont-init.d/15-fixperms
ADD ./dvb-demod-si2168-02.fw /lib/firmware/
ADD ./dvb-demod-si2168-b40-01.fw /lib/firmware/
