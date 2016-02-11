#!/bin/sh

PROFILES_DIR=$HOME/.synced.ram

[ -d $PROFILES_DIR ] || mkdir -p $PROFILES_DIR
echo $PROFILES_DIR to $HOME

#.gconf

DIRS=".mozilla
.cache
.config/google-chrome
.config/google-chrome-beta"

#DIRS=".mozilla"

copy_to_ram() {
    for i in $DIRS ; do
        rsync -av $PROFILES_DIR/$i/ $HOME/$i
    done
}

copy_from_ram() {
    for i in $DIRS ; do
        rsync -av -o -p --delete --recursive --force $HOME/$i/ $PROFILES_DIR/$i
    done
}

case "$1" in
  start)
    echo "Copying files to ramdisk"
    copy_to_ram
    echo [`date +"%Y-%m-%d %H:%M"`] Ramdisk Synched from HD
    ;;
  sync)
    echo "Synching files from ramdisk to Harddisk"
    echo [`date +"%Y-%m-%d %H:%M"`] Ramdisk Synched to HD
    copy_from_ram
    ;;
  stop)
    echo "Synching files from ramdisk to Harddisk"
    echo [`date +"%Y-%m-%d %H:%M"`] Ramdisk Synched to HD
    copy_from_ram
    ;;
  *)
    echo "Usage: /etc/init.d/ramdisk {start|stop|sync}"
    exit 1
    ;;
esac

exit 0
