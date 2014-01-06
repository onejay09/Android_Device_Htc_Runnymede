PRODUCT_RELEASE_NAME := Sensation XL

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/gsm.mk)

$(call inherit-product, device/htc/runnymede/full_runnymede.mk)

PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=htc_runnymede BUILD_ID=KOT49H BUILD_FINGERPRINT=htc_europe/htc_runnymede/runnymede:4.4.2/KOT49H/87995:user/release-keys PRIVATE_BUILD_DESC="4.4.2 onejay09's kitkat release-keys"

PRODUCT_NAME := cm_runnymede
PRODUCT_DEVICE := runnymede
PRODUCT_MODEL := Sensation XL
PRODUCT_MANUFACTURER := HTC