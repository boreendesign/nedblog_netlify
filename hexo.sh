#!/bin/bash
SESSION=$USER

echo "Hello World"

tmux -2 new-session -d -s $SESSION
tmux new-window -t $SESSION:1 -n ''
tmux split-window -h

tmux select-pane -t 1
tmux send-keys "hexo-admin start" C-m
tmux split-window -v
tmux send-keys "hexo generate -w" C-m
tmux split-window -v
tmux send-keys "cd themes/tranquilpeak; npm run start" C-m
tmux select-pane -t 0

tmux -2 attach-session -t $SESSION
