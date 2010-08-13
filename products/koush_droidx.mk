$(call inherit-product, build/target/product/generic.mk)

# How this product is called in the build system
PRODUCT_NAME := koush_droidx

# Which actual hardware this is based on (this is a path under vendor/)
PRODUCT_MANUFACTURER := motorola
PRODUCT_DEVICE := droidx

# The user-visible product name
PRODUCT_MODEL := Motorola Droid X

include vendor/motorola/droidx/device_droidx.mk
