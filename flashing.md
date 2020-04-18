# Flashing

## NOTE on dual booting

If your current Android system is installed on slot b, you will be able to dual boot between SFOS and android with ease, and you can even run non LOS ROMs (like OOS) on slot b.

**NOTE: Android updates must be flashed from TWRP, with slot A as your active slot (OxygenOS updates are always flashed to the inactive slot).**

If not, you will need to switch your active slot to slot a with `fastboot --set-active=a` and then flash an update package from TWRP. If this doesn't work, you can switch the active slot by booting to TWRP and nvigating to "Reboot" -> "Slot A", which will switch the active slot to A upon next boot.

Sailfish OS will ONLY work if installed to SLOT A due to current limitations in Treble support.

After installation you can switch slots using the fastboot command above OR by running `bootctl set-active-boot-slot <0 OR 1>` on Sailfish OS. On Android you might need `/system/bin/bootctl ...`.

## Flashing Instructions

#### Disclaimer: I am not responsible for any loss of data or stability due to what you decided to do to your phone.

You must be running OOS 9.x on slot A prior to following these instructions. A quick google for `OxygenOS 9 OnePlus 6(T)` should find you some results.

1. Grab TWRP: [enchilada](https://dl.twrp.me/enchilada/twrp-3.3.1-2-enchilada.img.html) `::` [fajita](https://dl.twrp.me/fajita/twrp-3.3.1-1-fajita.img.html). then boot into fastboot mode
```sh
# update packages are always flashed to inactive slot (in this case SLOT A)
fastboot --set-active=b
fastboot boot twrp-3.3.1-2-enchilada.img # You might need to use a custom build of TWRP if you're on Android 10, you can normally find it on XDA
```
2. Format /data (Wipe -> Format Data)
3. Dirty flash Lineage OS 16.0, grab the latest nightly: [enchilada](https://wiki.lineageos.org/devices/enchilada/) `::` [fajita](https://wiki.lineageos.org/devices/fajita/).
4. Reboot while holding volume up to enter fastboot mode, `fastboot boot twrp-3.3.1-2-$DEVICE.img` again, navigate to the reboot menu and check the current slot, if it's SLOT A then you're good to go, otherwise flash LOS again.
5. Copy the SFOS install zip to your storage and flash!
6. Reboot!
