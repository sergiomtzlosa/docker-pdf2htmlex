FROM scratch

ADD rootfs-trusty.tar.xz /

COPY sources.list /etc/apt/sources.list

RUN dpkg-divert --rename --add /usr/sbin/invoke-rc.d
RUN ln -s /bin/true /usr/sbin/invoke-rc.d

RUN apt-get update && apt-get upgrade -y libpam-systemd && apt-get install -y build-essential checkinstall git cmake

RUN apt-get install -y poppler-data autotools-dev libjpeg-dev libtiff4-dev libpng12-dev \
		       libgif-dev libxt-dev autoconf automake libtool bzip2 libxml2-dev libuninameslist-dev \
		       libspiro-dev python-dev libpango1.0-dev libcairo2-dev chrpath uuid-dev uthash-dev libopenjpeg-dev \
		       sudo packaging-dev pkg-config python-dev g++ xz-utils wget

ADD poppler-0.26.5.tar.xz /
RUN cd / && cd poppler-0.26.5 && ./configure --prefix=/usr --enable-xpdf-headers && make && make install

ADD freetype-2.6.3.tar.gz /
RUN cd / && cd freetype-2.6.3 && ./configure && make && make install

ADD fontconfig-2.12.0.tar.bz2 /
RUN cd / && cd fontconfig-2.12.0 && ./configure && make && make install

ADD fontforge.tar.gz /
RUN cd / && cd fontforge && ./autogen.sh && ./configure --prefix=/usr && make && make install && ldconfig

ADD pdf2htmlEX.tar.gz /
RUN cd / && cd pdf2htmlEX && cmake . -DENABLE_SVG=ON && make && make install

RUN rm /usr/sbin/invoke-rc.d
RUN dpkg-divert --rename --remove /usr/sbin/invoke-rc.d

RUN mkdir -p /pdf

VOLUME /pdf

WORKDIR /pdf
