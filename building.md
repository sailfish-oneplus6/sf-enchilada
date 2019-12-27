> Note, the SDK required for a specific command will be expressed as follows:

* HOST: `[HOST]`

* PLATFORM_SDK: `[PLATFORM]`

* HABUILD_SDK: `[HABUILD]`

# First build

* Create the file `~/.hadk.env` with [this contents](files/.hadk.env)
* Create the file `~/.mersdk.profile` with [this contents](files/.mersdk.profile)
* Create the file `~/.mersdubu.profile` with [this contents](files/.mersdkubu.profile)

Download and install `repo`

`[HOST]`
```sh
mkdir ~/bin
curl https://storage.googleapis.com/git-repo-downloads/repo > ~/bin/repo
chmod +x ~/bin/repo
```

Then add this to your `~/.bashrc`
```sh
export PATH="$HOME/bin:$PATH"
```

Now follow the [OnePlus 5 initial building guide](https://github.com/sailfishos-oneplus5/important/blob/master/INITIAL-BUILDING.md#setup-the-platform-sdk) from `setup the platform sdk`, it's safe to ignore all OnePlus 5 specific information.

You can now follow the [OnePlus 5 Building Guide](https://github.com/sailfishos-oneplus5/important/blob/master/BUILDING.md).

> Thanks [@deathmist](https://github.com/JamiKettunen) ;)


# Quick build - up and running image as fast as possible



## First time

### Setup source tree

`[HOST]`
```sh
cd $ANDROID_ROOT
repo init -u git://github.com/mer-hybris/android.git -b hybris-16.0 --depth 1
git clone https://github.com/sailfish-oneplus6/local_manifests .repo/local_manifests
```

### 

```sh
# Hybris-16.0 specific patches, not in the HADK yet
hybris-patches/apply-patches --mb
```

### Every time


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
