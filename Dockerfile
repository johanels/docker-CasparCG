FROM ubuntu:16.04
MAINTAINER Johan Els <johan@who-els.co.za>

WORKDIR /

RUN apt-get update && \
    apt-get -y upgrade && \
    apt-get -y install apt-utils vim wget

# install VasparCG dependencies
RUN apt-get -y install xvfb lxrandr \
    libxrandr2 libxcb-xfixes0 libxcb-shape0 libv4l-0 libjpeg-dev \
    libxtst6 libnss3 libgconf-2-4 libasound2 \
    libnih1 libnih-dbus1 libraw1394-11 libavc1394-0 libiec61883-0 \
    libgtk2.0-0 libcap2 libcgmanager0

RUN wget http://archive.debian.org/debian-security/pool/updates/main/libg/libgcrypt11/libgcrypt11_1.5.0-5+deb7u6_amd64.deb -O /opt/libgcrypt11_1.5.0-5+deb7u6_amd64.deb && \
    dpkg -i /opt/libgcrypt11_1.5.0-5+deb7u6_amd64.deb

# download casrparcg
RUN wget http://casparcg.com/builds/CasparCG%20Server/2.1.x/CasparCG%20Server%202.1.0%20Beta%202%20for%20Linux.tar.gz -O /opt/CasparCG-Server-2.1.0-Beta-for-Linux.tar.gz && \
    tar zxvf /opt/CasparCG-Server-2.1.0-Beta-for-Linux.tar.gz -C /opt/

ADD ["run.sh", "/opt/CasparCG Server/run.sh"]
ADD ["casparcg.config", "/opt/CasparCG Server/casparcg.config"]

ENTRYPOINT ["/opt/CasparCG Server/run.sh"]
