#!/bin/sh

# Static sleep to wait for CS route to start up
sleep 5

# Set IPtables DIVERT before starting HAPROXY
/sbin/iptables -t mangle -N DIVERT
/sbin/iptables -t mangle -A PREROUTING -p tcp -m socket -j DIVERT
/sbin/iptables -t mangle -A DIVERT -j MARK --set-mark 1
/sbin/iptables -t mangle -A DIVERT -j ACCEPT

# Set IP routes and rules
/sbin/ip rule add fwmark 1 lookup 100
/sbin/ip route add local 0.0.0.0/0 dev lo table 100

# Start Haproxy service
/usr/sbin/haproxy -d -f /etc/haproxy/haproxy.cfg