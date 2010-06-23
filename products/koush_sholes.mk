$(call inherit-product, vendor/koush/products/koush.mk)

# How this product is called in the build system
PRODUCT_NAME := koush_sholes

# Which actual hardware this is based on (this is a path under vendor/)
PRODUCT_MANUFACTURER := motorola
PRODUCT_DEVICE := sholes

# The user-visible product name
PRODUCT_MODEL := Motorola Droid (US)

ifeq ($(TARGET_PRODUCT),$(PRODUCT_NAME))
TARGET_PREBUILT_RECOVERY_KERNEL := vendor/koush/prebuilt/$(PRODUCT_DEVICE)_recovery_kernel
endif

include vendor/motorola/sholes/device_sholes.mk
