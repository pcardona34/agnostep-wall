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
### agnowall
### Rotate the wallpaper
### at each X login
################################

################################
### VARS
LOG=$HOME/WP.log
declare -a ARRAY
COUNT=0
WPCONFDIR=$HOME/.config/agnostep
WPCONF=${WPCONFDIR}/agnowall.conf
ETCDIR=/etc/agnostep
#DEFGW=org.gnustep.GWorkspace.plist
if [ ! -f $WPCONF ];then
	exit 1
fi
### We get COLLECTION VAR
. $WPCONF
WPDIR=$HOME/GNUstep/Library/Wallpapers
if [ ! -d $WPDIR ];then
	exit 1
fi

cd $WPDIR/$COLLECTION || exit 1
for WP in *.jpg
do
COUNT=$(( COUNT + 1 ))
ARRAY[$COUNT]="$WP"
done

MAX=$(( COUNT + 1 ))

function alea
{
ALEA=$RANDOM
let "ALEA %= $MAX"
if [ $ALEA -gt 0 ];then
	echo "$ALEA"
else
	alea
fi
}

nombre=$(alea)
WP=$WPDIR/$COLLECTION/${ARRAY[$nombre]}
echo $WP
#cd $HOME/GNUstep/Defaults || exit 1
#sed -i -r "s#.*wallpapers.*#<string>$WP</string>#" $DEFGW
cp $WP $HOME/GNUstep/Library/Wallpapers/current.jpg
#wmsetbg --smooth -u $(basename $WP)
# uncomment to debug:
#echo $(basename $WP) >> $LOG
