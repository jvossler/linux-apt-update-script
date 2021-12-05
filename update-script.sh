#!/bin/bash
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
		$CMD
		if
			[ $? -eq 0 ]
		then
			echo "$CMD was successfully run, exit status code: $?"
			echo ""
		elif
			[ $? -ne 0 ]
		then
			echo "Error running $CMD on $(date), exit status code: $?" >> /home/j/scripts/update-log.txt
			continue
		fi
		echo "Exit status code: $?"
	done	
}

system_update


