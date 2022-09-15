FROM nvidia/cuda:11.3.1-base

# Never prompts the user for choices on installation/configuration of packages
ENV DEBIAN_FRONTEND noninteractive
ENV TERM linux

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update \
    && apt install -y wget dnsutils
WORKDIR /tmp

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys A4B469963BF863CC \
 && apt update && apt upgrade -y \
 && apt install -y libpci3 libpci-dev libx11-dev libxext-dev libxxf86vm-dev libnuma-dev systemd libnvidia-ml-dev

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv AB7DD0158393F0D4 \
 && echo 'deb [arch=amd64] https://download.cudo.org/repo/apt/ experimental main' >> /etc/apt/sources.list \
 && apt update \
 && apt install cudo-miner-cli cudo-miner-core cudo-miner-headless cudo-miner-service

ENV SOCKET_PATH=/var/lib/cudo-miner.sock
ENV REBOOT_IDLE_TIME=30
ENV STORE_PATH=/var/lib/cudo-miner/store
ENV REGISTRY_PATH=/var/lib/cudo-miner/registry
ENV BIN_PATH=/usr/local/cudo-miner/bin
ENV RUNTIME_PATH=/usr/local/cudo-miner/runtime
WORKDIR /usr/local/cudo-miner

CMD ["/usr/local/cudo-miner/cudo-miner-core"] #, "--autoenrol-org", "labour-antelope"]


