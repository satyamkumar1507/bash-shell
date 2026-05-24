#!/bin/bash

LOG_FILE="$HOME/prod-monitor.log"
THRESHOLD=80

echo "========== $(date) ==========" >> $LOG_FILE

CPU=$(top -bn1 | grep "Cpu" | awk '{print $2}' | cut -d. -f1)

MEM=$(free | grep Mem | awk '{print ($3/$2) * 100.0}')
MEM_INT=${MEM%.*}

DISK=$(df -h / | awk 'NR==2 {print $5}' | sed 's/%//')

echo "CPU: $CPU%" >> $LOG_FILE
echo "MEMORY: $MEM_INT%" >> $LOG_FILE
echo "DISK: $DISK%" >> $LOG_FILE

if [ "$CPU" -gt "$THRESHOLD" ]
then
    echo "High CPU Usage" >> $LOG_FILE
fi

if [ "$MEM_INT" -gt "$THRESHOLD" ]
then
    echo "High Memory Usage" >> $LOG_FILE
fi

if [ "$DISK" -gt "$THRESHOLD" ]
then
    echo "High Disk Usage" >> $LOG_FILE
fi

docker ps >> $LOG_FILE

systemctl status nginx --no-pager >> $LOG_FILE
