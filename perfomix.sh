#!/bin/bash

# Base directory of the development environment
BASE_PATH=$PWD
# to end where you start
CALL_PATH=$OLDPATH

# name of main puredata file to be compiled to lv2
PDFILE=$BASE_PATH/pd/Perfomix/Perfomix.pd

# accompanying json file (see heavy DPF generator description at https://github.com/Wasted-Audio/hvcc/blob/develop/docs/03.gen.dpf.md
METAFILE=$BASE_PATH/pd/Perfomix/Perfomix.json

# ttl specific parameters
LV_NAME=Perfomix
LV2_URI="lv2://nobisoft.de/Perfomix"		# best would be the URL of a repository
LV_COPYRIGHT="Copyright 2024 Gaggenau Nobisoft"		# copyright information of your LV2

# heavylib library path
HVLIB=$BASE_PATH/lib/heavylib/
