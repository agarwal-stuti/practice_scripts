#!/bin/bash

SOURCE_DIR="/home/celestial/Desktop/Files"
DEST_DIR="/home/celestial/Desktop/Backups"

TIME=$(date +"%Y%m%d%H%M%S")

BACKUP_FILE="bckup_$TIME.tar.gz"

tar -czf "$DEST_DIR/$BACKUP_FILE" -C "$SOURCE_DIR" .
#exit_status=$?
if [ $? -eq 0 ]; then
	echo "Backup created successfully: $DEST_DIR/$BACKUP_FILE"
else
	echo "Backup failed."

fi

