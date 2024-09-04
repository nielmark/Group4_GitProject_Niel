#!/bin/bash

# for color formatting
RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
YELLOW=$(tput setaf 3)
CYAN=$(tput setaf 6)
NORMAL=$(tput sgr0)
BOLD=$(tput bold) 

# accepts input for docker
stdin_name=$1
stdin_shift=$2
stdin_team=$3

echo "${NORMAL}"

# initializing dependencies install
./dependencies/dependencies.sh

# echoing welcome message
./banners/banner.sh
./banners/welcome.sh


# initialize getting input from user

if [[ $(echo "$stdin_name" | tr '[:lower:]' '[:upper:]') == "PRINT" ]]
then
    source ./scripts/print_all.sh
elif [[ $(echo "$stdin_name" | tr '[:lower:]' '[:upper:]') == "RESET" ]]    
then
    source ./scripts/reset-database.sh
elif [ -z "$stdin_name" ] | [ -z "$stdin_shift" ] | [ -z "$stdin_team" ]
then
    echo -e "${RED}Failed${NORMAL}"
    echo -e "Please provide name, shift, and team \nex.(docker run shift_sched NAME Morning a1)"
else
    source ./docker/user_input.sh $stdin_name $stdin_shift $stdin_team
    source ./scripts/schedule_check.sh
    source ./scripts/write_schedule.sh
    source ./scripts/print_all.sh
fi