FROM ubuntu:trusty

RUN apt-get update && apt-get install -y build-essential checkinstall git cmake

RUN apt-get install -y poppler-data autotools-dev libjpeg-dev libtiff4-dev libpng12-dev \
		       libgif-dev libxt-dev autoconf automake libtool bzip2 libxml2-dev libuninameslist-dev \
		       libspiro-dev python-dev libpango1.0-dev libcairo2-dev chrpath uuid-dev uthash-dev libopenjpeg-dev \
		       sudo packaging-dev pkg-config python-dev g++ xz-utils wget

RUN curl -L http://poppler.freedesktop.org/poppler-0.26.5.tar.xz -o poppler-0.26.5.tar.xz && tar xvf poppler-0.26.5.tar.xz && \
    cd poppler-0.26.5 && ./configure --prefix=/usr --enable-xpdf-headers && make && make install

RUN curl -L https://phoenixnap.dl.sourceforge.net/project/freetype/freetype2/2.6.3/freetype-2.6.3.tar.gz -o freetype-2.6.3.tar.gz && \
    tar xzvf freetype-2.6.3.tar.gz && cd freetype-2.6.3 && ./configure && make && make install

RUN wget http://www.freedesktop.org/software/fontconfig/release/fontconfig-2.12.0.tar.bz2 && tar jxvf fontconfig-2.12.0.tar.bz2 && \
    cd fontconfig-2.12.0 && ./configure && make && make install

RUN git clone https://github.com/coolwanglu/fontforge.git fontforge && cd fontforge && git checkout pdf2htmlEX && \
    ./autogen.sh && ./configure --prefix=/usr && make && make install && ldconfig

RUN git clone --depth=1 git://github.com/coolwanglu/pdf2htmlEX.git && \
    cd pdf2htmlEX && cmake . -DENABLE_SVG=ON && make && make install

RUN mkdir -p /pdf

VOLUME /pdf

WORKDIR /pdf
