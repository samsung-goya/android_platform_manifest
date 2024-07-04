# Patch CM sources on the fly.
# Run this at the root of sources.

# Customize POTF here
POTF_DEVICE="goya"
POTF_BRANCH="cm-11.0"
POTF_SOURCE="https://github.com/samsung-goya/android_platform_manifest.git"

# Do not touch this
git clone --depth=1 --branch $POTF_BRANCH $POTF_SOURCE temp_potf
yes | cp -rf temp_potf/potf_$POTF_DEVICE/. .
rm -rf temp_potf

# ---
# Patch 1: Fix prebuilts path
source ~/TWRP/vendor/cm/get-prebuilts
# ---
