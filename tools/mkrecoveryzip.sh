#!/bin/bash

if [ -z "$1" ]
then
    echo "Please provide a version number."
    return
fi

if [ -z "$OUT" ]
then
    echo "Android build environment not detected."
    return
fi

pushd .
croot

make -j8 out/target/product/$DEVICE_NAME/system/bin/updater

UTILITIES_DIR=$OUT/utilities
RECOVERY_DIR=$UTILITIES_DIR/recovery
rm -rf $RECOVERY_DIR
mkdir -p $RECOVERY_DIR
cd $RECOVERY_DIR
cp -R $OUT/recovery/root/sbin sbin
SCRIPT_DIR=META-INF/com/google/android
mkdir -p $SCRIPT_DIR
cp $OUT/system/bin/updater $SCRIPT_DIR/update-binary


UPDATER_SCRIPT=$SCRIPT_DIR/updater-script
rm -f $UPDATER_SCRIPT
touch $UPDATER_SCRIPT
mkdir -p $(dirname $UPDATER_SCRIPT)

FILES=
SYMLINKS=

for file in $(find .)
do

if [ -d $file ]
then
  continue
fi

META_INF=$(echo $file | grep META-INF)
if [ ! -z $META_INF ]
then
    continue;
fi

if [ -h $file ]
then
    SYMLINKS=$SYMLINKS' '$file
elif [ -f $file ]
then
    FILES=$FILES' '$file
fi
done


echo 'ui_print("Replacing stock recovery with stock recovery...");' >> $UPDATER_SCRIPT
echo 'symlink("recovery", "/sbin/busybox");' >> $UPDATER_SCRIPT

for file in $FILES
do
    echo 'delete("'$(echo $file | sed s!\\./!!g)'");' >> $UPDATER_SCRIPT
    echo 'package_extract_file("'$(echo $file | sed s!\\./!!g)'", "'$(echo $file | sed s!\\./!/!g)'");' >> $UPDATER_SCRIPT
    if [ -x $file ]
    then
        echo 'set_perm(0, 0, 0755, "'$(echo $file | sed s!\\./!/!g)'");' >> $UPDATER_SCRIPT
    fi
done
    
for file in $SYMLINKS
do
    echo 'symlink("'$(readlink $file)'", "'$(echo $file | sed s!\\./!/!g)'");' >> $UPDATER_SCRIPT
done

echo 'set_perm_recursive(0, 2000, 0755, 0755, "/sbin");' >> $UPDATER_SCRIPT
echo 'run_program("/sbin/busybox", "sh", "-c", "/sbin/killrecovery.sh");' >> $UPDATER_SCRIPT
rm -f $UTILITIES_DIR/unsigned.zip
rm -f $UTILITIES_DIR/update.zip
zip -ry $UTILITIES_DIR/unsigned.zip . -x $SYMLINKS '*\[*' '*\[\[*'
java -jar ~/android/out/host/darwin-x86/framework/signapk.jar -w ~/android/build/target/product/security/testkey.x509.pem ~/android/build/target/product/security/testkey.pk8 $UTILITIES_DIR/unsigned.zip $UTILITIES_DIR/update.zip

popd
