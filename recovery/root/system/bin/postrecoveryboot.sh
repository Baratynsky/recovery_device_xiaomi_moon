#!/system/bin/sh


# find necessary modules for touchscreen, etc. to ensure no mismatch with kernel
copy-modules()
{
    if grep -Fq twrpfastboot /proc/cmdline
    then
        echo "using ramdisk modules (fastboot boot)"
        return
    fi

    if [ -f /lib/modules/modules.load.recovery -a -f /lib/modules/xiaomi_touch.ko ] && lsmod | grep -Fq xiaomi_touch
    then
        echo "using vendor_boot modules"
        exit 0
    fi

    suffix=$(getprop ro.boot.slot_suffix)
    if [ -z "$suffix" ]
    then
        suffix="_$(getprop ro.boot.slot)"
    fi

    echo "using vendor$suffix modules"
    mkdir /v
    mount -t ext4 -o ro /dev/block/mapper/vendor$suffix /v
    rm -f /vendor_dlkm/lib/modules/*
    cp -afR /v/lib/modules/* /vendor_dlkm/lib/modules/
    umount /v
    rmdir /v
}

install-touch()
{
    if [ -f /lib/modules/modules.load.recovery -a -f /lib/modules/xiaomi_touch.ko ] && lsmod | grep -Fq xiaomi_touch
    then
        if grep -Fq twrpfastboot /proc/cmdline; then
            MODULES=$(lsmod | tail +2 | awk '{ printf $1 }')
            for i in $MODULES
            do
                rmmod $i
            done
        else
            echo "vendor_boot touchscreen modules already loaded"
            exit 0
        fi
    fi

    if [ ! -f /vendor_dlkm/lib/modules/xiaomi_touch.ko ]
    then
        echo "! vendor touchscreen modules not found"
        exit 1
    fi

    echo "loading vendor touchscreen modules"
    device=$(getprop ro.boot.hardware.sku)
    if [ "${device}" == "haydn" ] || [ "${device}" == "haydn_in" ] || [ "${device}" == "haydnpro" ]; then
        for module in $(modprobe -D -d /vendor_dlkm/lib/modules focaltech_tp  | grep modules)
        do
            insmod /vendor_dlkm/lib/modules/$(basename $module)
        done
        exit 0
    fi

    for module in $(modprobe -D -d /vendor/lib/modules focaltech_tp  | grep modules)
    do
        insmod /vendor_dlkm/lib/modules/$(basename $module)
    done
}

copy-modules
install-touch

exit 0
