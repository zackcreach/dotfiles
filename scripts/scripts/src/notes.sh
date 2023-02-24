#!/bin/bash

# PROMPTS
# echo -n 'What action do you want to perform?'
# read ACTION
# echo "Now performing $ACTION"

# DO WHILE
# for X in {A..Z}; do echo $X; done #prints A to Z
# while true; do node server.js; done #automatically restart node server if it crashes!

# "INSTALL" SCRIPT INTO PATH
# sudo sp ~/scripts/src/SCRIPT.SH ~/scripts/bin/COMMAND_NAME

# PERMISSIONS
# chmod 000 filename
# 4 adds read
# 2 adds write
# 1 adds execute
# - --- --- ---
# * RWX RWX RWX
# * is a special character
# U G O – User, Group, Other

# EXIT CODES
# $? is the variable that tests if the last command ran successfully.
# If it's any other number than 0, it failed
# Use the test command to test things as expressions. For example:
# test -f cool.txt, then you can echo $? to see if it that file exists or not

