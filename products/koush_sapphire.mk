$(call inherit-product, build/target/product/generic.mk)

# How this product is called in the build system
PRODUCT_NAME := koush_sapphire

# Which actual hardware this is based on (this is a path under vendor/)
PRODUCT_MANUFACTURER := htc
PRODUCT_DEVICE := sapphire-open

# The user-visible product name
PRODUCT_MODEL := Sapphire (US)

ifeq ($(TARGET_PRODUCT),$(PRODUCT_NAME))
TARGET_PREBUILT_RECOVERY_KERNEL := vendor/koush/prebuilt/dream_sapphire_recovery_kernel
endif

include vendor/htc/sapphire-open/device_sapphire_us.mk
