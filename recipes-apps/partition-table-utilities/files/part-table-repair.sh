#!/bin/bash

# Specify the device as the rootfs device (normally, this is identified by /dev/root)
DEVICE="/dev/root"
BACKUP="/root/gpt_backup.bin"

# Check if a backup file exists
if ! test -f $BACKUP; then
    echo "PART-REPAIR: no backup found to repair the partition table from!" | sudo tee /dev/kmsg
    # Take some action if repair is not possible
    exit 1
fi

# Repair the GPT partition table from the defined backup
sgdisk --load-backup="$BACKUP" "$DEVICE"
if [ $? -eq 0 ]; then
    echo "PART-REPAIR: Partition table at $DEVICE repaired from $BACKUP" | sudo tee /dev/kmsg
else
    echo "PART-REPAIR: Error while repairing partition table of $DEVICE: " >&2 | sudo tee /dev/kmsg
    exit 1
fi