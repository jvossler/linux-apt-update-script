#!/bin/bash

### Changes that still need to be made ###
# 1. Change the system report log location to a 
# neutral/consistent file location to ease sharing.
# 2. Verify error report messages work through 
# intentional erroring out and testing.

list_of_commands=(
'apt update -y'
'apt upgrade -y'
'apt dist-upgrade -y'
'apt full-upgrade -y'
'apt autopurge -y'
'apt autoremove -y'
'apt autoclean -y'
)

system_update(){
for CMD in "${list_of_commands[@]}"
do
	echo "---"
	echo "Running $CMD"
	echo ""
	$CMD

	if
		[ $? -eq 0 ]
	then
		echo "$CMD was successfully run, exit status code: $?"
		echo ""
	elif
		[ $? -ne 0 ]
	then
		echo"ERROR: $CMD was not successful!!! Exit status code $?"
	fi
done	

echo "Exit status code:  $?"

if
	[ $? -eq 0 ]
then
       echo "System successfully updated on $(date)" >> /home/j/scripts/update-log.txt
elif
	[ $? -ne 0 ]
then
       echo "Error running $CMD on $(date), exit status code: $?" >> /home/j/scripts/update-log.txt
fi
}

system_update
