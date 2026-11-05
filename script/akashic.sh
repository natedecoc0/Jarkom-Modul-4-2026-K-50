#!/bin/sh
ip addr add 192.236.16.42/29 dev eth0
ip route add default via 192.236.16.41
ping -c 2 192.236.16.41