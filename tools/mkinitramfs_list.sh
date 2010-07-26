#!/bin/bash


pushd . > /dev/null
if [ -z "$1" ]
then
    cd $OUT/recovery/root
else
    cd $1
fi

for file in $(find . | grep -v \\.git)
do
    if [ "$file" == "." ]
    then
        continue
    fi
    if [ -L $file ]
    then
        continue
    fi
    if [ -d $file ]
    then
        file=$(echo $file | sed s#\\./##g)
        if [ "$file" = "" ]
        then
            continue
        fi
        echo dir /$file 755 0 0
    fi
done


for file in $(find . | grep -v \\.git)
do
    if [ -d $file ]
    then
        continue
    fi
    if [ ! -L $file ]
    then
        file=$(echo $file | sed s#\\./##g)
        if [ $file == "README.txt" ]
        then
            continue
        fi
        echo -n file /$file $(pwd)/$file" "
        if [ -x $file ]
        then
            echo 777 0 0
        else
            echo 666 0 0
        fi
    fi
done


for file in $(find . | grep -v \\.git)
do
    if [ -L $file ]
    then
        file=$(echo $file | sed s#\\./##g)
        echo slink /$file $(readlink $file) 777 0 0
    fi
done

popd > /dev/null
