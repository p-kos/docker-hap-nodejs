# FROM balenalib/armv7hf-debian
FROM balenalib/raspberrypi3-debian-node
RUN apt-get update
RUN apt-get install apt-utils -y
RUN apt-get install wget curl -y
ENV HOME /home/pi
RUN useradd --create-home --home-dir $HOME pi \
	&& gpasswd -a pi root \
	&& chown -R pi:pi $HOME

WORKDIR $HOME
RUN echo "about to start installing..."
RUN curl -sSL https://raw.githubusercontent.com/p-kos/docker-hap-nodejs/master/installHAPNodeJS | bash
USER pi
# RUN curl -sSL installHAPNodeJS | bash