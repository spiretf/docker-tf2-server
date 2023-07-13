#! /bin/bash 

ls -l $SERVER
ls -l /home/tf2/hlserver/tf2
cd $SERVER/tf2/tf/maps

mv cp_badlands.{bsp,keep}
rm *.bsp
mv cp_badlands.{keep,bsp}

cd $SERVER/tf2/tf

rm resource/tf_*.txt
