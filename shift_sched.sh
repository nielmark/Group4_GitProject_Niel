#!/bin/bash

# echoing welcome message
cat welcome.txt
./banner.sh

# calling user input checker feature
while true; do
    source ./user_input.sh

    # Check if the action is "PRINT"
    if [[ "$fmt_action" == "PRINT" ]]; then
    #   Add you print script here 
        echo $NAME
        exit 0
    fi

# calling logic checker (if schedule is free)
source ./schedule_check.sh

# # calling for writing to database
source ./write_schedule.sh

# how can we keep this a forever loop until prompted to exit? A while loop? 
done