#!/bin/bash


if systemctl is-active --quiet nginx
then
	echo "nginx running"
else
	echo "nginx not running"
fi
