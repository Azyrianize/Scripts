#!/bin/bash

HEIGHT=15
WIDTH=40
CHOICE_HEIGHT=4
BACKTITLE="SYSTEMY OPERACYJNE - MALY SKRYPT: 3"
TITLE="Manipulacja plikami"
MENU="Wybierz jedna z opcji ponizej:"

X=0
while [ $X = 0 ]
do
X=1
OPTIONS=(1 "Pisz do pliku"
         2 "Czytaj z pliku"
	 3 "Usun plik")

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
			zenity --question --text "Czy chcesz stworzyc plik o nazwie (temp.txt)?"
			if [ $? = 0 ]; then
					touch temp.txt
			fi
			PLIK=`zenity --file-selection --title="Wybierz plik"` 
			if [ $? = 1 ]; then
					zenity --info --text "Plik nie zostal wybrany"
			else
					zenity --info --text "Wybrany plik: $PLIK"
					while [ $X = 1 ] 
					do
						TEXT=$(zenity --entry --text "Wpisz text")
						if [ $? = 1 ]; then
							X=0
						fi
						echo $TEXT >> $PLIK			
					done
			fi
			
			X=0
			;;
       		2)
			PLIK=`zenity --file-selection --title="Wybierz plik"` 
			if [ $? = 1 ]; then
					zenity --info --text "Plik nie zostal wybrany"
			else
					zenity --info --text "Wybrany plik: $PLIK"
					dialog --title 'Wiadomosc' --msgbox "`cat $PLIK`" 30 50
					
			fi 
			X=0
			;;
		3)
			PLIK=`zenity --file-selection --title="Wybierz plik"` 
			if [ $? = 1 ]; then
					zenity --info --text "Plik nie zostal wybrany"
			else
					zenity --info --text "Wybrany plik: $PLIK"
					zenity --question --text "Czy na pewno chcesz usunac ten plik?"
					if [ $? = 0 ]; then
						rm $PLIK
						zenity --info --text "Plik pomyslnie usuniety"
					fi	
			fi 
			X=0
			;;
	esac
done

