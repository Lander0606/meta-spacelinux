#!/bin/bash

# Specify the device as the rootfs device (normally, this is identified by /dev/root)
DEVICE="/dev/mmcblk0"
BACKUP="/root/gpt_backup.bin"

# Check the GPT partition table with sgdisk (both primary and secondary partition table)
sgdisk --verify "$DEVICE"
if [ $? -ne 0 ]; then
    echo "PART-CHECK: Partition table at $DEVICE looks corrupt. Starting repair..." | tee /dev/kmsg
    if test -f /usr/bin/part-table-repair.sh; then
        /usr/bin/part-table-repair.sh
    else
        echo "PART-CHECK: Error: repair script not found!" | tee /dev/kmsg
    fi
else
    echo "PART-CHECK: Partition table at $DEVICE is fine" | tee /dev/kmsg
fi