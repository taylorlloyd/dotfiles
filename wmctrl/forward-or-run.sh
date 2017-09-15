TITLE=$1
CMD=$2
echo "Title: $TITLE" > /tmp/log
echo "Cmd: $CMD" >> /tmp/log
if wmctrl -l | grep "$TITLE" > /dev/null
then
  echo "Window Found" >> /tmp/log
  wmctrl -R $TITLE
else
  echo "Starting New Process" >> /tmp/log
  bash -c "$CMD"
fi

