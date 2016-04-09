$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)
# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

$(call inherit-product-if-exists, vendor/xiaomi/libra/libra-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += device/xiaomi/libra/overlay

ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := $(LOCAL_PATH)/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

$(call inherit-product, build/target/product/full.mk)

PRODUCT_NAME := full_libra
PRODUCT_DEVICE := libra
PRODUCT_MANUFACTURER := Xiaomi
PRODUCT_MODEL := Mi-4c