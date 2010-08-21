$(call inherit-product, build/target/product/generic.mk)

# How this product is called in the build system
PRODUCT_NAME := koush_aloha

# Which actual hardware this is based on (this is a path under vendor/)
PRODUCT_MANUFACTURER := lg
PRODUCT_DEVICE := aloha

# The user-visible product name
PRODUCT_MODEL := LG Ally

ifeq ($(TARGET_PRODUCT),$(PRODUCT_NAME))
TARGET_PREBUILT_RECOVERY_KERNEL := vendor/koush/prebuilt/$(PRODUCT_DEVICE)_recovery_kernel
endif

include vendor/lg/aloha/device_aloha.mk
