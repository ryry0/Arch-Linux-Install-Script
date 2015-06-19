#!/bin/sh
ip addr add 192.168.1.117/24 dev enp2s0
ip route add default via 192.168.1.1 dev enp2s0
ip link set enp2s0 up
