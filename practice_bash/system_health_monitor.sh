#!/bin/bash

LOG_FILE="/home/satyam/system_health.log"
DATE=$(date "+%Y-%m-%d %H:%M:%S")

CPU_USAGE=$(top -bn1 | awk '/Cpu/ {print int($2 + $4)}')
MEM_USAGE=$(free | awk '/Mem:/ {printf("%.2f"), $3/$2 * 100}')
DISK_USAGE=$(df -h / | awk 'NR==2 {print $5}' | sed 's/%//')
LOAD=$(uptime | awk -F'load average:' '{print $2}')

echo "==================================" >> $LOG_FILE
echo "Date: $DATE" >> $LOG_FILE
echo "cpu usage: $CPU_USAGE%" >> $LOG_FILE
echo "Memory usage: $MEM_USAGE%" >> $LOG_FILE
echo "Load Average: $LOAD" >> $LOG_FILE

if (( $(echo "$CPU_USAGE > 80" | bc -l) )); then
	echo "High cpu Usage Alert!" >> $LOG_FILE
fi


if (( $(echo "$MEM_USAGE > 80" | bc -l) )); then
	echo "High Memory usage Alert!" >> $LOG_FILE
fi


if [[ "$DISK_USAGE" -gt 80 ]]
then
	echo "Disk Usage critical" >> $LOG_FILE
fi

