#!/bin/bash

# for color formatting
RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
YELLOW=$(tput setaf 3)
CYAN=$(tput setaf 6)
NORMAL=$(tput sgr0)
BOLD=$(tput bold) 

# Read the database.json file into a variable
database=$(cat /data/database.json)

# Extract the relevant array for the specified team and shift using jq
team_shift_array=$(echo "$database" | ./scripts/JSONPath.sh -b .[$SHIFT].[$TEAM])

# Count the number of filled entries (non-"EMPTY")
filled_entries=$(echo "$team_shift_array" | grep -c -v "EMPTY")

if [ "$filled_entries" -ge 2 ]; then
  # If 2 entries are already filled, exit with code 1
  # echo $filled_entries
  export EXIT_CODE=1
  echo -e "\n\n${BOLD}${RED}FAILED${NORMAL}"
  echo -e "\nUnavailable schedule assignment."
  echo -e "\nPlease choose another assignment on next run. Exiting program...\n"
  exit 1
else
  # Find the index of the first "EMPTY" entry and set SCHED_INDEX
  empty_index=$(echo "$team_shift_array" | grep -n "EMPTY" | cut -d: -f1 | head -n 1)
  export SCHED_INDEX=$((empty_index - 1))
  # this is a checker line, uncomment to test script
  # echo "Name: $NAME, $SHIFT, $(cat ./database.json | ./JSONPath.sh -b .[$SHIFT].TIME[0])"
fi
