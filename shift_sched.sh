#!/bin/bash

# echoing welcome message
cat welcome.txt

# calling user input checker feature
./user_input.sh

# calling logic checker (if schedule is free)
./schedule_check.sh

# calling for writing to database
./write_schedule.sh

# how can we keep this a forever loop until prompted to exit? A while loop? 