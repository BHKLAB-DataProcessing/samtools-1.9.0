FROM ubuntu:latest

RUN apt-get update && apt-get install -y \
    && apt-get install --yes g++ libbz2-dev liblzma-dev make ncurses-dev wget zlib1g-dev \
    && wget -O samtools-1.9.tar.bz2 https://github.com/samtools/samtools/releases/download/1.9/samtools-1.9.tar.bz2 \
    && wget https://github.com/samtools/htslib/releases/download/1.9/htslib-1.9.tar.bz2 \
    && tar xvjf samtools-1.9.tar.bz2 \
    && cd samtools-1.9 \
    && ./configure \
    && make \
    && rm -r /samtools-1.9/test \
    && cp -r /samtools-1.9/* /usr/bin \
    && tar -vxjf htslib-1.9.tar.bz2 \
    && cd htslib-1.9 \
    && ./configure \
    && make \
    && cp -r /htslib-1.9/* /usr/bin
