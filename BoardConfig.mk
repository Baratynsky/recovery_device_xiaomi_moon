# device/xiaomi/moon/BoardConfig.mk

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_VARIANT := cortex-a53
TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a53

# Platform
TARGET_BOARD_PLATFORM := mt6768
TARGET_BOARD_SUFFIX := _64
TARGET_USES_64_BIT_BINDER := true

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := moon
TARGET_NO_BOOTLOADER := true

# Kernel
BOARD_KERNEL_BASE := 0x40078000
BOARD_KERNEL_PAGESIZE := 4096
BOARD_RAMDISK_OFFSET := 0x07c08000
BOARD_TAGS_OFFSET := 0x0bc08000
BOARD_DTB_OFFSET := 0x0bc08000
BOARD_KERNEL_CMDLINE := bootopt=64S3,32N2,64N2

# Prebuilt Images
TARGET_PREBUILT_KERNEL := device/xiaomi/moon/prebuilt/kernel
TARGET_PREBUILT_DTB := device/xiaomi/moon/prebuilt/dtb.img
BOARD_PREBUILT_DTBOIMAGE := device/xiaomi/moon/prebuilt/dtbo.img

# Vendor Boot & Header version
BOARD_BOOT_HEADER_VERSION := 4
BOARD_USES_VENDOR_BOOT := true
BOARD_VENDOR_BOOTIMAGE_PARTITION_SIZE := 67108864
BOARD_RAMDISK_USE_LZ4 := true

# Аргументы для mkbootimg
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOT_HEADER_VERSION)
BOARD_MKBOOTIMG_ARGS += --ramdisk_offset $(BOARD_RAMDISK_OFFSET)
BOARD_MKBOOTIMG_ARGS += --tags_offset $(BOARD_TAGS_OFFSET)
BOARD_MKBOOTIMG_ARGS += --dtb $(TARGET_PREBUILT_DTB)
BOARD_MKBOOTIMG_ARGS += --dtb_offset $(BOARD_DTB_OFFSET)

# A/B, System-as-root & Recovery settings
TARGET_NO_RECOVERY := true
BOARD_BUILD_SYSTEM_ROOT_IMAGE := false
BOARD_INCLUDE_RECOVERY_DTBO := true
BOARD_SUPPRESS_SECURE_ERASE := true

# НОВОЕ: Virtual A/B
TW_INCLUDE_VIRTUAL_AB := true
BOARD_USES_VIRTUAL_AB := true

# Partitions & Filesystems
TARGET_RECOVERY_FSTAB := device/xiaomi/moon/recovery/root/etc/recovery.fstab
TARGET_USERIMAGES_USE_F2FS := true

# TWRP specific settings
TW_THEME := portrait_hdpi
TARGET_RECOVERY_PIXEL_FORMAT := "BGRA_8888"
RECOVERY_SDCARD_ON_DATA := true
TW_EXCLUDE_DEFAULT_USB_INIT := true
TW_EXTRA_LANGUAGES := true
TW_INCLUDE_CRYPTO := true
TW_INCLUDE_CRYPTO_FBE := true
TW_INCLUDE_FBE_METADATA_DECRYPT := true
TW_INCLUDE_NTFS_3G := true
TW_USE_TOOLBOX := true
TW_INPUT_BLACKLIST := "hbtp_vm"

# Vendor modules
# BOARD_VENDOR_KERNEL_MODULES_LOAD := $(strip $(shell cat device/xiaomi/moon/modules.load))
# BOARD_VENDOR_KERNEL_MODULES_BLOCKLIST_FILE := device/xiaomi/moon/modules.blocklist

# Boot Control HAL для корректной работы с A/B слотами
TARGET_BOOT_CONTROL_HALS := android.hardware.boot@1.2-mtkimpl

# Дополнительные модули, которые нужно включить в рекавери
TARGET_RECOVERY_DEVICE_MODULES := create_pl_dev

# Кастомная библиотека инициализации для специфичных действий при загрузке
TARGET_INIT_VENDOR_LIB := init_moon
