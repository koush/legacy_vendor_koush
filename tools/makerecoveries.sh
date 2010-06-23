if [ -z "$1" ]
then
    echo "Please provide a version number."
    return
fi

if [ -z "$2" ]
then
    PRODUCTS='koush_inc-eng koush_supersonic-eng koush_bravo-eng koush_dream-eng koush_sapphire-eng koush_passion-eng cyanogen_sholes-eng koush_magic-eng koush_hero-eng koush_heroc-eng koush_desirec-eng'
else
    PRODUCTS=$2
fi

unset PUBLISHED_RECOVERIES

for lunchoption in $PRODUCTS
do
    lunch $lunchoption
    rm -rf $OUT/obj/EXECUTABLES/recovery_intermediates
    rm -rf $OUT/recovery*
    rm -rf $OUT/root*
    make installclean
    DEVICE_NAME=$(echo $TARGET_PRODUCT | sed s/koush_// | sed s/aosp_// | sed s/_us// | sed s/cyanogen_//)
    make -j16 recoveryimage
    RESULT=$?
    if [ $RESULT != "0" ]
    then
        echo build error!
        break
    fi
    PUBLISHED_RECOVERIES=$PUBLISHED_RECOVERIES' '$(REALLY_SMALL_MCP=true mcp $OUT/recovery.img recoveries/recovery-clockwork-$DEVICE_NAME.img)
    SMALL_MCP=true mcp $OUT/recovery.img recoveries/recovery-clockwork-$1-$DEVICE_NAME.img

    if [ $DEVICE_NAME == "bravo" ]
    then
        . vendor/koush/tools/mkrecoveryzip.sh $1
        SMALL_MCP=true mcp $OUT/utilities/update.zip recoveries/recovery-clockwork-$1-$DEVICE_NAME.zip
        REALLY_SMALL_MCP=true mcp $OUT/utilities/update.zip recoveries/recovery-clockwork-$DEVICE_NAME.zip
    fi
    
    if [ $DEVICE_NAME == "inc" ]
    then
        . vendor/koush/tools/mkrecoveryzip.sh $1
        SMALL_MCP=true mcp $OUT/utilities/update.zip recoveries/recovery-clockwork-$1-$DEVICE_NAME.zip
        REALLY_SMALL_MCP=true mcp $OUT/utilities/update.zip recoveries/recovery-clockwork-$DEVICE_NAME.zip
    fi

    if [ $DEVICE_NAME == "dream" ]
    then
        echo No Legend!
        #. vendor/koush/tools/mkrecoveryzip.sh $1
        #SMALL_MCP=true mcp $OUT/utilities/update.zip recoveries/recovery-clockwork-$1-legend.zip
        #SMALL_MCP=true mcp $OUT/utilities/update.zip recoveries/recovery-clockwork-legend.zip
    fi
done

for published_recovery in $PUBLISHED_RECOVERIES
do
    echo $published_recovery
done
