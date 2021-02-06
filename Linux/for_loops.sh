#!/bin/bash

states=("Hawaii" "Washington_DC" "New_York" "California" "Florida")

for state in $states
do
	if [ $state = "Hawaii" ]
	then
		echo "Hawaii is the best!"
	else
		echo "I'm not fond of Hawaii"
	fi
done	

nums=({0..9})

for num in ${nums[@]}
do	
	if [ $num = 3 ]
	then
		echo "3"
	else
		if [ $num = 5 ]
		then 
			echo "5"
		else
			if [ $num = 7 ]
			then 
				echo "7"
			fi
		fi
	fi

done

var= ls

for x in $var
do
	echo "x"
done

var2= find /home -type f -perm 777 2> /dev/null

for x in $var2
do
	echo "x"
done
