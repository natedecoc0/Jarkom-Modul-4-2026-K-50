#!/bin/sh
ip addr add 192.236.16.2/27 dev eth0
ip route add default via 192.236.16.1
ping -c 2 192.236.16.1