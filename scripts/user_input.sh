#!/bin/bash

# for color formatting
RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
YELLOW=$(tput setaf 3)
CYAN=$(tput setaf 6)
NORMAL=$(tput sgr0)
BOLD=$(tput bold) 

# Initialized Valid Values
valid_shifts=("MORNING","MID","NIGHT")
valid_teams=("A1","A2","B1","B2","B3")
special_keywords=("PRINT","RESET")

# Upser Input Starts here...
echo -e "\n============================================================\n"
read -p "Please add an employee: ${YELLOW}" name 
echo "${NORMAL}"
fmt_name=$(echo "$name" | tr '[:lower:]' '[:upper:]')  # Format the name to Uppercase
# Condition check if one of the input names is from the special keyword
if [[ "${special_keywords[@]}" =~ "$fmt_name" ]]; then
        export NAME="$fmt_name"
else
        # since name is not a special keyword, only then must shift be asked
        echo -e "\n\nShift Options: ${CYAN}MORNING (3AM to 12 PM)${NORMAL} | ${CYAN}MID (11AM to 8PM)${NORMAL} | ${CYAN}NIGHT (7AM to 4AM)${NORMAL}\n"
        read -p "Please add ${YELLOW}$fmt_name${NORMAL}'s shift assignment: " shift
        fmt_shift=$(echo "$shift" | tr '[:lower:]' '[:upper:]')  # Format the shift to Uppercase

        # Condition to check if the user input is in the list of accepted values
        if [[ "${valid_shifts[@]}" =~ "$fmt_shift" ]]; then
                echo -e "\n\nTeam Options: ${CYAN}A1${NORMAL} | ${CYAN}A2${NORMAL} | ${CYAN}B1${NORMAL} | ${CYAN}B2${NORMAL} | ${CYAN}B3${NORMAL}\n"
                read -p "Please add $fmt_name's team: ${YELLOW}" team
                echo "${NORMAL}"
                fmt_team=$(echo "$team" | tr '[:lower:]' '[:upper:]')
                if [[ "${valid_teams[@]}" =~ "$fmt_team" ]]; then
                        echo -e "\n\nThank you for providing the details needed."

                        # Export the inputted details to environment variable.
                        export NAME="$fmt_name"
                        export SHIFT="$fmt_shift"
                        export TEAM="$fmt_team"
                else
                        echo -e "\n\n${BOLD}${RED}FAILED${NORMAL}"
                        echo -e "\nInvalid team assignment."
                        echo -e "\nPlease choose another assignment on next run. Exiting program...\n"
                        exit 1
                fi
        else
                echo -e "\n\n${BOLD}${RED}FAILED${NORMAL}"
                echo -e "\nInvalid shift assignment."
                echo -e "\nPlease choose another assignment on next run. Exiting program...\n"
                exit 1
        fi

fi

