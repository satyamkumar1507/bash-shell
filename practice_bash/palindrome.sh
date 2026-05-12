#!/bin/bash

read -p "Enter string" STR

REV=$(echo "$STR" | rev)

if [[ "$STR" == "$REV" ]]
then
	echo "$STR is palindrome"
else
	echo "$STR is not palindrome"
fi
