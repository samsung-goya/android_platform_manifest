# Manifest for SM-T110/SM-T111

## WARNING
This manifest uses external patching-on-the-fly. Please do not forget to run `bash .repo/local_manifests/potf_goya.sh`!!

## Requirements

- i7 2nd gen or higher *(recommended, any 64-bit CPU will do)*
- Ubuntu 18.04 or higher
- 8GB of RAM *(an extra 2GB of RAM is good for /tmp ramdisk)*
- Around 120GB of storage
- JDK 7
- [Android build dependencies](https://source.android.com/setup/build/initializing#setting-up-a-linux-build-environment)

## Setting up minimal sources

```text
repo init -q --depth=1 -u https://github.com/CyanogenMod/android.git -b cm-12.1
git clone -b cm-12.1 https://github.com/samsung-goya/android_platform_manifest.git .repo/local_manifests
repo sync -c --force-sync --optimized-fetch --no-tags --no-clone-bundle --prune -j$(nproc --all)
source .repo/local_manifests/potf.sh
rm -rf .repo
```

## Building

```text
. build/envsetup.sh
lunch cm_goya[wifi,3g]-[build type]
mka bacon
```

**e.g.**

```text
. build/envsetup.sh
lunch cm_goyawifi-eng
mka bacon
```

## Errors

- `fatal error: CSSGrammar.hpp: No such file or directory`
  - `cd out/target/product/goyawifi/obj/GYP/shared_intermediates/blink`
  - `ln -s CSSGrammar.h CSSGrammar.hpp`
  - `ln -s XPathGrammar.h XPathGrammar.hpp`
- `Assertion 'cnt < (sizeof (_nl_value_type_LC_TIME) / sizeof (_nl_value_type_LC_TIME[0]))' failed.`
  - `export LC_ALL=C`
- `You asked for an OpenJDK 7 build but your version is (...)`
  - `export requires_openjdk=false`

### GLHF building CyanogenMod for your ancient device :P
