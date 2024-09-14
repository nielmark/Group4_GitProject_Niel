#!/bin/bash

cat /data/EMPTY-database.json > /data/database.json

echo -e "\n\n${BOLD}${GREEN}SUCCESS${NORMAL}"
echo -e "\nWorking database has been reset!"
echo -e "\nPlease add a new schedule."
