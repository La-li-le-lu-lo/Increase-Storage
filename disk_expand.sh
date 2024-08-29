#!/bin/bash

# Script to expand storage on linux machines


echo "Check Storage:"
df -h
echo "-----------------------------"
echo "Which logical volume "
read lv
echo "-----------------------------"
echo "Check Volume Group:"
vgs
echo "-----------------------------"
echo "Which vg"
read vg
if [ $vg ]; then
  lvs $vg
else
  echo "No Input Selected Exiting Program"
  exit
fi
#sleep 10
echo "-----------------------------"
echo "How much space to expand by in G"
read space
lvextend -L +$space /dev/$vg/$lv -r
echo "Lets Verify the disk has increased"
df -h | grep $lv
