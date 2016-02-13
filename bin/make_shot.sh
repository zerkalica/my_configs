#!/bin/sh

xfce4-screenshooter -s ~/Yandex.Disk/screenshots/ -r
yandex-disk sync
yandex-disk publish "$(ls -td ~/Yandex.Disk/screenshots/*|head -n 1)"|xclip
