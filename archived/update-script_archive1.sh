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
	echo "---"
	echo "Running $CMD"
	echo ""
	$CMD

	if
		[ $? -eq 0 ]
	then
		echo "$CMD was successfully run, exit status code: $?"
		echo ""

#	if
#		[ $? -eq 0 ]
#	then
##		echo "System successfully updated on $(date)" >> /home/j/scripts/update-log.txt
#		echo "$CMD was successfully run"
#	else
#		if
#			[ $? -ne 0]
#		then
#			echo "Error running system update command $CMD on $(date)" >> /home/j/scripts/update-log.txt
#		fi
#	fi
	fi
done	
}


system_update
echo "Exit status code:  $?"

if [ $? -eq 0 ]
then
	echo "System successfully updated on $(date)" >> /home/j/scripts/update-log.txt
elif
	[ $? -ne 0 ]
then
	echo "Error running $CMD on $(date), exit status code: $?" >> /home/j/scripts/update-log.txt
fi

#if [ $? -ne 0 ]
#then
#	echo "Error running $CMD on $(date)" >> /home/j/scripts/update-log.txt
#elif 
#	[ $? -eq 0 ]
#then
#		echo "System successfully updated on $(date)" >> /home/j/scripts/update-log.txt
#fi

