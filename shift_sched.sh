#!/bin/bash

# initializing dependencies install
./dependencies/dependencies.sh

# echoing welcome message
./banners/banner.sh
echo -e "\n"
cat ./banners/welcome.txt

# calling user input checker feature
while true; do
    # setting up env variable for exit
    export EXIT_CODE=0

    # initialize getting input from user
    source ./scripts/user_input.sh

    # Check if the action is "PRINT"
    if [[ "$NAME" == "PRINT" ]]; then
    #   Add you print script here 
        echo -e "\nSAMPLE | DATABASE | PRINTED | FORMAT"
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
        # source ./write_schedule.sh
        echo -e "\n\n\nSUCCESS!\n"
        echo "$NAME from team $TEAM is assigned to $SHIFT, $(cat ./database/database.json | ./scripts/JSONPath.sh -b .[$SHIFT].TIME[0])"  
    fi
done