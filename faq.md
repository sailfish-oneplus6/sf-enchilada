# Frequently Asked Questions (FAQ)

### Do I have to wipe /data prior to flashing Sailfish OS?
A: You don't have to wipe /data if you are already running Lineage OS on both A and B slots. This is because Sailfish OS does not take over /data partion, and entire installation is stored at /data/.stowaways/sailfish.

### What is the current state of porting Sailfish?
A: Current status for development can be follewed through our [Trello website](https://trello.com/b/xHiboUsv/sfos-enchilada).

### Help! XYZ isn't working on my phone!
A: Please first check that you have follewed the [flashing guide](https://github.com/sailfish-oneplus6/sf-enchilada/blob/master/flashing.md) correctly. If you have done so, please let us know with following information:
  1) Did you build the image yourself or flashed our builds?
  2) What is the problem you are having?
  3) Where/when does that problem occur?
  4) Troubleshooting steps performed
  5) Please attach output of:
      - dmesg
      - journalctl
      - logcat
We require this information to properly diagnose and reproduce the issue. If you do not provide the following information above, we will unlikely to be able to help you.

### Can I run Android apps on Sailfish OS?
A: Currently, you cannot run Android apps on Sailfish OS. Ailen Dalvik, which is available on official Sailfish OS phones, are not available to unofficial (ported) phones due to licensing issues. However, there is "Anbox", which we might port to Sailfish OS for enchilada in the future.

### Is ActiveSync from Microsoft working on Sailfish OS?
A: Currently, email client does not support ActiveSync due to licensing issue.

### How much space do you need to install Sailfish OS?
A: You probably need at least 500MiB to install base system files.

### Can I run Sailfish without altering my /boot partition?
A: You can, follow [hadk](https://sailfishos.org/content/uploads/2019/09/SailfishOS-HardwareAdaptationDevelopmentKit-3.1.0.0.pdf) guide on flashing with ADB. Please note that this method does not include some workarounds to solve bugs on Sailfish OS/Android compatibility, and you will run into some issues like WiFi not working after a reboot.

### Do you have a Discord server?
A: [Yes](https://discord.gg/J72s23R).

### What can I do to help/contribute?
A: Please follow our [Trello website](https://trello.com/b/xHiboUsv/sfos-enchilada) to see what we have planned, and what we have to do.
