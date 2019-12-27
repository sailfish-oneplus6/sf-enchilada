# Flashing

## NOTE on dual booting:

If your current Android system is installed on slot b, you will be able to dual boot between SFOS and android with ease, and can even run non LOS ROMs (like OOS) on slot b.

NOTE: Android OTAs must be flashed from TWRP booted off slot A

If not, you will need to switch your boot slot to slot a with `fastboot --set-active=a` and then flash an update package from TWRP.

Sailfish OS will ONLY work if installed to slot a due to current limitations in Treble support.

I am not responsible for any loss of data or stability due to what you decided to do to your phone.

Please note running SFOS with an encrypted /data partition is untested.

You must be running OOS 9.x on slot A prior to following these instructions.

1. Grab [this TWRP](https://dl.twrp.me/enchilada/twrp-3.3.1-2-enchilada.img.html) then boot into fastboot mode
```sh
# update packages are always flashed to inactive slot (in this case slot_a)
fastboot --set-active=b
fastboot boot twrp-3.3.1-2-enchilada.img
```
2. Flash Lineage OS 16.0, grab the [latest nightly from here](https://wiki.lineageos.org/devices/enchilada/)
3. Reboot back into TWRP, navigate to the reboot menu and check the current slot, if it's SLOT A then you're good to go, otherwise flash LOS again.
4. Copy the SFOS install zip to your storage and flash!
5. Reboot!