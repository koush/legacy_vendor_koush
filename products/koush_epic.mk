$(call inherit-product, build/target/product/generic.mk)

# How this product is called in the build system
PRODUCT_NAME := koush_epic

# Which actual hardware this is based on (this is a path under vendor/)
PRODUCT_MANUFACTURER := samsung
PRODUCT_DEVICE := epic

# The user-visible product name
PRODUCT_MODEL := Samsung Epic

include vendor/samsung/epic/device_epic.mk
