#script to display the IP, RAM, SWAP, CPU Model, No of cores, and Hard Disk space of a machine
#Author: Abhilash

#!/bin/bash

IP=$(hostname -I | awk '{print $1}')
RAM=$(free -m | grep Mem | awk '{print $2}')
FRAM=$(free -m | grep Mem | awk '{print $4}')
SWAP=$(free -m | grep Swap | awk '{print $2}')
CPU_MODEL=$(cat /proc/cpuinfo | grep 'model name' | uniq | cut -d ':' -f2)
NCORE=$(cat /proc/cpuinfo | grep 'cpu cores' | uniq | cut -d ':' -f2)
HDD=$(lsblk | grep disk | awk '{print$4}')

echo "___________________SYSTEM DETAILS___________________"
echo " "
echo "IP ADDRESS:" $IP
echo "TOTAL RAM:" $RAM "MB" " AVAILABLE RAM:" $FRAM "MB"
echo "SWAP MEMORY:" $SWAP "MB"
echo "CPU MODEL:" $CPU_MODEL
echo "No. of cores available:" $NCORE
echo "Hard Disk Capacity:" $HDD
echo "____________________________________________________"
