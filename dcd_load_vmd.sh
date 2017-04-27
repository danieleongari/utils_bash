#!/bin/bash


if [ "$1" = "" ] || [ "$2" = "" ]]; then
   echo "HELP: you need to provide the initial configuration (to convert in .axsf) and the .dcd file"
   echo "USAGE: dcd_load_vmd.sh myinitsyst.cif mytraj.dcd" 
   exit 1
fi


source $HOME/.bashrc
initial_structure=$1
dcd_structure=$2

manage_crystal.py $initial_structure -o temp.axsf


cat > temp.vmd << EOF
# VMD script (by Daniele Ongari)

############################### LOAD
mol new ./temp.axsf
mol addfile ./${dcd_structure}  type dcd first 0 last -1 step 1 filebonds 1 autobonds 1 waitfor all 


############################### REPRESENTATION
#delete initial standard "representation 0"
mol delrep 0 top 

mol representation DynamicBonds 2.150000 0.200000 12.000000
mol color Name
mol selection {all}
mol addrep top

mol representation VDW 0.200000 14.000000
mol color Name
mol selection {all}
mol addrep top

############################### DELETE FRAMES
#animate delete beg 200 end 309 top

############################### OTHER DISPLAY SETTINGS
display projection orthographic

############################### PBC OPTIONS
pbc box
pbc wrap -all
EOF


vmd -e temp.vmd


rm temp.vmd
rm temp.axsf
