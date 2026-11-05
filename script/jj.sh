#!/bin/sh
ip addr add 192.236.14.2/25 dev eth0
ip route add default via 192.236.14.1
ping -c 2 192.236.14.1