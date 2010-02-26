if [ -z "$1" ]
then
    echo "Please provide a version number."
    return
fi

PUBLISH_PATH=~/Desktop/recovery/

rm -r $PUBLISH_PATH
mkdir -p $PUBLISH_PATH

for lunchoption in aosp_dream_us-eng aosp_sapphire_us-eng cyanogen_passion-eng cyanogen_sholes-eng koush_magic_us-eng koush_hero-eng
do
    lunch $lunchoption
    DEVICE_NAME=$(echo $TARGET_PRODUCT | sed s/koush_// | sed s/aosp_// | sed s/_us// | sed s/cyanogen_//)
    make -j16 recoveryimage 
    ccp $OUT/recovery.img recoveries/recovery-clockwork-$1-$DEVICE_NAME.img
done
