if [ -z "$1" ]
then
    echo "Please provide a version number."
    return
fi

if [ -z $2 ]
then
    PRODUCTS='aosp_dream_us-eng aosp_sapphire_us-eng cyanogen_passion-eng cyanogen_sholes-eng koush_magic_us-eng koush_hero-eng koush_heroc-eng koush_desirec-eng'
else
    PRODUCTS=$2
fi

PUBLISH_PATH=~/Desktop/recovery/

rm -r $PUBLISH_PATH
mkdir -p $PUBLISH_PATH


for lunchoption in $PRODUCTS
do
    lunch $lunchoption
    rm -rf $OUT/obj/EXECUTABLES/recovery_intermediates
    DEVICE_NAME=$(echo $TARGET_PRODUCT | sed s/koush_// | sed s/aosp_// | sed s/_us// | sed s/cyanogen_//)
    make -j16 recoveryimage 
    PUBLISHED_RECOVERIES=$PUBLISHED_RECOVERIES' '$(mcp $OUT/recovery.img recoveries/recovery-clockwork-$DEVICE_NAME.img)
    mcp $OUT/recovery.img recoveries/recovery-clockwork-$1-$DEVICE_NAME.img
done

for published_recovery in $PUBLISHED_RECOVERY
do
    echo $published_recovery
done
