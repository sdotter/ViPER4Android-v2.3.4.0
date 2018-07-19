#!/system/bin/sh
# Please don't hardcode /magisk/modname/... ; instead, please use $MODDIR/...
# This will make your scripts compatible even if Magisk change its mount point in the future
MODDIR=${0%/*}

# This script will be executed in late_start service mode
# More info in the main Magisk thread

# selinux enforcing processing on most of devices
magiskpolicy --live "allow mediaserver audioserver_tmpfs file { read write execute }"
magiskpolicy --live "allow audioserver audioserver_tmpfs file { read write execute }"

# OnePlus 5/5T and others(?)
magiskpolicy --live "allow hal_audio_default hal_audio_default process { execmem }"

# Fix everything on boot...
am start -a android.intent.action.MAIN -n <ACTIVITY>/.activity.ViPER4Android
killall <ACTIVITY>
killall audioserver