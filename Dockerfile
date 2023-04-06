FROM lyuhau/ark-ast:base

COPY instances/main.cfg /etc/arkmanager/instances/main.cfg
RUN arkmanager installmods
