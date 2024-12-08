## Perfomix
 Build-up audio effects with looper function.
 The idea behind this plugin is driven by EZBot's Performance mixer for the Octatrack, where the device is used as a complex effect's chain for transitions during live performances.
 
 When you start the bpm synced looper, the looped audio could be send through a sequence of effects:
 1. Distortion (Frequency shifter, Distortion, Wavefolder)
 2. Amplitude modulation (Stutter, Ping pong stutter, Panning of stereo signal)
 3. Filtering (Low pass, High pass, band pass, notch, flanger, phaser - could be used parallel)
 4. Delay (adjustable ping pong)
 5. Reverb

These effects are modulated during a build-up sequence, the length of which can be choosen. The result is for example a closing low pass filter loop which is closing during the length of the build-up. Mostly usable for transitions, because the looper plays instead of the original signal, and you can change the instrument parameters of the original signal during the transition. At the end of the transition you switch back to original sound.

You also can add on some sort of extra audio source to the build-up loop, for example a low cut noise, to add some more interest into the build-up.

## Direct use
It's very possible to just use this patch in a regular pd or plugdata environment.
No extra pd libraries are needed, it's hvcc safe.

## Compile it

# Regular desktop compilation and installation
The most easiest way is to use plugdata. You can download it from https://plugdata.org/ .
Load the Perfomix.pd patch and compile as described on their website. This is available for different environments and is preferable for regular users.

# Easy way installing into zynthian's environment

During this process an extra pip library (hvcc) is loaded into the virtual environment of zynthian.
Install the install_Perfomix.sh script in the zynthian's plugin folder for recipes. Make it executable and run it.
Use the zynthian terminal (webconf) or a ssh terminal to zynthian.

```
cd $ZYNTHIAN_SYS/DIR/scripts/recipes
wget https://github.com/gitnob/Perfomix/raw/refs/heads/main/scripts/install_Perfomix.sh
chmod u+x install_Perfomix.sh
```

Install Perfomix into $ZYNTHIAN_PLUGINS_DIR/lv2 and the preset into $ZYNTHIAN_DATA_DIR/presets/lv2!

```
./install_Perfomix.sh
```

Regenerate lv2 engines in DB and regenerate lv2 presets.

```
regenerate_engines_db.sh
regenerate_lv2_presets.sh
```

Reboot zynthian.

**Updating is easy, just run the install_Perfomix.sh script again!**

# Detailed zynthian compilation and installation
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

At last copy the default presets into zynthian's plugin data presets folder
```
cp -r pd/Perfomix/Perfomix_Default.preset.lv2 $ZYNTHIAN_DATA_DIR/presets/lv2/
```

**Activate Zynthian's virtual python environment again!!**
```
source $ZYNTHIAN_DIR/venv/bin/activate
```

Update the engines and lv2 presets on the command line with 

```
regenerate_engines_db.sh
regenerate_lv2_presets.sh
```

OR: Update the engines and presets in webconf and toggle Perfomix. Restart zynthian.

# Detailed plugin update

**Deactivate Zynthian's virtual python environment!!**
```
deactivate  # deactivates the actual zynthian virtual python environment
```

Goto the src code, where Perfomix source is installed (see above "anyfolder/src").
```
cd pd_to_zynthian_oram
cd pd/Perfomix
git pull
cd ../..
bin/compile.sh -c pd/Perfomix/perfomix.sh
```

Copy custom manifest.ttl files into newly generated lv directory
```
cp pd/Perfomix/*.ttl $PWD/gen/bin/Perfomix.lv2
```

If you linked the Perfomix lv2 plugin, you're fine.

If you copied the Perfomix lv2 plugin into zynthian's plugin directory
```
cp -r gen/bin/Perfomix.lv2 $ZYNTHIAN_PLUGINS_DIR/lv2
```

At last copy the default presets into zynthian's plugin data presets folder
```
cp -r pd/Perfomix/Perfomix_Default.preset.lv2 $ZYNTHIAN_DATA_DIR/presets/lv2/
```

**Activate Zynthian's virtual python environment again!!**
```
source $ZYNTHIAN_DIR/venv/bin/activate
```

Update the engines and lv2 presets on the command line with 

```
regenerate_engines_db.sh
regenerate_lv2_presets.sh
```

 
