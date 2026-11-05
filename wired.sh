#!/bin/sh
for i in eth0 eth1 eth2 eth3; do ip link set $i up 2>/dev/null; done
ip addr add 192.236.16.58/30 dev eth0
ip addr add 192.236.16.61/30 dev eth1
ip addr add 192.236.16.65/30 dev eth2
ip addr add 192.236.16.33/29 dev eth3
echo 1 > /proc/sys/net/ipv4/ip_forward
ip route add 192.236.0.0/22 via 192.236.16.34
ip route add 192.236.4.0/22 via 192.236.16.36
ip route add 192.236.8.0/23 via 192.236.16.35
ip route add 192.236.10.0/23 via 192.236.16.66
ip route add 192.236.12.0/23 via 192.236.16.62
ip route add 192.236.14.128/25 via 192.236.16.66
ip route add 192.236.15.0/26 via 192.236.16.35
ip route add 192.236.15.64/26 via 192.236.16.62
ip route add 192.236.15.128/25 via 192.236.16.66
ip route add 192.236.16.0/27 via 192.236.16.66
ip route add 192.236.16.40/29 via 192.236.16.36
ip route add 192.236.16.48/29 via 192.236.16.66
ip route add 192.236.16.68/30 via 192.236.16.36
ip route add 192.236.16.72/29 via 192.236.16.66
ip route add 192.236.16.80/29 via 192.236.16.66
ip route add 192.236.16.88/30 via 192.236.16.66
ip route add default via 192.236.16.57

# Verifikasi
cek() { for ip in "$@"; do ping -c 3 -W 2 $ip >/dev/null 2>&1 && echo "$ip OK" || echo "$ip GAGAL"; done; }
ip -4 addr show | grep -o 'inet [0-9./]*'
ip route
cek 192.236.16.57 192.236.16.62 192.236.16.66 192.236.16.34 192.236.16.35 192.236.16.36