if [ -z "$1" ]
then
    echo "Please provide a version number."
    return
fi

if [ -z "$2" ]
then
    PRODUCTS='koush_legend-eng koush_pulsemini-eng koush_liberty-eng cyanogen_inc-eng koush_supersonic-eng koush_bravo-eng koush_dream-eng koush_sapphire-eng koush_passion-eng cyanogen_sholes-eng koush_magic-eng koush_hero-eng koush_heroc-eng koush_desirec-eng'
else
    PRODUCTS=$2
fi

unset PUBLISHED_RECOVERIES

function mcpguard () {
    if [ -z $NO_UPLOAD ]
    then
        mcp $1 $2
    fi
}


for lunchoption in $PRODUCTS
do
    lunch $lunchoption
    if [ -z $NO_CLEAN ]
    then
        rm -rf $OUT/obj/EXECUTABLES/recovery_intermediates
        rm -rf $OUT/recovery*
        rm -rf $OUT/root*
    fi
    DEVICE_NAME=$(echo $TARGET_PRODUCT | sed s/koush_// | sed s/aosp_// | sed s/_us// | sed s/cyanogen_//)
    make -j16 recoveryimage
    RESULT=$?
    if [ $RESULT != "0" ]
    then
        echo build error!
        break
    fi
    SMALL_MCP=true md5sum $OUT/recovery.img > $OUT/recovery.img.md5sum.txt
    mcpguard $OUT/recovery.img.md5sum recoveries/recovery-clockwork-$DEVICE_NAME.img.md5sum.txt
    SMALL_MCP=true mcpguard $OUT/recovery.img recoveries/recovery-clockwork-$1-$DEVICE_NAME.img
    SMALL_MCP=true mcpguard $OUT/recovery.img.md5sum.txt recoveries/recovery-clockwork-$1-$DEVICE_NAME.img.md5sum.txt

    if [ $DEVICE_NAME == "bravo" ]
    then
        . vendor/koush/tools/mkrecoveryzip.sh $1
        SMALL_MCP=true mcpguard $OUT/utilities/update.zip recoveries/recovery-clockwork-$1-$DEVICE_NAME.zip
        REALLY_SMALL_MCP=true mcpguard $OUT/utilities/update.zip recoveries/recovery-clockwork-$DEVICE_NAME.zip
    fi
    
    if [ $DEVICE_NAME == "inc" ]
    then
        . vendor/koush/tools/mkrecoveryzip.sh $1
        SMALL_MCP=true mcpguard $OUT/utilities/update.zip recoveries/recovery-clockwork-$1-$DEVICE_NAME.zip
        REALLY_SMALL_MCP=true mcpguard $OUT/utilities/update.zip recoveries/recovery-clockwork-$DEVICE_NAME.zip
    fi

    if [ $DEVICE_NAME == "liberty" ]
    then
        . vendor/koush/tools/mkrecoveryzip.sh $1
        SMALL_MCP=true mcpguard $OUT/utilities/update.zip recoveries/recovery-clockwork-$1-$DEVICE_NAME.zip
        REALLY_SMALL_MCP=true mcpguard $OUT/utilities/update.zip recoveries/recovery-clockwork-$DEVICE_NAME.zip
    fi

    if [ $DEVICE_NAME == "legend" ]
    then
        . vendor/koush/tools/mkrecoveryzip.sh $1
        SMALL_MCP=true mcpguard $OUT/utilities/update.zip recoveries/recovery-clockwork-$1-$DEVICE_NAME.zip
        REALLY_SMALL_MCP=true mcpguard $OUT/utilities/update.zip recoveries/recovery-clockwork-$DEVICE_NAME.zip
    fi
done

for published_recovery in $PUBLISHED_RECOVERIES
do
    echo $published_recovery
done
