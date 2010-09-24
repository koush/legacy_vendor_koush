$(call inherit-product, build/target/product/generic.mk)

# How this product is called in the build system
PRODUCT_NAME := koush_droid2

# Which actual hardware this is based on (this is a path under vendor/)
PRODUCT_MANUFACTURER := motorola
PRODUCT_DEVICE := droid2

# The user-visible product name
PRODUCT_MODEL := Motorola Droid 2

include vendor/motorola/droid2/device_droid2.mk
