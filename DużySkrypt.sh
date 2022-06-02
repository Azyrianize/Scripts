#!/bin/bash

HEIGHT=15
WIDTH=40
CHOICE_HEIGHT=4
BACKTITLE="SYSTEMY OPERACYJNE - DUZY SKRYPT"
TITLE="Zarzadzanie procesami"
MENU="Wybierz jedna z opcji ponizej:"

X=0
while [ $X = 0 ]
do
X=1
OPTIONS=(1 "Przejrzyj aktywne procesy"
         2 "Sprawdz status procesu"
	 3 "Zakoncz proces"
	 4 "Zmien priorytet procesu"
	 5 "Wyswietl przestrzen dyskowa"
	 6 "Wyswietl uzywana pamiec RAM")

CHOICE=$(dialog --clear \
                --backtitle "$BACKTITLE" \
                --title "$TITLE" \
                --menu "$MENU" \
                $HEIGHT $WIDTH $CHOICE_HEIGHT \
                "${OPTIONS[@]}" \
                2>&1 >/dev/tty)

	clear
	case $CHOICE in
		1)
			ps aux
			echo "---------------------------------------------------------"
			echo ""
			echo "Czy chcesz wyjsc do menu glownego? Jesli tak to kliknij enter."
			read WYBOR
			X=0
			;;
       		2)
			echo "Wpisz PID procesu ktorego status chcesz sprawdzic."
			read PID
			echo "---------------------------------------------------------"
			ps $PID			
			echo "---------------------------------------------------------"
			echo ""
			echo "Czy chcesz wyjsc do menu glownego? Jesli tak to kliknij enter."
			read WYBOR
			X=0
			;;
		3)
			echo "Wpisz PID procesu ktory chcesz zakonczyc"
			read PID
			echo "---------------------------------------------------------"
			kill $PID			
			echo "---------------------------------------------------------"
			echo ""
			echo "Czy chcesz wyjsc do menu glownego? Jesli tak to kliknij enter."
			read WYBOR
			X=0
			;;
		4)
			echo "Wpisz PID procesu ktorego proces chcesz zmienic"
			read PID
			echo "Wpisz 'nice value' procesu ktory odzwierciedla priorytet danego procesu."
			echo "Jakakolwiek liczba pomiedzy -20 a 19 bedzie prawidlowa."
			echo "Mniejsza liczba znaczy wyzszy priorytet."
			read NICEVALUE
			echo "---------------------------------------------------------"
			renice $NICEVALUE -p $PID			
			echo "---------------------------------------------------------"
			echo ""
			echo "Czy chcesz wyjsc do menu glownego? Jesli tak to kliknij enter."
			read WYBOR
			X=0
			;;
		5)
			clear			
			df -h
			echo ""
			echo "---------------------------------------------------------"
			echo "Czy chcesz wyjsc do menu glownego? Jesli tak to kliknij enter."
			read WYBOR
			X=0
			;;
		6)
			clear			
			free -g
			echo ""
			echo "---------------------------------------------------------"
			echo "Czy chcesz wyjsc do menu glownego? Jesli tak to kliknij enter."
			read WYBOR
			X=0
			;;
	esac
done

