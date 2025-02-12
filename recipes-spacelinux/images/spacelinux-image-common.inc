# Ensure that every image has at least a ssh server
IMAGE_FEATURES += "ssh-server-openssh"

LICENSE = "MIT"

inherit core-image

inherit nopackages