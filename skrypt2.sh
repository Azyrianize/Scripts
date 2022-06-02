#!/bin/bash

X=0

while [ $X = 0 ]
do
	clear

	echo "--------------------MENU---------------------"
	echo "Prosze wybrac jedna z opcji:"
	echo "(1). Sprawdz czy plik istnieje oraz typ pliku"
	echo "(2). Wyszukaj dane z pliku"
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
			clear
			echo "Wpisz nazwe pliku ktory ma byc uzyty:"
			read fileNAME
			
			if [ -e "temp.log" ]; then
				rm temp.log
			fi

			if [ -e $fileNAME ]; then
				clear
				echo "--------------------MENU---------------------"
				echo "Prosze wybrac jedna z opcji:"
				echo "(1). Sprawdz miasta danego kraju"
				echo "(2). Posortuj miasta wzgledem populacji"
				echo "(3). Wyjdz"
				read DECYZJA

				case "$DECYZJA" in
					1)
						echo "Wpisz skrot kraju ktorego miasta chcesz wyszukac"
						read SKROT
						grep "$SKROT" "$fileNAME" | cut -d "," -f 1,4 | sort -t "," -k2 | less
						;;
					2)
						sort -t "," -k4 $fileNAME | less
						;;
					3)

						;;
					*)
						;;
				esac
			else
				echo "Given file doesn't exist"			
			fi
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

