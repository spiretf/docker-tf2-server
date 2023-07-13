from ubuntu:22.04
maintainer Robin Appelman <robin@icewind.nl>

RUN echo steam steam/question select "I AGREE" | debconf-set-selections \
	&& echo steam steam/license note '' | debconf-set-selections \
	&& apt-get -y update \
	&& apt-get -y install software-properties-common \
	&& add-apt-repository multiverse \
	&& dpkg --add-architecture i386 \
	&& apt-get update && DEBIAN_FRONTEND=noninteractive apt-get -y install libstdc++6 libcurl3-gnutls wget libncurses5 bzip2 unzip vim nano lib32gcc-s1 lib32stdc++6 steamcmd  \
	&& apt-get install -y --no-install-recommends --no-install-suggests \
		ca-certificates \
		lib32z1 \
		libncurses5:i386 \
		libbz2-1.0:i386 \
		libtinfo5:i386 \
		libcurl3-gnutls:i386 \
	&& apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
	&& useradd -m tf2 \
	&& su tf2 -c '/usr/games/steamcmd +quit'

USER tf2

ENV USER tf2
ENV HOME /home/$USER
ENV SERVER $HOME/hlserver

ADD --chown=tf2:tf2 tf2_ds.txt update.sh clean.sh tf.sh $SERVER/
RUN mkdir -p $SERVER/tf2 \
	&& $SERVER/update.sh \
	&& $SERVER/clean.sh

EXPOSE 27015/udp

WORKDIR /home/$USER/hlserver
ENTRYPOINT ["./tf.sh"]
CMD ["+sv_pure", "1", "+mapcycle", "mapcycle_quickplay_payload.txt", "+map", "cp_badlands", "+maxplayers", "24"]
