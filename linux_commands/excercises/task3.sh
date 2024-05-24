#!/bin/bash
echo -n "Let's check your typing speed!"
if read -t 3 response;
then
	echo "Great! you made it in time"
else
	echo "Sorry you are late!"
fi
