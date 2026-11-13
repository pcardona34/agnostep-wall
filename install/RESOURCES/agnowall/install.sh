#!/bin/bash

####################################################
### AGNoStep  -  Wall
### (c) 2026 Patrick Cardona
###
### Thanks for the GNUstep Developers Community
### This is Free and Open Source software.
### Read License in the root directory.
####################################################

################################
### Install agnowall
### Choose a collection
### and Rotate the wallpaper
### at each X login
################################

################################
### Functions

if [ -z "$COLORS" ];then
	. ../../SCRIPTS/colors.sh
fi
. ../../SCRIPTS/log.sh
. functions_agnowall.sh

################################
STR="Wallpaper Rotate Utility"
subtitulo

WPDIR=$HOME/GNUstep/Library/Wallpapers
if [ ! -d $WPDIR ];then
	mkdir -p $WPDIR
fi

pushd .
cd ../WALLPAPERS || exit 1
for SERIE in WINTER MARGERIDE AUTUMN
do
if [ ! -d $WPDIR/${SERIE} ];then
	cp -r ${SERIE} $WPDIR/
fi
done

for AGNO in *.jpg
do
cp -f $AGNO $WPDIR/
done


info "The collection of the Wallpapers has been installed."

popd

pushd .
menu
popd

TARGET=/usr/local/bin
if [ ! -d $TARGET ];then
	sudo mkdir -p $TARGET
fi

if [ -f agnowall.sh ];then
	sudo cp -f agnowall.sh $TARGET/
fi

info "The script agnowall.sh has been installed."

if [ -n "$DISPLAY" ];then
    echo "Context: Xterm..."
    pushd .
    /usr/local/bin/agnowall.sh
    popd
    ALTERNATE_BG=$HOME/GNUstep/Library/Wallpapers/current.jpg
    if [ -f ${ALTERNATE_BG} ];then
        feh --bg-fill ${ALTERNATE_BG}
    else
        echo "${ALTERNATE_BG} was not found."
    fi
fi
