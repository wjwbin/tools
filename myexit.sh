#! /bin/sh
if [ "$STY" != "" ]; then
  echo "In screen, simply detach"
  screen -d $STY
else
  echo "Exit Now!!!"
  date
  logout
fi
