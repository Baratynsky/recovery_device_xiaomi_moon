#
# Copyright (C) 2025 The Android Open Source Project
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/xiaomi/moon

# Inherit from device.mk configuration
$(call inherit-product, $(DEVICE_PATH)/device.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := moon
PRODUCT_NAME := twrp_moon
PRODUCT_BRAND := Redmi
PRODUCT_MODEL := Redmi 13
PRODUCT_MANUFACTURER := Xiaomi
