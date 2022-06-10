#
# Copyright (C) 2020 The Android Open Source Project
# Copyright (C) 2020 The TWRP Open Source Project
# Copyright (C) 2020 SebaUbuntu's TWRP device tree generator
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/base.mk)

# Inherit from a21s device
$(call inherit-product, device/samsung/a21s/device.mk)

# Inherit some common Omni stuff.
$(call inherit-product, vendor/twrp/config/common.mk)

# Device identifier. This must come after all inclusions
PRODUCT_DEVICE := a21s
PRODUCT_NAME := twrp_a21s
PRODUCT_BRAND := samsung
PRODUCT_MODEL := SM-A217X
PRODUCT_MANUFACTURER := samsung
PRODUCT_RELEASE_NAME := samsung a21s

# A21s uses dynamic partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# VINTF
PRODUCT_ENFORCE_VINTF_MANIFEST := true

# FastbootD
PRODUCT_PACKAGES += \
    android.hardware.fastboot@1.0-impl-mock \
    fastbootd

# Vibration
LOCAL_REQUIRED_MODULES := android.hardware.vibrator@1.3
