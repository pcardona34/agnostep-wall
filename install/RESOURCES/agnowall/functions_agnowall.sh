#!/bin/bash

####################################################
### AGNoStep  -  Wall
### (c) 2026 Patrick Cardona
###
### Thanks for the GNUstep Developers Community
### This is Free and Open Source software.
### Read License in the root directory.
####################################################

### VARS
#################################
FICHTEMP=$(mktemp /tmp/agno-XXXXX)
trap "rm -f $FICHTEMP" EXIT
WPCONFDIR=$HOME/.config/agnostep
if [ ! -d $WPCONFDIR ];then
	mkdir -p $WPCONFDIR
fi
WPCONF=${WPCONFDIR}/wprotate.conf

################################
### Function for Install wmrotate
################################

##################################################
function menu
{
BT="Wallpapers"
TIT="Collection Setting"

dialog --no-shadow --erase-on-exit --backtitle "$BT" --title "${TIT}" \
 --radiolist "

Select the collection: " 12 77 2 \
"Margeride" "Summer Pictures of French Margeride mountains" on \
"Autumn" "Autumn Pictures of French Margeride mountains" off \
"Winter" "Winter Pictures of French Margeride mountains" off 2> $FICHTEMP

if [ $? -eq 0 ];then
	for i in `cat $FICHTEMP`
	do
	case "$i" in
    "Margeride")
        echo "You chose Margeride."
        echo "COLLECTION=MARGERIDE" > $WPCONF;;
    "Autumn")
        echo "You chose Autumn."
        echo "COLLECTION=AUTUMN" > $WPCONF;;
	"Winter")
		echo "You chose Winter."
		echo "COLLECTION=WINTER" > $WPCONF;;
	esac
	done
fi
}
###########################################
