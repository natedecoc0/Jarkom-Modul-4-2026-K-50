#!/bin/sh
ip addr add 192.236.16.50/29 dev eth0
ip route add default via 192.236.16.49
ping -c 2 192.236.16.49