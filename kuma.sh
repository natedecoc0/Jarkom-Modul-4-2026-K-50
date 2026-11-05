#!/bin/sh
ip addr add 192.236.13.4/24 dev eth0
ip route add default via 192.236.13.1
ping -c 2 192.236.13.1