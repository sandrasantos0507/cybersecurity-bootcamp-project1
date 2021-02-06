#!/bin/bash
#BlackJack_Dealer_FNAME LAST	Roulette_Dealer_FNAME LAST	Texas_Hold_EM

#Note I will assume input such as:
#./roulette_dealer_finder_by_time_and_game.sh 0310 08:00:00 AM BlackJack
#./roulette_dealer_finder_by_time_and_game.sh 0310 08:00:00 AM Roulette
#./roulette_dealer_finder_by_time_and_game.sh 0310 08:00:00 AM Texas_Hold_EM

if [ $4 == "BlackJack" ]
then
	echo "Hour AM/PM	BlackJack_Dealer_FNAME LAST"
	awk -F" " '{print($1, $2, $3, $4)}' $1_Dealer_schedule | grep -E "$2 $3"
fi

if [ $4 == "Roulette" ]
then
	echo "Hour AM/PM        Roulette_Dealer_FNAME LAST"
	awk -F" " '{print($1, $2, $5, $6)}' $1_Dealer_schedule | grep -E "$2 $3"
fi

if [ $4 == "Texas_Hold_EM" ]
then
	echo "Hour AM/PM        Texas_Hold_EM_Dealer_FNAME LAST"
        awk -F" " '{print($1, $2, $7, $8)}' $1_Dealer_schedule | grep -E "$2 $3"
fi
