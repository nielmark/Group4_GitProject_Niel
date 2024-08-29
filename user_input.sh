#!/bin/bash

# Initialized Valid Values
valid_shifts=("MORNING","MID","NIGHT")
valid_teams=("A1","A2","B1","B2","B3")

# Upser Input Starts here...
read -p "Please Add a Name: " name
fmt_name=$(echo "$name" | tr '[:lower:]' '[:upper:]')  # Format the name to Uppercase


read -p "Please Add his/her Shift Schedule: " shift
fmt_shift=$(echo "$shift" | tr '[:lower:]' '[:upper:]')  # Format the shift to Uppercase

# Condition to check if the user input is in the list of accepted values
if [[ "${valid_shifts[@]}" =~ "$fmt_shift" ]]; then
        read -p "Which Team $fmt_name belongs to? (A1,A2,B1,B2,B3): " team
        fmt_team=$(echo "$team" | tr '[:lower:]' '[:upper:]')
        if [[ "${valid_teams[@]}" =~ "$fmt_team" ]]; then
                echo "Thank you for providing the details needed."

                # Export the inputted details to environment variable.
                export NAME="$fmt_name"
                export SHIFT="$fmt_shift"
                export TEAM="$fmt_team"

                read -p "Add another? (Yes or Type Print to finish: " next_action
                fmt_action=$(echo "$next_action" | tr '[:lower:]' '[:upper:]')
                
                export fmt_action

        else
                echo "INVALID TEAM INPUT!"
                exit 1
        fi
else
        echo "INVALID SHIFT INPUT!"
        exit 1
fi

