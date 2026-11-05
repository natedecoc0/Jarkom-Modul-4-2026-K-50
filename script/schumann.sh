#!/bin/sh
for i in eth0 eth1 eth2 eth3; do ip link set $i up 2>/dev/null; done
ip addr add 192.236.16.36/29 dev eth0
ip addr add 192.236.16.41/29 dev eth1
ip addr add 192.236.16.69/30 dev eth2
echo 1 > /proc/sys/net/ipv4/ip_forward
ip route add 192.236.4.0/22 via 192.236.16.70
ip route add default via 192.236.16.33

# Verifikasi
cek() { for ip in "$@"; do ping -c 3 -W 2 $ip >/dev/null 2>&1 && echo "$ip OK" || echo "$ip GAGAL"; done; }
ip -4 addr show | grep -o 'inet [0-9./]*'
ip route
cek 192.236.16.33 192.236.16.34 192.236.16.35 192.236.16.70