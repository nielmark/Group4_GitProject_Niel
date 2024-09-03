#!/bin/bash

# for color formatting
RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
YELLOW=$(tput setaf 3)
CYAN=$(tput setaf 6)
NORMAL=$(tput sgr0)
BOLD=$(tput bold) 

echo "${NORMAL}"

# initializing dependencies install
./dependencies/dependencies.sh

# echoing welcome message
./banners/banner.sh
./banners/welcome.sh


# calling user input checker feature
while true; do
    # setting up env variable for exit
    export EXIT_CODE=0

    # initialize getting input from user
    source ./scripts/user_input.sh

    # Check if the action is "PRINT"
    if [[ "$NAME" == "PRINT" ]]; then
    #   Add you print script here 
        source ./scripts/print_all.sh
        #echo -e "\nSAMPLE | DATABASE | PRINTED | FORMAT"
        export EXIT_CODE=1
    elif [[ "$NAME" == "RESET" ]]; then
        source ./scripts/reset-database.sh
        export EXIT_CODE=1
    fi

    # start of schedule availability check
    if [[ $EXIT_CODE != 1 ]]; then
        # calling logic checker (if schedule is free)
        source ./scripts/schedule_check.sh
    fi

    # start of write script
    if [[ $EXIT_CODE != 1 ]]; then
        # calling for writing to database
        source ./scripts/write_schedule.sh
    fi
done