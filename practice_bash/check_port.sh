#!/bin/bash

port=80

if netstat -tuln | grep -q ":$port" 
then
	echo "port $port is open"
else
	echo "port $port is closed"
fi
