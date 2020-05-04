# Flashing

* Slot A **MUST** be running LOS 16 before Sailfish installation
* Sailfish **MUST** be flashed with slot A as your active slot.
* Sailfish is kept entirely isolated from Android data, you can make any changes to slot b without affecting Sailfish.
* If you want to install OTAs on slot B you **MUST** boot TWRP from slot A (due to the nature of OTAs).
* **DO NOT** *install* TWRP on slot A as sailfish will no longer boot afterwards.

* Yes, you can run Android 10, or 9, or even Oreo on Slot B with sailfish installed

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


## Dual Booting Instructions

If your current Android system is installed on slot b, you will be able to dual boot between SFOS and android with ease, you can run any ROM and Android version on slot B.

**NOTE: Android updates must be flashed from TWRP, with slot A as your active slot (OxygenOS updates are always flashed to the inactive slot).**

If not, you will need to switch your active slot to slot a with `fastboot --set-active=a` and then flash an update package from TWRP. If this doesn't work, you can switch the active slot by booting to TWRP and nvigating to "Reboot" -> "Slot A", which will switch the active slot to A upon next boot.

Sailfish OS will ONLY work if installed to SLOT A due to current limitations in Treble support.

After installation you can switch slots using the fastboot command above OR by running `bootctl set-active-boot-slot <0 OR 1>` on Sailfish OS. On Android you might need `/system/bin/bootctl ...`.
