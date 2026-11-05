#!/bin/sh
ip addr add 192.236.15.195/26 dev eth0
ip route add default via 192.236.15.193
ping -c 2 192.236.15.193