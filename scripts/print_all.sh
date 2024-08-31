#!/bin/bash
#database=$(cat ./database/sample-database.json) #TESTING
database=$(cat ./database/database.json)
teams=( "A1" "A2" "B1" "B2" "B3")
shifts=( "MORNING" "MID" "NIGHT" )

# for color formatting
RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
YELLOW=$(tput setaf 3)
CYAN=$(tput setaf 7)
NORMAL=$(tput sgr0)
BOLD=$(tput bold) 

printf "\n"
for team in ${teams[@]}
do
    printf "%-28s %-10s %-15s\n" "${YELLOW}TEAM $team" "SHIFT" "TIME${NORMAL}"
    for shift in ${shifts[@]}
    do
        for index in {0..1}
        do
            if [ "$(echo "$database" | ./scripts/JSONPath.sh -b .$shift.$team[$index])" == "EMPTY" ]
            then
                printf "%-28s %-10s %-15s\n" "${RED}VACANT" "$shift" "$(echo "$database" | ./scripts/JSONPath.sh -b .$shift.'TIME')${NORMAL}"
                # printf "%-28s %-10s %-15s\n" "${RED}VACANT" "VACANT" "VACANT${NORMAL}" # this vacant to all columns if vacant
            else
                printf "%-28s %-10s %-15s\n" "${GREEN}$(echo "$database" | ./scripts/JSONPath.sh -b .$shift.$team[$index])" "$shift" "$(echo "$database" | ./scripts/JSONPath.sh -b .$shift.'TIME')${NORMAL}"
            fi
            
        done
    done
    printf "\n"
done

# exiting the program
exit 1
