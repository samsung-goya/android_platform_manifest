# Patch CM sources on the fly.
# Device: goya
# Run this at the root of sources.

# ---
# Patch 1: Fix prebuilts path
rm -rf vendor/cm/get-prebuilts
git clone --depth=1 https://github.com/samsung-goya/android_platform_manifest.git temp_manifest
yes | cp -rf temp_manifest/potf/. .
rm -r temp_manifest
source vendor/cm/get-prebuilts
# ---
