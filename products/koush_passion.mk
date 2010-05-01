$(call inherit-product, build/target/product/generic.mk)

# How this product is called in the build system
PRODUCT_NAME := koush_passion

# Which actual hardware this is based on (this is a path under vendor/)
PRODUCT_MANUFACTURER := google
PRODUCT_DEVICE := passion

# The user-visible product name
PRODUCT_MODEL := Passion (US)

ifeq ($(TARGET_PRODUCT),$(PRODUCT_NAME))
TARGET_PREBUILT_RECOVERY_KERNEL := vendor/koush/prebuilt/$(PRODUCT_DEVICE)_recovery_kernel
endif

include vendor/google/passion/device_passion.mk
