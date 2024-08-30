#!/bin/bash

# Read the database.json file and update the specific entry using jq
jq --arg name "$NAME" --arg shift "$SHIFT" --arg team "$TEAM" --argjson index "$SCHED_INDEX" \
  '(.[$shift][$team][$index]) |= $name' ./database/database.json > ./database/temp-database.json

# Replace the original database.json with the updated one
cat ./database/temp-database.json > ./database/database.json

echo -e "\n\nSUCCESS!\n"
echo "$NAME from team $TEAM is assigned to $SHIFT shift, $(cat ./database/database.json | ./scripts/JSONPath.sh -b .[$SHIFT].TIME[0])"  
    