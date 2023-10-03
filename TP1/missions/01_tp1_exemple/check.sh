#!/bin/bash

check() {
    G='\033[0;92m'
    NC='\033[0m'
    if [ ! -f exemple.txt ]
    then
        echo -e "\nLe fichier ${G}exemple.txt${NC} n'existe pas!"
        return 1
    fi
	d=$(diff -w -B exemple.txt - <<- EXEMPLE
	alpha
	beta
	gamma
	EXEMPLE
	)
	echo $d
	if [ "$d" ]
    then
        echo -e "\nLe fichier ${G}exemple.txt${NC} ne contient pas les lignes souhaitées!"
        return 1
    fi
    return 0
}

if  check
then
    true
else
   echo -e  "\nLa mission a été réinitialisée. Veuillez recommencer..."
   cd
   false
fi


