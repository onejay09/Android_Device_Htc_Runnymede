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
# This file sets variables that control the way modules are built
# thorughout the system. It should not be used to conditionally
# disable makefiles (the proper mechanism to control what gets
# included in a build is to use PRODUCT_PACKAGES in a product
# definition file).
#

# WARNING: This line must come *before* including the proprietary
# variant, so that it gets overwritten by the parent (which goes
# against the traditional rules of inheritance).


# inherit from common msm7x30
-include device/htc/msm7x30-common/BoardConfigCommon.mk

# inherit from the proprietary version
-include vendor/htc/runnymede/BoardConfigVendor.mk

# Compiler Optimization
ARCH_ARM_HIGH_OPTIMIZATION_COMPAT := true
TARGET_DISABLE_ARM_PIE := true
TARGET_USE_O3 := true
ARCH_ARM_HIGH_OPTIMIZATION := true
TARGET_BOOTLOADER_BOARD_NAME := runnymede
#console=ttyDDC0 androidboot.hardware=runnymede
#BOARD_KERNEL_CMDLINE := no_console_suspend=1 androidboot.selinux=permissive
BOARD_KERNEL_BASE := 0x14400000
BOARD_KERNEL_PAGE_SIZE := 4096

# GPS
BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE := runnymede
BOARD_VENDOR_QCOM_AMSS_VERSION := 1200
BOARD_VENDOR_QCOM_GPS_LOC_API_AMSS_VERSION := 50000

#FileSystem
# cat /proc/emmc
#dev:        size     erasesize name
#mmcblk0p28: 019ffa00 00000200 "misc"
#mmcblk0p21: 0087f400 00000200 "recovery"
#mmcblk0p22: 00400000 00000200 "boot"
#mmcblk0p25: 3ffffe00 00000200 "system"
#mmcblk0p30: 23ff7c00 00000200 "cache"
#mmcblk0p29: 101fffe00 00000200 "userdata"
#mmcblk0p32: 01fbfc00 00000200 "devlog"
#mmcblk0p33: 00040e00 00000200 "pdata"
#mmcblk0p34: 00040e00 00000200 "pdata"
#mmcblk0p31: 00008000 00000200 "extra"
#mmcblk0p26: 00300000 00000200 "modem_st1"
#mmcblk0p27: 00300000 00000200 "modem_st2"

TARGET_USERIMAGES_USE_EXT4 := true
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 4328521216
BOARD_USERDATAIMAGE_PARTITION_SIZE := 4328521216
BOARD_BOOTIMAGE_PARTITION_SIZE := 4194304
BOARD_FLASH_BLOCK_SIZE := 4096
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_HAS_NO_SELECT_BUTTON := true
BOARD_SDCARD_DEVICE_PRIMARY := /dev/block/mmcblk0p34
BOARD_SDCARD_DEVICE_SECONDARY := /dev/block/mmcblk0p33
BOARD_USES_MMCUTILS := false
BOARD_HAS_NO_MISC_PARTITION := false
BOARD_VOLD_MAX_PARTITIONS := 34
BOARD_VOLD_EMMC_SHARES_DEV_MAJOR := true
TARGET_KERNEL_SOURCE := kernel/htc/runnymede
TARGET_KERNEL_CONFIG := kitkat_defconfig
TARGET_KERNEL_CUSTOM_TOOLCHAIN := linaro-4.8

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/htc/runnymede/bluetooth/include
BOARD_BLUEDROID_VENDOR_CONF := device/htc/runnymede/bluetooth/vnd_runnymede.txt


#misc
TARGET_PROVIDES_LIBLIGHT := true
TARGET_PROVIDES_INIT_RC := true

#Device Specific Overlays
TARGET_RECOVERY_FSTAB := device/htc/runnymede/recovery.fstab
DEVICE_PACKAGE_OVERLAYS += device/htc/runnymede/overlay
TARGET_RELEASETOOLS_EXTENSIONS := device/htc/common
TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/class/android_usb/android0/f_mass_storage/lun0/file
