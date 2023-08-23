FROM amd64/ubuntu:20.04

MAINTAINER Karl Ma
ENV REFRESHED_AT 2023-08-23

# Change sourcelist to aliyun
RUN sed -i 's/archive.ubuntu.com/mirrors.aliyun.com/g' /etc/apt/sources.list && \
    sed -i 's/security.ubuntu.com/mirrors.aliyun.com/g' /etc/apt/sources.list
RUN apt update -y

RUN apt install -y \
  make \
  cmake \
  gcc \
  g++ \
  libssl-dev \
  libpcap-dev \
  libsctp-dev \
  libncurses5-dev

ADD ./sipp-3.7.1.tar.gz /


WORKDIR /sipp-3.7.1
RUN ./build.sh --full
RUN make install

WORKDIR  /
RUN rm -rf sipp-3.7.1*

# clear apt cache
RUN rm -rf /var/lib/apt/lists/*

WORKDIR /sipp

EXPOSE 5060

ENTRYPOINT ["sipp"]
