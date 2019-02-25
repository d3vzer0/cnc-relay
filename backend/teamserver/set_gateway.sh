#!/bin/sh

# Static sleep to wait for Haproxy route to start up
sleep 5

# Set gateway to Haproxy
GW=`dig +short haproxy`
/sbin/ip route del default
/sbin/ip route add default via $GW