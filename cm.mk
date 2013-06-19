PRODUCT_RELEASE_NAME := Sensation XL

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/gsm.mk)

$(call inherit-product, device/htc/runnymede/full_runnymede.mk)

PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=htc_runnymede BUILD_FINGERPRINT=google/occam/mako:4.2.2/JDQ39/573038:user/release-keys PRIVATE_BUILD_DESC="occam-user 4.2.2 JDQ39 573038 release-keys"

PRODUCT_NAME := cm_runnymede
PRODUCT_DEVICE := runnymede
PRODUCT_MODEL := Sensation XL
PRODUCT_MANUFACTURER := HTC

