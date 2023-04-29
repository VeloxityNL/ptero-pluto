# ----------------------------------
# Pterodactyl Plutonium Egg Dockerfile
# Environment: Ubuntu 22.04
# Minimum Panel Version: 1.0.0
# ----------------------------------
FROM ghcr.io/veloxitynl/wine-installer:main

LABEL maintainer="Veloxity#0001"

USER root

COPY checkupdater.sh /checkupdater.sh
RUN chmod ugo+x /checkupdater.sh

RUN apt update && apt install wget -y
RUN wget https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb && dpkg -i packages-microsoft-prod.deb
RUN apt update && apt install apt-transport-https dotnet-sdk-6.0 -y
RUN dotnet --version

USER container
ENV  USER=container HOME=/home/container

WORKDIR /home/container/

COPY entrypoint.sh /entrypoint.sh

CMD ["/bin/bash", "/entrypoint.sh"]
