#!/bin/bash

echo 'A Quick System Audit Script'
date
echo ""
echo "Machine Type Info:"
echo $MACHTYPE
echo -e "Uname Info: $(uname -a) \n"
echo -e "IP info: $(ip addr | grep inet | tail -2 | head -1) \n"
echo -e "Hostname: $(hostname -s) \n"
echo "DNS Servers: "
cat /etc/resolv.conf
echo -e "\nMemory Info:"
free
echo -e "\nCPU Info:"
lscpu | grep CPU
echo -e "\nDisk Usage:"
df -H | head -2
echo -e "\nWho is logged in: \n $(who -a) \n"