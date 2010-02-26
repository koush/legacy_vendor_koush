#
# Copyright (C) 2009 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# This is the top-level configuration for a US-configured AOSP build

$(call inherit-product, vendor/koush/products/koush_core.mk)

PRODUCT_NAME := koush_us
PRODUCT_BRAND := koush
PRODUCT_DEVICE := generic

PRODUCT_PROPERTY_OVERRIDES += \
	ro.com.android.dateformat=MM-dd-yyyy \
        ro.com.android.dataroaming=true \
        ro.ril.hsxpa=1 \
        ro.ril.gprsclass=10

PRODUCT_COPY_FILES += vendor/koush/etc/apns-conf.xml:system/etc/apns-conf.xml
