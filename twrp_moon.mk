# device/xiaomi/moon/twrp_moon.mk

# Source
$(call inherit-product, vendor/twrp/config/common.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/base.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/gsi/gsi_keys.mk)

# Device identifier
PRODUCT_DEVICE := moon
PRODUCT_NAME := twrp_moon # <-- ИЗМЕНЕНО
PRODUCT_BRAND := Redmi
PRODUCT_MODEL := 24040RN64Y
PRODUCT_MANUFACTURER := Xiaomi

# Build Fingerprint
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.vendor.build.fingerprint=Redmi/moon_ru/moon:15/AP3A.240905.015.A2/OS2.0.5.0.VNTRUXM:user/release-keys
