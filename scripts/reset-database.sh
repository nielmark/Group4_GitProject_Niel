#!/bin/bash

cat ./database/EMPTY-database.json > ./database/database.json

echo -e "\n\n${BOLD}${GREEN}SUCCESS${NORMAL}"
echo -e "\nWorking database has been reset!"
echo -e "\nPlease add a new schedule."
