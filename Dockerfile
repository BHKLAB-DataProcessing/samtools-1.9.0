FROM ubuntu:latest

RUN apt-get update && apt-get install -y \
    && apt-get install --yes g++ libbz2-dev liblzma-dev make ncurses-dev wget zlib1g-dev libcurl4-openssl-dev \
    && wget https://github.com/samtools/htslib/releases/download/1.9/htslib-1.9.tar.bz2 \
    && wget https://github.com/samtools/samtools/releases/download/1.9/samtools-1.9.tar.bz2 \
    && tar xvjf htslib-1.9.tar.bz2 \
    && cd htslib-1.9 \
    && ./configure --enable-libcurl \
    && make \
    && cd ../.. \
    && tar xvjf samtools-1.9.tar.bz2 \
    && cd samtools-1.9 \
    && ./configure --enable-libcurl \
    && make \
    && rm -r /htslib-1.9/test \
    && cp -r /htslib-1.9/* /usr/bin \
    && rm -r /samtools-1.9/test \
    && cp -r /samtools-1.9/* /usr/bin
