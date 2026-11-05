#!/bin/sh
ip addr add 192.236.8.2/23 dev eth0
ip route add default via 192.236.8.1
ping -c 2 192.236.8.1