#
# Copyright (C) 2017 YU Community OS Team
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
#

DEVICE_PATH := device/yu/garlic

TARGET_SYSTEM_PROP += $(DEVICE_PATH)/system.prop

TARGET_OTA_ASSERT_DEVICE := Yureka Black,garlic,yu5040

TARGET_BOARD_VENDOR := yu

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := cortex-a53

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a53

TARGET_BOARD_PLATFORM := msm8937
TARGET_BOARD_PLATFORM_GPU := qcom-adreno505

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := msm8937
TARGET_NO_BOOTLOADER := true

# Kernel
BOARD_KERNEL_CMDLINE := console=ttyHSL0,115200,n8 androidboot.console=ttyHSL0 androidboot.hardware=qcom msm_rtb.filter=0x237 ehci-hcd.park=3 lpm_levels.sleep_disabled=1 androidboot.bootdevice=7824900.sdhci earlycon=msm_hsl_uart,0x78B0000
BOARD_KERNEL_CMDLINE += androidboot.selinux=permissive
BOARD_KERNEL_BASE := 0x80000000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_MKBOOTIMG_ARGS := --kernel_offset 0x00008000 --ramdisk_offset 0x01000000 --tags_offset 0x00000100
BOARD_KERNEL_IMAGE_NAME := Image.gz-dtb
TARGET_KERNEL_CONFIG := lineage_garlic_defconfig
TARGET_KERNEL_SOURCE := kernel/yu/msm8937

# Clang
INTERNAL_LOCAL_CLANG_EXCEPTION_PROJECTS := external/busybox/

# Encryption
TARGET_HW_DISK_ENCRYPTION := true
TARGET_CRYPTFS_HW_PATH := $(DEVICE_PATH)/cryptfs_hw

# Init
TARGET_PLATFORM_DEVICE_BASE := /devices/soc/

# Keymaster
TARGET_PROVIDES_KEYMASTER := true

# Partitions
BOARD_BOOTIMAGE_PARTITION_SIZE := 67108864
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 67108864
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 5003804672
# Reserve Space in UserData Partition to Support FS-Encryption (24892644352 - 16384):
BOARD_USERDATAIMAGE_PARTITION_SIZE := 23818886144 
BOARD_CACHEIMAGE_PARTITION_SIZE := 268435456
BOARD_PERSISTIMAGE_PARTITION_SIZE := 33554432
BOARD_FLASH_BLOCK_SIZE := 131072 # (BOARD_KERNEL_PAGESIZE * 64)

# Enable vendor partition
ENABLE_VENDOR_IMAGE := true
ifeq ($(ENABLE_VENDOR_IMAGE), true)
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_VENDORIMAGE_PARTITION_SIZE := 1073741824
TARGET_COPY_OUT_VENDOR := vendor
PRODUCT_VENDOR_MOVE_ENABLED := true
BOARD_PROPERTY_OVERRIDES_SPLIT_ENABLED := true
PRODUCT_FULL_TREBLE_OVERRIDE := true
PRODUCT_SHIPPING_API_LEVEL := 25
PRODUCT_COMPATIBILITY_MATRIX_LEVEL_OVERRIDE := 27
endif

# Recovery
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_HAS_NO_SELECT_BUTTON := true
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

# Qualcomm support
BOARD_USES_QCOM_HARDWARE := true

#MultiROM config. MultiROM also uses parts of TWRP config
MR_DEVICE_HOOKS := $(DEVICE_PATH)/multirom/mr_hooks.c
MR_DEVICE_HOOKS_VER := 6
MR_DEVICE_BOOTDEVICE := /dev/block/platform/soc/7824900.sdhci
MR_DPI := xhdpi
MR_DPI_FONT := 340
MR_ENCRYPTION := true
MR_ENCRYPTION_FAKE_PROPERTIES := true
MR_ENCRYPTION_FAKE_PROPERTIES_EXTRAS := $(DEVICE_PATH)/multirom/mr_fake_properties.c
MR_ENCRYPTION_SETUP_SCRIPT := $(DEVICE_PATH)/multirom/mr_cp_crypto.sh
MR_FSTAB := $(DEVICE_PATH)/twrp.fstab
MR_INIT_DEVICES := $(DEVICE_PATH)/multirom/mr_init_devices.c
MR_INPUT_TYPE := type_b
MR_KEXEC_MEM_MIN := 0x84A00000
MR_NO_KEXEC := enabled
MR_PIXEL_FORMAT := "RGBA_8888"
MR_UNIFIED_TABS := true
MR_USE_MROM_FSTAB := true
MR_EXTRA_FIRMWARE_DIR := "/mrom_enc/vendor/firmware"
MR_FIRMWARE_DIR := "/vendor/firmware_mnt"
RECOVERY_GRAPHICS_USE_LINELENGTH := true
DEVICE_RESOLUTION := 1080x1920
TARGET_RECOVERY_IS_MULTIROM := true
MR_DEVICE_HAS_VENDOR_PARTITION := false
#MR_DEVICE_HAS_DRM_GRAPHICS := true
MR_CONTINUOUS_FB_UPDATE := true
#MR_CUSTOM_FORBIDDEN_PARTITIONS := $(DEVICE_PATH)/multirom/mr_forbidden_partitions.cpp

# Recovery
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/twrp.fstab
TW_SCREEN_BLANK_ON_BOOT := true
TW_EXTRA_LANGUAGES := true
TW_THEME := portrait_hdpi
TW_MAX_BRIGHTNESS := 255
TW_BRIGHTNESS_PATH := "/sys/class/leds/lcd-backlight/brightness"
# Crypto
TARGET_HW_DISK_ENCRYPTION := true
TW_INCLUDE_CRYPTO := true
TW_SCREEN_BLANK_ON_BOOT := true
TARGET_RECOVERY_QCOM_RTC_FIX := true
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
BOARD_SUPPRESS_SECURE_ERASE := true
RECOVERY_SDCARD_ON_DATA := true
RECOVERY_GRAPHICS_USE_LINELENGTH := true
TW_EXCLUDE_SUPERSU := true
TW_IGNORE_MISC_WIPE_DATA := true
TW_NEW_ION_HEAP := true

# Disable Mouse Cursor
TW_INPUT_BLACKLIST := "hbtp_vm"

# exFAT FS Support
TW_INCLUDE_FUSE_EXFAT := true

# NTFS Support
TW_INCLUDE_FUSE_NTFS := true
