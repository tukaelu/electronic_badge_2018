#!/bin/bash
# virtual_sd（NAFUDAドライブ）を削除し、ID/PASSをraspbian初期のものにする。
# 再度再起動後にID/PASSなどを生成したい場合につかう

if [ 0 -ne ${EUID:-${UID}} ]
then
	echo "You need to be root to perform this command."
	exit 1
fi

echo "pi:raspberry" | /usr/sbin/chpasswd
echo "raspberrypi" > /etc/hostname
/bin/hostname "raspberrypi"

umount /mnt/virtual_sd
rm /home/pi/virtual_sd.img
