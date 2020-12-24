ip addr add 172.26.140.25/24 dev eno1
ip link set eno1 up
ip route add  default via 172.26.140.1
