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
### Install the Wall Paper Manager
####################################################

sudo -v
if [ $? -ne 0 ];then
	exit 1
fi

clear

STOP=0 # Set to 0 to avoid stops; to 1 to make stops for debugging purpose
SLEEP=2
#set -v # Uncomment only for debug purpose

####################################################
### Include functions

. SCRIPTS/log.sh
. SCRIPTS/colors.sh
. SCRIPTS/spinner.sh
. SCRIPTS/functions_prep.sh
. SCRIPTS/stop.sh
. SCRIPTS/functions_set_the_wall.sh

### End of functions
####################################################

####################################################
### PATH and System check

which -s gnustep-config
if [ $? -ne 0 ];then
	alert "Your GNUstep System seems not correctly set. Aborting!"
	info "You should log out and back in to update your environment. When it will be done, try again the 'Settings' stage."
	MSG="Seconds before logout: "
	DELAY=8
	timer
	exec SCRIPTS/lo.sh
	exit 1
fi

#export APP_DIR=`gnustep-config --variable=GNUSTEP_LOCAL_APPS`
#export GNUSTEP_SYSTEM_TOOLS=`gnustep-config --variable=GNUSTEP_SYSTEM_TOOLS`
#echo $PATH | grep -e "${GNUSTEP_SYSTEM_TOOLS}" &>/dev/null
#if [ $? -ne 0 ];then
#	export PATH=${GNUSTEP_SYSTEM_TOOLS}:$PATH
#fi

###################################################

. SCRIPTS/splash.sh

STR="Installing AGNOSTEP Wall"
titulo

#################################################
### Dependencies
LIST="agnowall" && install_deps || exit 1
sleep 2;clear

main_menu
