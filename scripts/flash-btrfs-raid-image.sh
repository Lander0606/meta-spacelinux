#!/bin/sh

# IMPORTANT: run this script as sudo!
if [ "$EUID" -ne 0 ]
then echo "ERROR: this script needs to run as root!"
exit
fi

# Search the 2 btrfs partitions needed for a raid1 configuration
part1_file=$(ls *part1.btrfs 2>/dev/null)
part2_file=$(ls *part2.btrfs 2>/dev/null)

# Check if all needed partitions are found
if [ -z "$part1_file" ] || [ -z "$part2_file" ]; then
  echo "ERROR: 2 BTRFS partitions are needed to create a raid1 system"
  exit
else
  echo "Found partition 1: $part1_file"
  echo "Found partition 2: $part2_file"
fi

# Couple btrfs filesystem files to loop devices
LOOP1=$(losetup -f --show "$part1_file")
LOOP2=$(losetup -f --show "$part2_file")

echo "Using loop devices: $LOOP1 and $LOOP2"

# Create mount directory if it doesn't exist
mkdir -p ./btrfs-mount

# Mount the first filesystem, specifying the filesystem type explicitly
mount -t btrfs "$LOOP1" ./btrfs-mount || { 
  echo "ERROR: Failed to mount $LOOP1"; 
  losetup -d "$LOOP1" "$LOOP2"; 
  exit 1; 
}

# Add the second filesystem and configure raid1
echo "Adding device $LOOP2 to the btrfs filesystem..."
btrfs device add -f "$LOOP2" ./btrfs-mount || {
  echo "ERROR: Failed to add device";
  umount ./btrfs-mount;
  losetup -d "$LOOP1" "$LOOP2";
  exit 1;
}

echo "Starting RAID1 conversion..."
btrfs balance start -dconvert=raid1 -mconvert=raid1 ./btrfs-mount || {
  echo "ERROR: Balance failed";
  umount ./btrfs-mount;
  losetup -d "$LOOP1" "$LOOP2";
  exit 1;
}

# Synchronize and unmount
echo "Syncing and unmounting..."
sync
umount ./btrfs-mount || echo "Warning: unmount failed"

# Remove the loop devices
losetup -d "$LOOP1" || echo "Warning: Failed to detach $LOOP1"
losetup -d "$LOOP2" || echo "Warning: Failed to detach $LOOP2"

# Flash the image like we used to
echo "Flashing image..."
./dosdcard.sh image.img