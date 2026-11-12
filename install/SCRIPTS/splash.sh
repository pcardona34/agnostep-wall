#!/bin/bash

LOGO=RESOURCES/LOGOS/LOGO_ASCII.txt
if [ -f $LOGO ];then
    clear

    echo -e "\n\tPowered by\n\n"
    cat ${LOGO}
    printf "\033[22;33m \n\n\tThe Free GNUstep\n\t\tAgnostic Desktop\n\t\t\tfor All\n \033[0m \n\n"

    sleep 4
    clear
else
    echo "Logo was not found. No Splash screen."
fi
