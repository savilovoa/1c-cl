
apt-get -qq install --yes --no-install-recommends ca-certificates wget locales \
  && `#----- Install the dependencies -----` \
  &&  apt-get -qq install --yes --no-install-recommends fontconfig imagemagick \
  && `#----- Deal with ttf-mscorefonts-installer -----` \
  && apt-get -qq install --yes --no-install-recommends xfonts-utils cabextract \
  && wget --quiet --output-document /tmp/ttf-mscorefonts-installer_3.6_all.deb http://ftp.us.debian.org/debian/pool/contrib/m/msttcorefonts/ttf-mscorefonts-installer_3.6_all.deb \
  && dpkg --install /tmp/ttf-mscorefonts-installer_3.6_all.deb \
  && rm /tmp/ttf-mscorefonts-installer_3.6_all.deb 

apt-get -qq install --yes --no-install-recommends unixodbc libgsf-1-114 imagemagick libglib2.0-dev  t1utils openjdk-8-jdk libwebkitgtk-3.0-0 libcanberra-gtk-module unzip xterm uuid

dpkg --install ../deb/1c-enterprise83-common_8.3.12-1714_amd64.deb \
  ../deb/1c-enterprise83-server_8.3.12-1714_amd64.deb \
  ../deb/1c-enterprise83-client_8.3.12-1714_amd64.deb