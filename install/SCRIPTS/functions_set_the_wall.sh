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

function is_agnowall
{
dialog --no-shadow --erase-on-exit --backtitle "Wallpaper" \
 --title "Rotation ask" \
 --yesno "
Do you want to rotate the wallpaper 
from a collection of pictures?" 12 60

if [ $? -eq 0 ];then
	cd RESOURCES/agnowall || exit 1
	. ./install.sh
else
	WPCONF=$HOME/.config/agnostep/agnowall.conf
	if [ -f $WPCONF ];then
		rm $WPCONF
	fi
fi
}
