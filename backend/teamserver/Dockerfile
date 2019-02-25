FROM openjdk:11-stretch

# Get dig for dynamic GW routing via HAPROXY
RUN apt-get update && apt-get install -y dnsutils

# Copy GW script to set GW to HAPROXY
COPY set_gateway.sh /root/
RUN ["chmod", "+x", "/root/set_gateway.sh"]

# Set defaults for teamserver
ARG TS_IP=127.0.0.1
ENV TS_IP="${TS_IP}"

ARG TS_PASSWORD=you_should_change_this
ENV TS_PASSWORD="${TS_PASSWORD}"

# Run teamserver with default variables
WORKDIR /opt/cobaltstrike

CMD /root/set_gateway.sh && chmod +x ./teamserver && ./teamserver ${TS_IP} ${TS_PASSWORD}