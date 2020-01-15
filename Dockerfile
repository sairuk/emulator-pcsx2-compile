FROM multiarch/debian-debootstrap:i386-stretch
MAINTAINER sairuk
ARG USER=emudev
ARG UID=1004
ARG BS=build-script
ARG BSD=/tmp/${BS}

# UPDATE SOURCES enable non-free for nvidia-cg-toolkit & libcggl
RUN sed -i 's/main$/main non-free/' /etc/apt/sources.list

# UPDATE IMAGE
RUN apt-get -y update && apt-get -y upgrade

RUN apt-get -y install \
	build-essential \
	gcc \
	gcc-multilib \
	g++ \
	g++-multilib \
	cmake \
  git

# DEPENDENCIES
RUN apt-get -y install \
	libaio-dev \ 
	libbz2-dev \
	libcggl \
	libegl1-mesa-dev \
	libglew-dev \
	libgles2-mesa-dev \
	libgtk2.0-dev \
	libjpeg-dev \
	libsdl1.2-dev \
	libsoundtouch-dev \
	libwxgtk3.0-dev \
	nvidia-cg-toolkit \
	portaudio19-dev \
	zlib1g-dev \
	libsdl2-dev \
	libjack-jackd2-dev \
	libportaudiocpp0 \
	portaudio19-dev \
	liblzma-dev

# USER
RUN useradd -m -s /bin/bash -u ${UID} ${USER}

COPY ${BS} ${BSD}

RUN chown ${USER}: ${BSD} \
    && chmod +x ${BSD}

VOLUME /home/${USER}
USER ${USER}
WORKDIR /home/${USER}

CMD /tmp/build-script
