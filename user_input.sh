#!/bin/bash

# Initialized Valid Values
valid_shifts=("MORNING","MID","NIGHT")
valid_teams=("A1","A2","B1","B2","B3")
special_keywords=("PRINT","RESET")

# Upser Input Starts here...
echo -e "\n\n"
read -p "Please add an employee: " name
fmt_name=$(echo "$name" | tr '[:lower:]' '[:upper:]')  # Format the name to Uppercase

# Condition check if one of the input names is from the special keyword
if [[ "${special_keywords[@]}" =~ "$fmt_name" ]]; then
        export NAME="$fmt_name"
else
        # since name is not a special keyword, only then must shift be asked
        echo -e "\n\nShift Options: MORNING (3AM to 12 PM), MID (11AM to 8PM), NIGHT (7AM to 4AM)\n"
        read -p "Please add his/her shift assignment: " shift
        fmt_shift=$(echo "$shift" | tr '[:lower:]' '[:upper:]')  # Format the shift to Uppercase

        # Condition to check if the user input is in the list of accepted values
        if [[ "${valid_shifts[@]}" =~ "$fmt_shift" ]]; then
                echo -e "\n\nTeam Options: A1, A2, B1, B2, B3\n"
                read -p "Please add $fmt_name's team: " team
                fmt_team=$(echo "$team" | tr '[:lower:]' '[:upper:]')
                if [[ "${valid_teams[@]}" =~ "$fmt_team" ]]; then
                        echo -e "\nThank you for providing the details needed."

                        # Export the inputted details to environment variable.
                        export NAME="$fmt_name"
                        export SHIFT="$fmt_shift"
                        export TEAM="$fmt_team"

                        # Removing this section. User shouldn't need to type yes.
                        # read -p "Add another? (Yes or Type Print to finish: " next_action
                        # fmt_action=$(echo "$next_action" | tr '[:lower:]' '[:upper:]')
                        
                        # export fmt_action

                else
                        echo -e "\nINVALID TEAM INPUT!"
                        exit 1
                fi
        else
                echo -e "\nINVALID SHIFT INPUT!"
                exit 1
        fi

fi

