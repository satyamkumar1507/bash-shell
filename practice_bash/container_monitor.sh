#!/bin/bash

CONTAINER_NAME="web-container"
LOG_DIR="/OPT/CONTAINER_MONITOR/LOGS"
LOG_FILE="$LOG_DIR/monitor.log"

mkdir -p "$LOG_DIR"

TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")

echo "$TIMESTAMP | CRON RUNNING" >> "$LOG_FILE"

STATS=$(/usr/bin/docker stats --no-stream --format "{{.Name}}|{{.CPUPerc}}|{{.MemUsage}}" 2>/dev/null)

if [[ -z "$STATS" ]]
then
	echo "$TIMESTAMP | $CONTAINER_NAME | STATUS:NOT RUNNING" >> "$LOG_FILE"
else
	IFS="|" read -r NAME CPU MEM <<< "$STATS"
        echo "$TIMESTAMP | $NAME | CPU: $CPU | MEM: $MEM" >> "$LOG_FILE"
fi
