
# Quick build

### First time

```sh
# Hybris-16.0 specific patches, not in the HADK yet
hybris-patches/apply-patches --mb
```

### Every time

```sh
# Build android parts (boot image + device parts)
HABUILD_SDK $ mka hybris-hal
# Copy the fstab to out so that mount units for /system and /vendor get generated properly
PLATFORM_SDK $ cp device/oneplus/sdm845-common/rootdir/etc/fstab.qcom out/target/product/enchilada/root/
# Build Sailfish packages and generate a rootfs
PLATFORM_SDK $ rpm/dhd/helpers/build_packages.sh
```
