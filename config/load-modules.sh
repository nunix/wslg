#!/bin/sh

echo Install kernel headers and modules
sudo make --directory="/mnt/c/wslkernel/latest" headers_install modules_install >/dev/null

echo Export list of modules
sudo awk '(NR>1) { print $2 }' /usr/lib/modules/$(uname -r)/modules.alias | sudo tee /mnt/c/wslkernel/latest/modules.txt >/dev/null

echo Load modules
for module in `cat /mnt/c/wslkernel/latest/modules.txt`; do sudo modprobe $module; done