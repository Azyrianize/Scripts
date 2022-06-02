#!/bin/bash

X=0

while [ $X = 0 ]
do
	clear

	echo "------------MENU-------------"
	echo "Prosze wybrac jedna z opcji:"
	echo "(1). Wykonaj test na istnienie pliku"
	echo "(2). Wyciagnij dane z pliku"
	echo "(3). Wyjdz"	
	
	read WYBOR
	echo "Wybrana przez Ciebie opcja to: $WYBOR"

	case "$WYBOR" in
		1)
			X=1			
			echo "Wpisz nazwe pliku do sprawdzenia"
			read fileNAME
			if [ -z $fileNAME ]; then
				echo "Blad! Nic nie zostalo wpisane"
			elif [ -e $fileNAME ]; then
				if [ -d $fileNAME ]; then
					echo "Plik o nazwie $fileNAME istnieje i jest katalogiem"
				elif [ -x $fileNAME ]; then
					echo "Plik o nazwie $fileNAME istnieje i jest to plik wykonywalny"
				elif [ -r $fileNAME ]; then
					echo "Plik o nazwie $fileNAME istnieje i jest to plik do odczytu"
				fi
			else
				echo "Plik o nazwie $fileNAME nie istnieje"		
			fi
			
			echo "Czy chcesz powrocic do wyboru opcji? (Y/N)"
			read OPCJA
			if [ "$OPCJA" = "Y" ] || [ "$OPCJA" = "y" ]; then
				X=0
			else
				exit 0
			fi
			;;
		2)
			echo "Wybrane 2"
			;;
		3)
			echo "Skrypt zostal zakonczony"
			X=1
			exit 0
			;;
		*)
			clear
			echo "Wybrana opcja nie istnieje"
			sleep 1
			;;
	esac

done

