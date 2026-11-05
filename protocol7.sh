#!/bin/sh
for i in eth0 eth1 eth2 eth3; do ip link set $i up 2>/dev/null; done
ip addr add 192.236.16.78/30 dev eth0
ip addr add 192.236.15.129/26 dev eth1
ip addr add 192.236.16.81/30 dev eth2
echo 1 > /proc/sys/net/ipv4/ip_forward
ip route add 192.236.15.192/26 via 192.236.16.82
ip route add 192.236.16.0/27 via 192.236.16.82
ip route add 192.236.16.48/29 via 192.236.16.82
ip route add 192.236.16.84/30 via 192.236.16.82
ip route add 192.236.16.88/30 via 192.236.16.82
ip route add default via 192.236.16.77

# Verifikasi
cek() { for ip in "$@"; do ping -c 3 -W 2 $ip >/dev/null 2>&1 && echo "$ip OK" || echo "$ip GAGAL"; done; }
ip -4 addr show | grep -o 'inet [0-9./]*'
ip route
cek 192.236.16.77 192.236.16.82