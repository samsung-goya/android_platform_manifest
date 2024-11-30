# Manifest for SM-T110/SM-T111

## Requirements

- i7 2nd gen or higher *(recommended, any 64-bit CPU will do)*
- Ubuntu 18.04 or higher
- 8GB of RAM *(an extra 2GB of RAM is good for /tmp ramdisk)*
- Around 120GB of storage
- JDK 6
- [Android build dependencies](https://source.android.com/setup/build/initializing#setting-up-a-linux-build-environment)

## Setting up minimal sources

```text
repo init -q --depth=1 -u https://github.com/CyanogenMod/android.git -b cm-11.0
git clone https://github.com/samsung-goya/android_platform_manifest.git .repo/local_manifests
repo sync -c --force-sync --optimized-fetch --no-tags --no-clone-bundle --prune -j$(nproc --all)
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

## Guides *(deprecated)*

[\[GUIDE CM11\] How to build your own CyanogenMod 11.0 ROM from sources for the Nexus 4](https://forum.xda-developers.com/t/guide-cm11-how-to-build-your-own-cyanogenmod-11-0-rom-from-sources-for-the-nexus-4.2515305/)

[\[GUIDE\]How to Build your own CM11 from Local sources for the Galaxy Fame](https://forum.xda-developers.com/t/guide-how-to-build-your-own-cm11-from-local-sources-for-the-galaxy-fame.2875919/)

## Errors

- `fatal error: CSSGrammar.hpp: No such file or directory`
  - `cd out/target/product/goyawifi/obj/GYP/shared_intermediates/blink`
  - `ln -s CSSGrammar.h CSSGrammar.hpp`
  - `ln -s XPathGrammar.h XPathGrammar.hpp`
- `Assertion 'cnt < (sizeof (_nl_value_type_LC_TIME) / sizeof (_nl_value_type_LC_TIME[0]))' failed.`
  - `export LC_ALL=C`

### GLHF building CyanogenMod for your ancient device :P
