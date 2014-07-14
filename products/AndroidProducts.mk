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

#
# This file should set PRODUCT_MAKEFILES to a list of product makefiles
# to expose to the build system.  LOCAL_DIR will already be set to
# the directory containing this file.
#
# This file may not rely on the value of any variable other than
# LOCAL_DIR; do not use any conditionals, and do not look up the
# value of any variable that isn't set in this file or in a file that
# it includes.
#

PRODUCT_MAKEFILES := \
    $(LOCAL_DIR)/koush_supersonic.mk \
    $(LOCAL_DIR)/koush_pulsemini.mk \
    $(LOCAL_DIR)/koush_passion.mk \
    $(LOCAL_DIR)/koush_sapphire.mk \
    $(LOCAL_DIR)/koush_dream.mk \
    $(LOCAL_DIR)/koush_hero.mk \
    $(LOCAL_DIR)/koush_heroc.mk \
    $(LOCAL_DIR)/koush_desirec.mk \
    $(LOCAL_DIR)/koush_magic.mk \
    $(LOCAL_DIR)/koush_inc.mk \
    $(LOCAL_DIR)/koush_sholes.mk \
    $(LOCAL_DIR)/koush_espresso.mk \
    $(LOCAL_DIR)/koush_buzz.mk \
    $(LOCAL_DIR)/koush_galaxys.mk \
    $(LOCAL_DIR)/koush_fascinate.mk \
    $(LOCAL_DIR)/koush_epic.mk \
    $(LOCAL_DIR)/koush_liberty.mk \
    $(LOCAL_DIR)/koush_legend.mk \
    $(LOCAL_DIR)/koush_streak.mk \
    $(LOCAL_DIR)/koush_pulse.mk \
    $(LOCAL_DIR)/koush_droidx.mk \
    $(LOCAL_DIR)/koush_droid2.mk \
    $(LOCAL_DIR)/koush_aloha.mk \
    $(LOCAL_DIR)/koush_bravoc.mk \
    $(LOCAL_DIR)/koush_salsa.mk \
    $(LOCAL_DIR)/koush_bravo.mk \
    $(LOCAL_DIR)/koush_tcc8902.mk
