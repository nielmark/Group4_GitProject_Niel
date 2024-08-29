#!/bin/bash

# echoing welcome message
cat welcome.txt
./banner.sh

# setting up env variable for exit
export EXIT_CODE=0

# calling user input checker feature
while true; do
    # initialize getting input from user
    source ./user_input.sh

    # Check if the action is "PRINT"
    if [[ "$fmt_action" == "PRINT" ]]; then
    #   Add you print script here 
        echo $NAME
        export EXIT_CODE=1
    fi

    # start of schedule availability check
    if [[ $EXIT_CODE != 1 ]]; then
        # calling logic checker (if schedule is free)
        source ./schedule_check.sh
    else
        echo "Unavailable schedule assignment."
        echo "Please choose another assignment on next run. Exiting program..."
    fi

    # start of write script
    if [[ $EXIT_CODE != 1 ]]; then
        # calling for writing to database
        # source ./write_schedule.sh
        echo "Success!"
        echo "$NAME from team $TEAM is assigned to $SHIFT, $(cat ./database.json | ./JSONPath.sh -b .[$SHIFT].TIME[0])"
    else
        echo "Error occured. Please try again."
    fi
done