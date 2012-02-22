#!/bin/bash

# Default name of the session
SESSION=$USER

# Check if session already exists and attach to it.
tmux has-session -t $SESSION
if [ $? -eq 0 ]; then
  echo "Session $SESSION already exists. Attaching."
  sleep 1
  tmux -2 attach -t $SESSION
  exit 0;
fi

# Create new session and detach from it
tmux new-session -d -s $SESSION

# Setup layout for the session
tmux new-window -t $SESSION:0 -k -n codez vi
tmux split-window -h -p 30 -t $SESSION:0
tmux new-window -t $SESSION -a -n scratch

tmux select-window -t $SESSION:0
tmux -2 attach -t $SESSION

