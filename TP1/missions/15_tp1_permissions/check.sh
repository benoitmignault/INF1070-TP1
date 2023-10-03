#!/bin/bash
check() {
    NB=257
    COUNT=0
    for f in $(ls "$GASH_HOME/data")
    do
	COUNT=$((COUNT+1))
	if stat -c '%A' "$GASH_HOME/data/$f" | grep -E '^----.*' > /dev/null 2>&1 
	then 
            echo "Vous avez au moins raté le fichier data/$f"
            return 1
	fi
    done
    if [ ! $COUNT -eq $NB ]
    then
	echo "Le nombre de fichiers restant dans data/ n'est pas bon!"
	return 1
    fi
    return 0
}

if  check
then 
    true
else
    cd
    echo "Vous voila revenu au point de départ... Veuillez recommencer la mission."
    false
fi
