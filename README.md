# Perfomix
 Build-up audio effects with looper function.
 
# Direct use
It's very possible to just use this patch in a regular pd or plugdata environment.
No extra pd libraries are needed, it's hvcc safe.

# Compile it

## Regular desktop compilation and installation
The most easiest way is to use plugdata. You can download it from https://plugdata.org/ .
Load the Perfomix.pd patch and compile as described on their website. This is available for different environments and is preferable for regular users.

## Specific zynthian (oram) compilation and installation
Because at the moment plugdata does not have a arm64 export mechanism, it is necessary to compile the plugin for the raspberry pi OS on the command line.
Compilation on the command line involves some basic understanding of directories and text editing. You also need git.

**Deactivate Zynthian's virtual python environment!!**
```
deactivate  # deactivates the actual zynthian virtual python environment
```

Choose a directory for the source
```
mkdir src
cd src
```

Clone 2 repositories - the source of the patch and a script collection to compile a pd plugin with hvcc.
```
git clone https://github.com/gitnob/pd_to_zynthian_oram.git
git clone https://github.com/gitnob/Perfomix.git
```

Initialize for compilation.
```
cd pd_to_zynthian_oram
bin/initialize_lv2_dev.sh # takes some time to download the development environment for hvcc
ln -s $PWD/../Perfomix pd/Perfomix
```

Compile by using the Perfomix specific config.sh file
```
bin/compile.sh -c pd/Perfomix/perfomix.sh
```

Copy custom manifest.ttl files into newly generated lv directory
```
cp pd/Perfomix/*.ttl $PWD/gen/bin/Perfomix.lv2
```

Link (or copy) the Perfomix lv2 plugin into zynthian's plugin directory
```
ln -s $PWD/gen/bin/Perfomix.lv2 $ZYNTHIAN_PLUGINS_DIR/lv2
```
or
```
cp -r gen/bin/Perfomix.lv2 $ZYNTHIAN_PLUGINS_DIR/lv2
```

**Activate Zynthian's virtual python environment again!!**
```
source $ZYNTHIAN_DIR/venv/bin/activate
```

Update the engines in webconf and toggle Perfomix.


