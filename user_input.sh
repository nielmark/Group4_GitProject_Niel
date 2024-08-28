#!/bin/bash

cat << "EOF"
   __        __   _                            _
   \ \      / /__| | ___ ___  _ __ ___   ___  | |_ ___
    \ \ /\ / / _ \ |/ __/ _ \| '_ ` _ \ / _ \ | __/ _ \
     \ V  V /  __/ | (_| (_) | | | | | |  __/ | || (_) |
      \_/\_/ \___|_|\___\___/|_| |_| |_|\___|  \__\___/

     ___  ____  ______        _______ ____  _  ______
    / _ \|  _ \/ ___\ \      / / ____|  _ \| |/ / ___|
   | | | | |_) \___ \\ \ /\ / /|  _| | |_) | ' /\___ \
   | |_| |  __/ ___) |\ V  V / | |___|  _ <| . \ ___) |
    \___/|_|   |____/  \_/\_/  |_____|_| \_\_|\_\____/
EOF

echo "============================================================"
echo "---------------- Shift Scheduler Application ---------------"
echo "============================================================"

# Initialized Valid Values
valid_shifts=("MORNING","MID","NIGHT")
valid_teams=("A1","A2","B1","B2","B3")

while true; do
        read -p "Please Enter Your Name: " name
        echo "Good Day $name."
        read -p "Please Enter Your Shift Schedule: " shift

        # Format the inputs to Uppercase
        fmt_shift=$(echo "$shift" | tr '[:lower:]' '[:upper:]')

        # Condition to check if the user input is in the list of accepted values
        if [[ "${valid_shifts[@]}" =~ "$fmt_shift" ]]; then
                echo "Great!"

                read -p "Which Team are you belongs to? (A1,A2,B1,B2,B3): " team
                fmt_team=$(echo "$team" | tr '[:lower:]' '[:upper:]')

                if [[ "${valid_teams[@]}" =~ "$fmt_team" ]]; then
                        echo "Thank you for providing the details needed."

                        read -p "Do you want to add another employee? (Yes or Type Print to finish: " next_action
                        fmt_action=$(echo "$next_action" | tr '[:lower:]' '[:upper:]')

                        if [[ "$fmt_action" == "PRINT" ]]; then
                                echo "Team: $fmt_team"
                                echo "Name: $name", "Shift: $fmt_shift"
                                exit 0
                        fi
                else
                        echo "INVALID TEAM INPUT!"
                        exit 1
                fi
        else
                echo "INVALID SHIFT INPUT!"
                exit 1
        fi
done
