#!/bin/bash

# Start up a preconfigured tmux session layout


# Name of the session
SESSION=$USER
if [ -n "$1" ]; then
  LAYOUT=$1
  SESSION="$SESSION-$LAYOUT"
fi


# Check if session already exists and attach to it.
tmux has-session -t $SESSION
if [ $? -eq 0 ]; then
  echo "Session $SESSION already exists. Attaching."
  sleep 1
  tmux -2 attach -t $SESSION
  exit 0;
fi

echo "Starting session $SESSION"

# Layout pre session create
case $LAYOUT in
"nf")
  cd $HOME/Documents/nf/app;;

"nerdie")
  cd $HOME/Workspace/nerdie;;
esac


# Create new session and detach from it
tmux new-session -d -s $SESSION

# Setup basic layout for the session
tmux new-window -t $SESSION:0 -k -n codez vi
tmux split-window -h -p 40 -t $SESSION:0


# Custom layouts
case $LAYOUT in
"nf")
  tmux new-window -t $SESSION -a -n mysql "mysql -uroot cruisecontrol";;

"nerdie")
  tmux new-window -t $SESSION -a -n irssi irssi;;

*)
  tmux new-window -t $SESSION -a -n scratch
esac


# Select first window and attach the session
tmux select-window -t $SESSION:0
tmux -2 attach -t $SESSION

