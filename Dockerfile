FROM lyuhau/ark-ast:base

COPY common.cfg /etc/arkmanager/instances/main.cfg
RUN arkmanager installmods

RUN mkdir -p /home/steam/ARK-Backups
