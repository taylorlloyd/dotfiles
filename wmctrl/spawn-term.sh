TITLE=$1
CMD=$2
gnome-terminal --title "$TITLE" -e "$CMD" > /dev/null 2> /dev/null &
