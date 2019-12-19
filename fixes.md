# Hybris-hal fixes
```
system/update_engine/update_status_utils.cc:19:10: fatal error: 'update_engine/dbus-constants.h' file not found
```
* Fetch the file from [here](https://gist.github.com/calebccff/8ad08f58f83ac9cd506484e3f4d23cbb) and put it in `system/update_engine/`

# TWRP fixes

1. Grab the latest busybox binary for armv8l
2. Rename to `busybox` and copy to device (root of internal storage)
3. Boot twrp and get a shell
4. 
```sh
cd /sdcard
chmod +x busybox
```

If you're using my [hybris-boot](https://github.com/sailfish-oneplus6/hybris-boot) repo, flashing the zip will use this busybox binary instead of the old and broken one the current build of TWRP uses.
