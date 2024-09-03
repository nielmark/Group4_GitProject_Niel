# for color formatting
RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
YELLOW=$(tput setaf 3)
CYAN=$(tput setaf 6)
NORMAL=$(tput sgr0)
BOLD=$(tput bold) 

echo -e "This is a schedule maker application that aides in  managing"
echo -e "and creating schedules. The app is  set  to  be continuously"
echo -e "running, it defaults in prompting for  a  name  input  to be"
echo -e "assigned a schedule.                                         \n"
echo -e "Input any name or a set of string of names  to  be  prompted"
echo -e "for a schedule assignment.                                   \n"
echo -e "Here's a list of special commands that  can  be  used  as an"
echo -e "input for extended functionality:                            \n"
echo -e "${YELLOW}PRINT${NORMAL} - prints the entirety of  the  schedule  created. Once"
echo -e "        called, the program exits.                           \n"
echo -e "${YELLOW}RESET${NORMAL} - resets the schedule record to a blank slate. \n"
