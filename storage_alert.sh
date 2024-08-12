#!/bin/bash
THRESHOLD=90
DISK_USAGE=$(df -H / | awk 'NR==2 {print $5}' | cut -d'%' -f1)
if [ "$DISK_USAGE" -ge "$THRESHOLD" ]; then
	SUBJECT="Disk Space Alert - $DISK_USAGE% Used"
	MESSAGE= "Warning: Disk Usage is at $DISK_USAGE%. CleanUp Initiated."
	echo "$MESSAGE" | mail -s "$SUBJECT" stuti.agarwal@celestialsys.com
	#echo "Warning: Disk Usage is at $DISK_USAGE%."
	echo "Performing CleanUp..."



	NEW_DISK_USAGE=$(df -H / | awk 'NR==2 {print $5}' | cut -d'%' -f1)
	if [ "$NEW_DISK_USAGE" -lt "$THRESHOLD" ]; then
		echo "Cleanup Successful. Disk usage reduced to $NEW_DISK_USAGE%."
	else
		echo "Cleanup was not sufficient. Disk usage is still high at $NEW_DISK_USAGE%."
	fi
else
	echo "Disk usage is at $DISK_USAGE%, no action needed."
fi
