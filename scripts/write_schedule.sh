#!/bin/bash

# for color formatting
RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
YELLOW=$(tput setaf 3)
CYAN=$(tput setaf 6)
NORMAL=$(tput sgr0)
BOLD=$(tput bold) 

# Read the database.json file and update the specific entry using jq
jq --arg name "$NAME" --arg shift "$SHIFT" --arg team "$TEAM" --argjson index "$SCHED_INDEX" \
  '(.[$shift][$team][$index]) |= $name' /data/database.json > /data/temp-database.json

# Replace the original database.json with the updated one
cat /data/temp-database.json > /data/database.json

echo -e "\n\n${BOLD}${GREEN}SUCCESS${NORMAL}\n"
echo "${YELLOW}$NAME${NORMAL} from team ${YELLOW}$TEAM${NORMAL} is assigned to ${YELLOW}$SHIFT${NORMAL} shift, from ${YELLOW}$(cat /data/database.json | ./scripts/JSONPath.sh -b .[$SHIFT].TIME[0])"${NORMAL}  
    