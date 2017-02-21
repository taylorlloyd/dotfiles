#!/bin/bash

# Load bash settings
echo "Installing Bash Settings"
cd bash
./setup.sh
cd ..
# Load ViM settings
echo "Installing ViM Settings"
cd vim
./setup.sh
cd ..
# Load tmux settings
echo "Installing tmux Settings"
cd tmux
./setup.sh
cd ..
