#!/bin/bash

# Reverse fastbootd ENG mode check
echo -e "\nPatching ramdisk/system/bin/recovery ..."
sleep 1
for i in \
"magiskboot_x86 hexpatch system/bin/recovery e10313aaf40300aa6ecc009420010034 e10313aaf40300aa6ecc0094 # 20 01 00 35" \
"magiskboot_x86 hexpatch system/bin/recovery eec3009420010034 eec3009420010035" \
"magiskboot_x86 hexpatch system/bin/recovery 3ad3009420010034 3ad3009420010035" \
"magiskboot_x86 hexpatch system/bin/recovery 50c0009420010034 50c0009420010035" \
"magiskboot_x86 hexpatch system/bin/recovery 080109aae80000b4 080109aae80000b5" \
"magiskboot_x86 hexpatch system/bin/recovery 20f0a6ef38b1681c 20f0a6ef38b9681c" \
"magiskboot_x86 hexpatch system/bin/recovery 23f03aed38b1681c 23f03aed38b9681c" \
"magiskboot_x86 hexpatch system/bin/recovery 20f09eef38b1681c 20f09eef38b9681c" \
"magiskboot_x86 hexpatch system/bin/recovery 26f0ceec30b1681c 26f0ceec30b9681c" \
"magiskboot_x86 hexpatch system/bin/recovery 24f0fcee30b1681c 24f0fcee30b9681c" \
"magiskboot_x86 hexpatch system/bin/recovery 27f02eeb30b1681c 27f02eeb30b9681c"; do
	../$i
	result=$(( $result + $? ))
	count=$(( $count + 1 ))
done

if [[ $result != $count ]];then
	echo -e "Patching successful!\n"
else
	echo -e "No changes were made!\nAbort."
	cleanup
	exit 1
fi

sleep 3
magiskboot_x86 cpio ramdisk.cpio 'add 0755 system/bin/recovery system/bin/recovery'
magiskboot_x86 repack ../recovery.img new-boot.img
cp new-boot.img ../fastbootd-recovery.img
