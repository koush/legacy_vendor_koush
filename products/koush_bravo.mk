$(call inherit-product, build/target/product/generic.mk)

# How this product is called in the build system
PRODUCT_NAME := koush_bravo

# Which actual hardware this is based on (this is a path under vendor/)
PRODUCT_MANUFACTURER := htc
PRODUCT_DEVICE := bravo

# The user-visible product name
PRODUCT_MODEL := HTC Desire

ifeq ($(TARGET_PRODUCT),$(PRODUCT_NAME))
TARGET_PREBUILT_RECOVERY_KERNEL := vendor/koush/prebuilt/$(PRODUCT_DEVICE)_recovery_kernel
endif

include vendor/htc/bravo/device_bravo.mk
