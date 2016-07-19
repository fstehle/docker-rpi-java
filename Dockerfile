FROM resin/armv7hf-debian-qemu

ENV DEBIAN_FRONTEND noninteractive

RUN [ "cross-build-start" ]

RUN echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu precise main" > /etc/apt/sources.list.d/webupd8team.list
RUN echo "deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu precise main" >> /etc/apt/sources.list.d/webupd8team.list
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys EEA14886
RUN echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections

RUN apt-get update && \
    apt-get install -yq \
            oracle-java8-installer

ENV JAVA_HOME /usr/lib/jvm/java-8-oracle

# Set locales
RUN locale-gen en_GB.UTF-8
ENV LANG en_GB.UTF-8
ENV LC_CTYPE en_GB.UTF-8

RUN [ "cross-build-end" ]
