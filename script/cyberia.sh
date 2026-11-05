#!/bin/sh
for i in eth0 eth1 eth2 eth3; do ip link set $i up 2>/dev/null; done
ip addr add 192.236.14.1/25 dev eth1
ip addr add 192.236.16.57/30 dev eth2
echo 1 > /proc/sys/net/ipv4/ip_forward
ip route add 192.236.0.0/21 via 192.236.16.58
ip route add 192.236.8.0/22 via 192.236.16.58
ip route add 192.236.12.0/23 via 192.236.16.58
ip route add 192.236.14.128/25 via 192.236.16.58
ip route add 192.236.15.0/24 via 192.236.16.58
ip route add 192.236.16.0/27 via 192.236.16.58
ip route add 192.236.16.32/28 via 192.236.16.58
ip route add 192.236.16.48/29 via 192.236.16.58
ip route add 192.236.16.60/30 via 192.236.16.58
ip route add 192.236.16.64/28 via 192.236.16.58
ip route add 192.236.16.80/29 via 192.236.16.58
ip route add 192.236.16.88/30 via 192.236.16.58

# Verifikasi
cek() { for ip in "$@"; do ping -c 3 -W 2 $ip >/dev/null 2>&1 && echo "$ip OK" || echo "$ip GAGAL"; done; }
ip -4 addr show | grep -o 'inet [0-9./]*'
ip route
cek 192.236.16.58