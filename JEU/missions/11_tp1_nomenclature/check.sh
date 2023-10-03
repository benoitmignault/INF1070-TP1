#!/bin/bash

check() {
    # Parcourir tous les fichiers du répertoire windows et vérifier leur nomenclature 
    find windows/ -type f -print0 | while read -d $'\0' file
    do 
	count=$(echo "$file" | grep -E -c 'windows/[a-z]{4}_[a-z]{4}_[a-z]{4}-[0-9]{1,3}')
	if [ ! "$count" == 1 ]
	then
	    echo "Le fichier $file n'a pas été correctement renommé."
	    return 1
	fi
    done
    return $?
}

if  check
then 
    true
else
    cd
    echo "Vous voila revenu au point de départ... Veuillez recommencer la mission."
    false
fi
