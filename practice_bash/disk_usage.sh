#!/bin/bash

USAGE=$(df | awk '$NF=="/" {print $5}')

echo "Root disk usage: $USAGE"
