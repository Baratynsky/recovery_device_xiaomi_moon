# Copyright (C) 2017-2023 The Android Open Source Project
# Copyright (C) 2014-2023 The Team Win LLC
# SPDX-License-Identifier: Apache-2.0

DEVICE_PATH := device/xiaomi/moon

# For building with minimal manifest
ALLOW_MISSING_DEPENDENCIES := true

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_VARIANT_RUNTIME := cortex-a53

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-a
TARGET_2ND_CPU_ABI := armeabi-v7a

# Bootloader & Platform
TARGET_BOOTLOADER_BOARD_NAME := moon
TARGET_BOARD_PLATFORM := mt6768
TARGET_NO_BOOTLOADER := true
TARGET_USES_UEFI := true

# Kernel
# ИСПРАВЛЕНИЕ: Значение присвоено на той же строке.
# Убраны все устаревшие флаги смещения (offset), они не нужны для v4.
BOARD_BOOT_HEADER_VERSION := 4 
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOT_HEADER_VERSION)

TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilt/kernel
BOARD_RAMDISK_USE_LZ4 := true

# AVB - Android Verified Boot
BOARD_AVB_ENABLE := true
BOARD_AVB_RECOVERY_KEY_PATH := external/avb/test/data/testkey_rsa4096.pem
BOARD_AVB_RECOVERY_ALGORITHM := SHA256_RSA4096
BOARD_AVB_RECOVERY_ROLLBACK_INDEX := 1
BOARD_AVB_RECOVERY_ROLLBACK_INDEX_LOCATION := 1

# Partitions (соответствует вашему device.mk)
BOARD_FLASH_BLOCK_SIZE := 262144
BOARD_VENDOR_BOOTIMAGE_PARTITION_SIZE := 67108864
BOARD_SUPER_PARTITION_SIZE := 9126805504
BOARD_SUPER_PARTITION_GROUPS := main
BOARD_MAIN_SIZE := 9122611200
BOARD_MAIN_PARTITION_LIST := odm_dlkm system system_ext product vendor vendor_dlkm 
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := f2fs

# System as root
BOARD_BUILD_SYSTEM_ROOT_IMAGE := false

# VENDOR_BOOT RECOVERY RAMDISK (Ключевые флаги для вашей конфигурации)
TARGET_NO_RECOVERY := true
BOARD_EXCLUDE_KERNEL_FROM_RECOVERY_IMAGE := true
BOARD_MOVE_RECOVERY_RESOURCES_TO_VENDOR_BOOT := true

# Recovery
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/recovery/root/system/etc/recovery.fstab
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"

# TWRP Configuration
TW_THEME := portrait_hdpi
TW_FRAMERATE := 90
TW_MAX_BRIGHTNESS := 255
TW_CUSTOM_CPU_TEMP_PATH := "/sys/class/thermal/thermal_zone4/temp"
TW_EXCLUDE_APEX := true
TW_EXCLUDE_TWRPAPP := true
RECOVERY_SDCARD_ON_DATA := true
TW_INCLUDE_FASTBOOTD := true
TW_INCLUDE_CRYPTO := true
TW_INCLUDE_CRYPTO_FBE := true
TW_INCLUDE_FBE_METADATA_DECRYPT := true
BOARD_USES_METADATA_PARTITION := true
PLATFORM_SECURITY_PATCH := 2099-12-31
PLATFORM_VERSION := 16.1.0

# Maintainer
TW_DEVICE_VERSION := wulan17-VirtualAB-A14
