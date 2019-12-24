
# Quick build

### First time

```sh
# Download LOS repositories related to enchilada
breakfast $DEVICE
```

```sh
# Hybris-16.0 specific patches, not in the HADK yet
hybris-patches/apply-patches.sh --mb
```

### Every time

Load build environment and variables
```sh
HABUILD_SDK $ source build/envsetup.sh
```

Build android parts (boot image + device parts)
```sh
HABUILD_SDK $ mka hybris-hal
```

Copy the fstab to out so that mount units for /system and /vendor get generated properly

```sh
PLATFORM_SDK $ cp device/oneplus/sdm845-common/rootdir/etc/fstab.qcom out/target/product/enchilada/root/
```

Build Sailfish packages and generate a rootfs

```sh
PLATFORM_SDK $ rpm/dhd/helpers/build_packages.sh
```
