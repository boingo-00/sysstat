#!/bin/bash
#####     System status     #####

	#Date and time
#date +'%F %R'

	#IPv4 address
ip -4 -h addr  | grep brd -m 1 | awk '{ gsub("/"," "); print $2 }' 

	#CPU usage and temp
cpu=$(awk -f cpuload.awk)
cputemp=$(sensors | grep temp2 | awk '{print $2}')
echo CPU: $cpu% $cputemp

	#Top of CPU usage
#ps -e --sort -pcpu -o pid,pcpu,comm | sed -n 2p

	#Used and total memory
usemem=$(free -h | grep -E "(Mem|Память)" | awk '{print $4}')
totalmem=$(free -h | grep -E "(Mem|Память)" | awk '{print $2}')
echo RAM: $usemem/$totalmem

	#Disk waste
diskuse=$(df -h | grep /mnt/storage | awk '{print $5}')
echo HDD: $diskuse
