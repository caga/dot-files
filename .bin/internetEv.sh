#!/bin/bash
ip address add 192.168.1.31/24 dev enp0s31f6
ip link set dev enp0s31f6 up
ip route add default via 192.168.1.1
