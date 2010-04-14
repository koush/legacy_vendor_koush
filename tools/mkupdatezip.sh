#!/bin/bash

if [ -z $1 ]
then
    echo "Usage: mkupdatezip.sh <nandroid directory> <output zip>"
    exit
fi

if [ -z $2 ]
then
    echo "Usage: mkupdatezip.sh <nandroid directory> <output zip>"
    exit
fi

if [ -z $ANDROID_BUILD_TOP ]
then
    echo "Android build environment not found!"
    exit
fi

CURDIR=$(pwd)
NANDROID=$CURDIR/$1
MYDIR=/tmp/mkupdatezip
rm -rf $MYDIR
mkdir -p $MYDIR
cd $MYDIR
cp -r $ANDROID_BUILD_TOP/vendor/koush/tools/package $MYDIR/package

cd $MYDIR
cd package
rm -rf SYSTEM
mkdir -p SYSTEM
cd SYSTEM
unyaffs $NANDROID/system.img

cd $MYDIR
unpackbootimg $NANDROID/boot.img
cd package
rm -rf BOOT
mkdir -p BOOT
cd BOOT
cp /tmp/boot.img-base base
cp $MYDIR/boot.img-cmdline cmdline
cp $MYDIR/boot.img-zImage kernel
mkdir -p RAMDISK
cd RAMDISK
gunzip -c $MYDIR/boot.img-ramdisk.gz | cpio -id

cd $MYDIR
unpackbootimg $NANDROID/recovery.img
cd package
rm -rf RECOVERY
mkdir -p RECOVERY
cd RECOVERY
cp $MYDIR/recovery.img-base base
cp $MYDIR/recovery.img-cmdline cmdline
cp $MYDIR/recovery.img-zImage kernel
mkdir -p RAMDISK
cd RAMDISK
gunzip -c $MYDIR/recovery.img-ramdisk.gz | cpio -id

# hackity hack hack
chmod +r $MYDIR/package/SYSTEM/app/Launcher2.apk
chmod +r $MYDIR/package/SYSTEM/app/Launcher.apk

cd $MYDIR
rm -f intermediate.zip
cd package
zip -ry ../intermediate.zip .
cd $MYDIR
cd ~/android
build/tools/releasetools/ota_from_target_files -n -m amend -p out/host/darwin-x86 $MYDIR/intermediate.zip $CURDIR/$2
