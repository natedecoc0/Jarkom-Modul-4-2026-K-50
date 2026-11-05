#!/bin/sh
ip addr add 192.236.14.131/25 dev eth0
ip route add default via 192.236.14.129
ping -c 2 192.236.14.129