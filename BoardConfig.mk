#
# Copyright (C) 2011 The Android Open-Source Project
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

include device/lge/gproj-common/BoardConfigCommon.mk

TARGET_SPECIFIC_HEADER_PATH := device/lge/e975/include

BOARD_KERNEL_CMDLINE := vmalloc=600M console=null lpj=67677 user_debug=31 msm_rtb.filter=0x0 ehci-hcd.park=3 coresight-etm.boot_enable=0 androidboot.hardware=geehrc
TARGET_KERNEL_CONFIG := cyanogenmod_e975_defconfig

BOARD_HAVE_BLUETOOTH_QCOM := true
BLUETOOTH_HCI_USE_MCT := true

TARGET_BOOTLOADER_BOARD_NAME := geehrc
TARGET_BOOTLOADER_NAME=e975

BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/lge/e975/bluetooth

# FIXME: HOSTAPD-derived wifi driver
BOARD_HAS_QCOM_WLAN := true
BOARD_WLAN_DEVICE := qcwcn
WIFI_DRIVER_FW_PATH_STA := "sta"
WIFI_DRIVER_FW_PATH_AP  := "ap"
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)

TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
TARGET_RECOVERY_FSTAB = device/lge/e975/fstab.geehrc

-include vendor/lge/e975/BoardConfigVendor.mk

BOARD_HAS_NO_SELECT_BUTTON := true

BOARD_SEPOLICY_DIRS += \
        device/lge/e975/sepolicy

BOARD_SEPOLICY_UNION += \
       bluetooth_loader.te \
       bridge.te \
       camera.te \
       conn_init.te \
       device.te \
       domain.te \
       file.te \
       file_contexts \
       hostapd.te \
       kickstart.te \
       mediaserver.te \
       mpdecision.te \
       netmgrd.te \
       property.te \
       property_contexts \
       qmux.te \
       rild.te \
       rmt.te \
       sensors.te \
       surfaceflinger.te \
       system_server.te \
       tee.te \
       te_macros \
       thermald.te \
       ueventd.te

## We need this for FM support
#TARGET_QCOM_AUDIO_VARIANT := caf

BOARD_HARDWARE_CLASS += device/lge/e975/cmhw
