#
# Copyright (C) 2011 The CyanogenMod Project
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

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device

PRODUCT_COPY_FILES += \
    device/htc/runnymede/gps.conf:system/etc/gps.conf \
    device/htc/runnymede/hostapd.conf:system/etc/wifi/hostapd.conf 
    



## (1) First, the most specific values, i.e. the aspects that are specific to GSM
PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/base/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml

## (2) Also get non-open-source GSM-specific aspects if available
$(call inherit-product-if-exists, vendor/htc/runnymede/runnymede-vendor.mk)

## (3)  Finally, the least specific parts, i.e. the non-GSM-specific aspects
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.locationfeatures=1 \
    ro.com.google.networklocation=1 \
    ro.com.google.gmsversion=2.3_r3 \
    ro.setupwizard.enable_bypass=1 \
    dalvik.vm.lockprof.threshold=500 \
    dalvik.vm.dexopt-flags=m=y

# Override /proc/sys/vm/dirty_ratio on UMS
PRODUCT_PROPERTY_OVERRIDES += \
    ro.vold.umsdirtyratio=20

DEVICE_PACKAGE_OVERLAYS += device/htc/runnymede/overlay

# gsm config xml file
PRODUCT_COPY_FILES += \
    device/htc/runnymede/voicemail-conf.xml:system/etc/voicemail-conf.xml

# Filesystem management tools
PRODUCT_PACKAGES += \
   make_ext4fs \
   FileManager \
   e2fsck \
   setup_fs

# GPS / Lights / Sensors
PRODUCT_PACKAGES += \
    lights.msm7x30 \
    sensors.default \
    sensors.default \
    libbt-vendor

# HWC Hal to be used in build
#PRODUCT_PACKAGES += \
#    hwcomposer.msm7x30 \
 #   gralloc.msm7x30

# audio
PRODUCT_PACKAGES += \
    audio.a2dp.default \
    audio_policy.default

# idc files
PRODUCT_COPY_FILES += \
    device/htc/runnymede/idc/atmel-touchscreen.idc:system/usr/idc/atmel-touchscreen.idc \
    device/htc/runnymede/idc/runnymede-keypad.idc:system/usr/idc/runnymede-keypad.idc \
    device/htc/runnymede/idc/qwerty.idc:system/usr/idc/qwerty.idc \
    device/htc/runnymede/idc/qwerty2.idc:system/usr/idc/qwerty2.idc \
    device/htc/runnymede/idc/synaptics-rmi-touchscreen.idc:system/usr/idc/synaptics-rmi-touchscreen.idc
# Keychars
PRODUCT_COPY_FILES += \
    device/htc/runnymede/keychars/atmel-touchscreen.kcm:system/usr/keychars/atmel-touchscreen.kcm \
    device/htc/runnymede/keychars/Generic.kcm:system/usr/keychars/Generic.kcm \
    device/htc/runnymede/keychars/qwerty.kcm:system/usr/keychars/qwerty.kcm \
    device/htc/runnymede/keychars/qwerty2.kcm:system/usr/keychars/qwerty2.kcm \
    device/htc/runnymede/keychars/runnymede-keypad.kcm:system/usr/keychars/runnymede-keypad.kcm
# Keylayouts
PRODUCT_COPY_FILES += \
    device/htc/runnymede/keylayout/AVRCP.kl:system/usr/keylayout/AVRCP.kl \
    device/htc/runnymede/keylayout/h2w_headset.kl:system/usr/keylayout/h2w_headset.kl \
    device/htc/runnymede/keylayout/qwerty.kl:system/usr/keylayout/qwerty.kl \
    device/htc/runnymede/keylayout/generic.kl:system/usr/keylayout/Generic.kl \
    device/htc/runnymede/keylayout/runnymede-keypad.kl:system/usr/keylayout/runnymede-keypad.kl \
    device/htc/runnymede/keylayout/synaptics-rmi-touchscreen.kl:system/usr/keylayout/synaptics-rmi-touchscreen.kl \
    device/htc/runnymede/keylayout/Vendor_22b8_Product_093d.kl:system/usr/keylayout/Vendor_22b8_Product_093d.kl \
    device/htc/runnymede/keylayout/Vendor_05ac_Product_0239.kl:system/usr/keylayout/Vendor_05ac_Product_0239.kl \
    device/htc/runnymede/keylayout/Vendor_045e_Product_028e.kl:system/usr/keylayout/Vendor_045e_Product_028e.kl \
    device/htc/runnymede/keylayout/Vendor_046d_Product_c216.kl:system/usr/keylayout/Vendor_046d_Product_c216.kl \
    device/htc/runnymede/keylayout/Vendor_046d_Product_c294.kl:system/usr/keylayout/Vendor_046d_Product_c294.kl \
    device/htc/runnymede/keylayout/Vendor_046d_Product_c299.kl:system/usr/keylayout/Vendor_046d_Product_c299.kl \
    device/htc/runnymede/keylayout/Vendor_046d_Product_c532.kl:system/usr/keylayout/Vendor_046d_Product_c532.kl \
    device/htc/runnymede/keylayout/Vendor_054c_Product_0268.kl:system/usr/keylayout/Vendor_054c_Product_0268.kl \
    device/htc/runnymede/keylayout/h2w_headset.kl:system/usr/keylayout/h2w_headset.kl \
    device/htc/runnymede/keylayout/atmel-touchscreen.kl:system/usr/keylayout/atmel-touchscreen.kl

# Audio DSP Profiles
PRODUCT_COPY_FILES += \
    device/htc/runnymede/dsp/codecs/AIC3254_REG.csv:system/etc/AIC3254_REG.csv \
    device/htc/runnymede/dsp/codecs/AIC3254_REG_DualMic.csv:system/etc/AIC3254_REG_DualMic.csv \
    device/htc/runnymede/dsp/codecs/TPA2051_CFG_BEATS_HW.csv:system/etc/TPA2051_CFG_BEATS_HW.csv \
    device/htc/runnymede/dsp/codecs/TPA2051_CFG.csv:system/etc/TPA2051_CFG.csv \
    device/htc/runnymede/dsp/codecs/CodecDSPID_WB.txt:system/etc/CodecDSPID_WB.txt \
    device/htc/runnymede/dsp/codecs/CodecDSPID.txt:system/etc/CodecDSPID.txt \
    device/htc/runnymede/dsp/codecs/AdieHWCodec.csv:system/etc/AdieHWCodec.csv \
    device/htc/runnymede/dsp/codecs/SPK_Combination.csv:system/etc/SPK_Combination.csv \
    device/htc/runnymede/dsp/codecs/HP_Video.csv:system/etc/HP_Video.csv \
    device/htc/runnymede/dsp/codecs/HP_Audio.csv:system/etc/HP_Audio.csv \
    device/htc/runnymede/dsp/codecs/AudioBTID.csv:system/etc/AudioBTID.csv \
    device/htc/runnymede/dsp/codecs/calibration:system/etc/calibration
    # Audio DSP codecs
PRODUCT_COPY_FILES += \
    device/htc/runnymede/dsp/soundimage/Sound_Bass_Booster.txt:system/etc/soundimage/Sound_Bass_Booster.txt \
    device/htc/runnymede/dsp/soundimage/Sound_Blues.txt:system/etc/soundimage/Sound_Blues.txt \
    device/htc/runnymede/dsp/soundimage/Sound_Classical.txt:system/etc/soundimage/Sound_Classical.txt \
    device/htc/runnymede/dsp/soundimage/Sound_Country.txt:system/etc/soundimage/Sound_Country.txt \
    device/htc/runnymede/dsp/soundimage/Sound_Jazz.txt:system/etc/soundimage/Sound_Jazz.txt \
    device/htc/runnymede/dsp/soundimage/Sound_Latin.txt:system/etc/soundimage/Sound_Latin.txt \
    device/htc/runnymede/dsp/soundimage/Sound_New_Age.txt:system/etc/soundimage/Sound_New_Age.txt \
    device/htc/runnymede/dsp/soundimage/Sound_Original.txt:system/etc/soundimage/Sound_Original.txt \
    device/htc/runnymede/dsp/soundimage/Sound_Original_BCLK.txt:system/etc/soundimage/Sound_Original_BCLK.txt \
    device/htc/runnymede/dsp/soundimage/Sound_Phone_Original_REC.txt:system/etc/soundimage/Sound_Phone_Original_REC.txt \
    device/htc/runnymede/dsp/soundimage/Sound_Original_Recording.txt:system/etc/soundimage/Sound_Original_Recording.txt \
    device/htc/runnymede/dsp/soundimage/Sound_Original_Recording_BCLK.txt:system/etc/soundimage/Sound_Original_Recording_BCLK.txt \
    device/htc/runnymede/dsp/soundimage/Sound_Original_SPK.txt:system/etc/soundimage/Sound_Original_SPK.txt \
    device/htc/runnymede/dsp/soundimage/Sound_Original_SPK_BCLK.txt:system/etc/soundimage/Sound_Original_SPK_BCLK.txt \
    device/htc/runnymede/dsp/soundimage/Sound_Original_SPK_MFG.txt:system/etc/soundimage/Sound_Original_SPK_MFG.txt \
    device/htc/runnymede/dsp/soundimage/Sound_Phone_Original_HP_BCLK.txt:system/etc/soundimage/Sound_Phone_Original_HP_BCLK.txt \
    device/htc/runnymede/dsp/soundimage/Sound_Phone_Original_HP.txt:system/etc/soundimage/Sound_Phone_Original_HP.txt \
    device/htc/runnymede/dsp/soundimage/Sound_Phone_Original_HP_WB.txt:system/etc/soundimage/Sound_Phone_Original_HP_WB.txt \
    device/htc/runnymede/dsp/soundimage/Sound_Phone_Original_REC_BCLK.txt:system/etc/soundimage/Sound_Phone_Original_REC_BCLK.txt \
    device/htc/runnymede/dsp/soundimage/Sound_Phone_Original_REC_NEL.txt:system/etc/soundimage/Sound_Phone_Original_REC_NEL.txt \
    device/htc/runnymede/dsp/soundimage/Sound_Phone_Original_REC_WB.txt:system/etc/soundimage/Sound_Phone_Original_REC_WB.txt \
    device/htc/runnymede/dsp/soundimage/Sound_Phone_Original_SPK.txt:system/etc/soundimage/Sound_Phone_Original_SPK.txt \
    device/htc/runnymede/dsp/soundimage/Sound_Phone_Original_SPK_BCLK.txt:system/etc/soundimage/Sound_Phone_Original_SPK_BCLK.txt \
    device/htc/runnymede/dsp/soundimage/Sound_Phone_Original_SPK_WB.txt:system/etc/soundimage/Sound_Phone_Original_SPK_WB.txt \
    device/htc/runnymede/dsp/soundimage/Sound_Piano.txt:system/etc/soundimage/Sound_Piano.txt \
    device/htc/runnymede/dsp/soundimage/Sound_Pop.txt:system/etc/soundimage/Sound_Pop.txt \
    device/htc/runnymede/dsp/soundimage/Sound_R_B.txt:system/etc/soundimage/Sound_R_B.txt \
    device/htc/runnymede/dsp/soundimage/Sound_Rec_Landscape.txt:system/etc/soundimage/Sound_Rec_Landscape.txt \
    device/htc/runnymede/dsp/soundimage/Sound_Recording_Mono.txt:system/etc/soundimage/Sound_Recording_Mono.txt \
    device/htc/runnymede/dsp/soundimage/Sound_Recording.txt:system/etc/soundimage/Sound_Recording.txt \
    device/htc/runnymede/dsp/soundimage/Sound_Rec_Portrait.txt:system/etc/soundimage/Sound_Rec_Portrait.txt \
    device/htc/runnymede/dsp/soundimage/Sound_Rock.txt:system/etc/soundimage/Sound_Rock.txt \
    device/htc/runnymede/dsp/soundimage/Sound_Treble_Booster.txt:system/etc/soundimage/Sound_Treble_Booster.txt \
    device/htc/runnymede/dsp/soundimage/Sound_Vocal_Booster.txt:system/etc/soundimage/Sound_Vocal_Booster.txt \
    device/htc/runnymede/dsp/soundimage/Sound_VoIP_HP.txt:system/etc/soundimage/Sound_VoIP_HP.txt

### INIT.D SCRIPTS
PRODUCT_COPY_FILES += \
    device/htc/runnymede/prebuilt/init.qcom.post_boot.sh:system/etc/init.qcom.post_boot.sh

# media config xml file
PRODUCT_COPY_FILES += \
    device/htc/runnymede/media_profiles.xml:system/etc/media_profiles.xml \
    device/htc/runnymede/media_codecs.xml:system/etc/media_codecs.xml 

# Kernel modules
ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := device/htc/runnymede/prebuilt/kernel/kernel
endif

#Prebuilt KERNEL MODULES
PRODUCT_COPY_FILES += \
    device/htc/runnymede/prebuilt/kernel/modules/bcmdhd.ko:system/lib/modules/bcmdhd.ko \
    device/htc/runnymede/prebuilt/kernel/modules/cpaccess.ko:system/lib/modules/cpaccess.ko \
    device/htc/runnymede/prebuilt/kernel/modules/dma_test.ko:system/lib/modules/dma_test.ko \
    device/htc/runnymede/prebuilt/kernel/modules/kineto_gan.ko:system/lib/modules/kineto_gan.ko \
    device/htc/runnymede/prebuilt/kernel/modules/reset_modem.ko:system/lib/modules/reset_modem.ko \
    device/htc/runnymede/prebuilt/kernel/modules/scsi_wait_scan.ko:system/lib/modules/scsi_wait_scan.ko


#Prebuilt RAMDISK
PRODUCT_COPY_FILES += \
    device/htc/runnymede/prebuilt/kernel/init:root/init \
    device/htc/runnymede/prebuilt/kernel/init.runnymede.rc:root/init.runnymede.rc \
    device/htc/runnymede/prebuilt/kernel/ueventd.runnymede.rc:root/ueventd.runnymede.rc \
    device/htc/runnymede/prebuilt/kernel/default.prop:root/default.prop \
    device/htc/runnymede/prebuilt/kernel/init.rc:root/init.rc \
    device/htc/runnymede/prebuilt/kernel/ueventd.rc:root/ueventd.rc \
    device/htc/runnymede/prebuilt/kernel/init.usb.rc:root/init.usb.rc \
    device/htc/runnymede/prebuilt/kernel/sbin/adbd:root/sbin/adbd \
    device/htc/runnymede/prebuilt/kernel/init.htc7x30.usb.rc:root/init.htc7x30.usb.rc \
    device/htc/runnymede/vold.fstab:system/etc/vold.fstab

#apps
PRODUCT_COPY_FILES += \
    device/htc/runnymede/extras/CMFileManager.apk:/system/app/CMFileManager.apk

# Device uses high-density artwork where available
PRODUCT_AAPT_CONFIG := normal hdpi
PRODUCT_AAPT_PREF_CONFIG := hdpi
PRODUCT_LOCALES += en_US

# stuff common to all HTC phones
$(call inherit-product, device/htc/common/common.mk)

$(call inherit-product, build/target/product/full_base.mk)

# common msm7x30 configs
$(call inherit-product, device/htc/runnymede/msm7x30.mk)

# Inherit qcom proprietary blobs
$(call inherit-product, vendor/qcom/proprietary/qcom-vendor.mk)
$(call inherit-product, vendor/htc/runnymede/runnymede-vendor.mk)
# HTC Audio
$(call inherit-product, device/htc/runnymede/media_a1026.mk)
$(call inherit-product, device/htc/runnymede/media_htcaudio.mk)

$(call inherit-product, frameworks/base/build/phone-hdpi-512-dalvik-heap.mk)

