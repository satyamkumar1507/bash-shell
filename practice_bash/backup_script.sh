#!/bin/bash


src=$1
dest=$2

timestamp=$(date '+%Y-%m-%d')

tar -czvf $dest/backups-$timestamp.tar.gz $src > /dev/null

echo "Backup completed"
