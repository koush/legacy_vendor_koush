$(call inherit-product, build/target/product/generic.mk)

# How this product is called in the build system
PRODUCT_NAME := koush_tcc8902

# Which actual hardware this is based on (this is a path under vendor/)
PRODUCT_MANUFACTURER := telechips
PRODUCT_DEVICE := tcc8902

# The user-visible product name
PRODUCT_MODEL := Telechips TCC8902

include vendor/telechips/tcc8902/device_tcc8902.mk
