#!/bin/bash

# Specify the device as the rootfs device (normally, this is identified by /dev/root)
DEVICE="/dev/root"
BACKUP="/root/gpt_backup.bin"

# Create a backup of the whole GPT partition tables (primary and secondary)
sgdisk --backup="$BACKUP" "$DEVICE"
if [ $? -eq 0 ]; then
    echo "PART-BACKUP: Backup of partition table at $DEVICE saved in $BACKUP" | sudo tee /dev/kmsg
else
    echo "PART-BACKUP: Error while backing up the partition table of $DEVICE" >&2 | sudo tee /dev/kmsg
    exit 1
fi