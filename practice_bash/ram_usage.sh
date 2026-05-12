#!/bin/bash

MEM=$(free | awk '/Mem:/ {print int($3/$2 * 100)}')

echo "Memory Usage: $MEM%"

if [ "$MEM" -gt 20 ]; then
    echo "High memory usage!"
fi
