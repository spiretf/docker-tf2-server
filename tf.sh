#!/bin/sh
cd $HOME/hlserver
./update.sh
tf2/srcds_run -game tf -autoupdate -steam_dir ~/hlserver -steamcmd_script ~/hlserver/tf2_ds.txt $@
