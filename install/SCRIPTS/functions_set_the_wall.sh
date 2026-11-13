#!/bin/bash

####################################################
### AGNoStep  Wall
### (c) 2026 Patrick Cardona
###
### Thanks for the GNUstep Developers Community
### This is Free and Open Source software.
### Read License in the root directory.
####################################################

####################################################
### Function to Install the Wall Paper Manager
####################################################

if [ -z "$COLORS" ];then
    . colors.sh
fi

function main_menu
{
TEMPFILE=$(mktemp /tmp/agno-XXXXX)
trap "rm -f $TEMPFILE" EXIT

dialog --no-shadow --backtitle "AGNoStep Wall" --title "Setting the Wallpaper" \
 --radiolist "Select an action " 18 60 3 \
"Set" "Set a wallpaper" on \
"Remove" "Remove the wallpaper" off 2>>$TEMPFILE

if [ $? -eq 0 ];then
  for i in `cat $TEMPFILE`
  do
        case "$i" in
        "Set")
            echo "You chose Set..."
            set_wallpaper;;
        "Remove")
            echo "You chose Remove..."
            remove_wallpaper;;
        esac
  done
fi
}

function set_wallpaper
{
#################################################
### Wallpaper
STR="Generic Wallpaper"
subtitulo

WP="fond_agnostep"

### The following folder will be searched too by Lightdm
SYS_WP_FOLDER=/usr/local/share/wallpapers
USER_WP_FOLDER=$(gnustep-config --variable=GNUSTEP_USER_LIBRARY)/Wallpapers

if [ ! -d $SYS_WP_FOLDER ];then
	sudo mkdir -p $SYS_WP_FOLDER
fi
if [ ! -d $USER_WP_FOLDER ];then
    mkdir -p $USER_WP_FOLDER
fi

pushd .
cd RESOURCES/WALLPAPERS || exit 1
### For Lightdm
sudo cp -f ${WP}.png ${SYS_WP_FOLDER}/
### For static WP of GWorkspace
cp -f ${WP}.jpg ${USER_WP_FOLDER}/fixed.jpg
popd

ok "Done"
sleep ${SLEEP:-2}

stop

clear

#################################################
### User Wallpaper
STR="User Wallpaper Collection"
subtitulo

pushd .
is_agnowall
popd

sleep ${SLEEP:-2}
stop

##################################################
MESSAGE="AGNoStep Wall was set. It will apply at your next login."

info "$MESSAGE" | tee -a $LOG
date >> $LOG

sleep ${SLEEP:-2}

}

function is_agnowall
{
dialog --no-shadow --erase-on-exit --backtitle "Wallpaper" \
 --title "Rotation ask" \
 --yesno "
Do you want to rotate the wallpaper 
from a collection of pictures?" 12 60

if [ $? -eq 0 ];then
	export COLL=YES
else
    export COLL=NO
fi

cd RESOURCES/agnowall || exit 1
. ./install.sh
}

function remove_wallpaper
{
WPCONF=$HOME/.config/agnostep/agnowall.conf
ALTERNATE_WP=$HOME/GNUstep/Library/Wallpapers/current.jpg
FIXED_WP=$HOME/GNUstep/Library/Wallpapers/fixed.jpg
WALLTOOL=/usr/local/bin/agnowall.sh

for RES in ${WPCONF} ${ALTERNATE_WP} ${FIXED_WP}
do
    if [ -f ${RES} ];then
		rm ${RES}
	fi
done
sudo rm -f $WALLTOLL

pushd .
cd $HOME/GNUstep/Library/Wallpapers
for COLL in AUTUMN MAJORQUE MARGERIDE WINTER WORLD
do
    if [ -d ${COLL} ];then
        rm -r ${COLL}
    fi
done
popd

ok "Wallpaper was unset. Collections were removed."

# Fallback to Solid color
if [ -n "$DISPLAY" ];then
    xsetroot -solid "#4F4F74"
fi
}
