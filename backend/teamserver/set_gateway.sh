#!/bin/sh
GW=`dig +short haproxy`
/sbin/ip route del default
/sbin/ip route add default via $GW dev eth0