$(call inherit-product, build/target/product/generic.mk)

# How this product is called in the build system
PRODUCT_NAME := koush_galaxys

# Which actual hardware this is based on (this is a path under vendor/)
PRODUCT_MANUFACTURER := samsung
PRODUCT_DEVICE := galaxys

# The user-visible product name
PRODUCT_MODEL := Samsung Galaxy S

include vendor/samsung/galaxys/device_galaxys.mk
