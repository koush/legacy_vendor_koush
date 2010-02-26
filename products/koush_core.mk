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

# This is the central build configuration file for AOSP builds

$(call inherit-product, build/target/product/generic.mk)

# This is the list of apps included in the generic AOSP build
PRODUCT_PACKAGES := \
    AlarmClock \
    AlarmProvider \
    ApplicationsProvider \
    Browser \
    Bugreport \
    Calculator \
    Calendar \
    CalendarProvider \
    Camera \
    Contacts \
    ContactsProvider \
    DownloadProvider \
    DrmProvider \
    Email \
    FieldTest \
    GlobalSearch \
    GoogleSearch \
    HTMLViewer \
    LatinIME \
    Launcher \
    MediaProvider \
    Mms \
    Music \
    PackageInstaller \
    Phone \
    PicoTts \
    Provision \
    Settings \
    SettingsProvider \
    SoundRecorder \
    SubscribedFeedsProvider \
    Sync \
    SyncProvider \
    TelephonyProvider \
    TtsService \
    Updater \
    UserDictionaryProvider \
    VoiceDialer \
    VpnServices \
    WebSearchProvider \
    framework-res

# This is the list of locales included in AOSP builds
PRODUCT_LOCALES := en_US en_GB fr_FR it_IT de_DE es_ES

# Additional settings used in all AOSP builds
PRODUCT_PROPERTY_OVERRIDES += \
        keyguard.no_require_sim=true
