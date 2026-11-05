#!/bin/sh
ip addr add 192.236.0.2/22 dev eth0
ip route add default via 192.236.0.1
ping -c 2 192.236.0.1