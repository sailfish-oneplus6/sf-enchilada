

# build_packages
Before running build_packages run
```
cp device/oneplus/sdm845-common/rootdir/etc/fstab.qcom out/target/product/enchilada/root/
```

For some reason this file isn't fetched automatically but is needed to generate mount units.
