FROM ubuntu:xenial
MAINTAINER savilovoa
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get -qq update \
  && apt-get -qq install --yes --no-install-recommends ca-certificates wget locales \
  && `#----- Install the dependencies -----` \
  &&  apt-get -qq install --yes --no-install-recommends fontconfig imagemagick \
  && `#----- Deal with ttf-mscorefonts-installer -----` \
  && apt-get -qq install --yes --no-install-recommends xfonts-utils cabextract \
  && wget --quiet --output-document /tmp/ttf-mscorefonts-installer_3.6_all.deb http://ftp.us.debian.org/debian/pool/contrib/m/msttcorefonts/ttf-mscorefonts-installer_3.6_all.deb \
  && dpkg --install /tmp/ttf-mscorefonts-installer_3.6_all.deb 2> /dev/null \
  && rm /tmp/ttf-mscorefonts-installer_3.6_all.deb \

#RUN apt-get update \
#    && apt-get install -y software-properties-common python-software-properties \
#    && add-apt-repository multiverse && add-apt-repository ppa:no1wantdthisname/ppa && add-apt-repository ppa:openjdk-r/ppa && apt-get update && apt-get upgrade -y \
#    && apt-get install -y unixodbc libgsf-1-114 imagemagick libglib2.0-dev t1utils openjdk-8-jdk libwebkit-dev libcanberra-gtk-module unzip xterm uuid \
#    && apt-get install -y gtk2-engines-murrine gtk2-engines-pixbuf dialog nano \
#    && apt-get install -y locales && rm -rf /var/lib/apt/lists/* \
#    && localedef -i ru_RU -c -f UTF-8 -A /usr/share/locale/locale.alias ru_RU.UTF-8


ADD ./deb/ /tmp/
RUN dpkg --install /tmp/1c-enterprise83-client_8.3.10-2699_amd64.deb 
RUN    rm /tmp/*deb

RUN export uid=1000 gid=1000 && \
mkdir -p /home/user && \
echo "user:x:${uid}:${gid}:User,,,:/home/user:/bin/bash" >> /etc/passwd && \
echo "user:x:${uid}:" >> /etc/group && \
echo "user ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/user && \
chmod 0440 /etc/sudoers.d/user && \
chown ${uid}:${gid} -R /home/user

CMD /bin/bash