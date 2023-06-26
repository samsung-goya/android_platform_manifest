# Patch CM sources on the fly.
# Run this at the root of sources.

# Customize POTF here
POTF_DEVICE="goya"
POTF_BRANCH="cm-12.1"
POTF_SOURCE="https://github.com/samsung-goya/android_platform_manifest.git"

# Do not touch this
git clone --depth=1 --branch $POTF_BRANCH $POTF_SOURCE temp_potf
yes | cp -rf temp_potf/potf_$POTF_DEVICE/. .
rm -rf temp_potf

# ---
# Patch 1: Fix prebuilts path
source vendor/cm/get-prebuilts
# ---

# ---
# Patch 2: Stop build system from being picking with JDK
# ---

# ---
# Patch 3: Fix angle repo missing .git (issue with CM)
rm -rf external/chromium_org/third_party/angle
git clone --branch lollipop-release --single-branch --depth=1 \
https://android.googlesource.com/platform/external/chromium_org/third_party/angle \
external/chromium_org/third_party/angle
# ---
