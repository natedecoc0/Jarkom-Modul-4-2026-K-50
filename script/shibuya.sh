#!/bin/sh
for i in eth0 eth1 eth2 eth3; do ip link set $i up 2>/dev/null; done
ip addr add 192.236.16.90/30 dev eth0
ip addr add 192.236.15.193/26 dev eth1
echo 1 > /proc/sys/net/ipv4/ip_forward
ip route add default via 192.236.16.89

# Verifikasi
cek() { for ip in "$@"; do ping -c 3 -W 2 $ip >/dev/null 2>&1 && echo "$ip OK" || echo "$ip GAGAL"; done; }
ip -4 addr show | grep -o 'inet [0-9./]*'
ip route
cek 192.236.16.89