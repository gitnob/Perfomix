#!/bin/bash

#BASE_URL_DOWNLOAD="https://os.zynthian.org/plugins/aarch64"
BASE_URL_DOWNLOAD="https://github.com/gitnob/Perfomix/releases/latest/download"

rm -rf $ZYNTHIAN_PLUGINS_DIR/lv2/Perfomix.lv2
rm -rf $ZYNTHIAN_PLUGINS_DIR/lv2-presets/Perfomix_Default.preset.lv2

#wget "$BASE_URL_DOWNLOAD/Perfomix.tar.xz"
wget "$BASE_URL_DOWNLOAD/Perfomix.lv2.zip"
unzip Perfomix.lv2.zip
mv Perfomix/Perfomix_Default.preset.lv2 $ZYNTHIAN_PLUGINS_DIR/lv2-presets/
mv Perfomix/Perfomix.lv2 $ZYNTHIAN_PLUGINS_DIR/lv2/
rm -rf Perfomix
rm -f Perfomix.lv2.zip
